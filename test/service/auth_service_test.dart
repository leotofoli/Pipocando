import 'package:pipocando/services/auth_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rxdart/rxdart.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pipocando/models/user_reponse.dart';
import './mock.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'dart:core';

class MockUser extends Mock implements User {}

class MockUserCredential extends Mock implements UserCredential {}

final MockUser _mockUser = MockUser();

class MockFirebaseAuth extends Mock implements FirebaseAuth {
  @override
  Stream<User> authStateChanges() {
    return Stream.fromIterable([
      _mockUser,
    ]);
  }
}

void main() {
  setupFirebaseAuthMocks();
  late MockUserCredential mockCredential;
  late MockUser mockUser;

  setUp(() {
    mockUser = MockUser();
    mockCredential = MockUserCredential();
    when(mockCredential.user).thenReturn(mockUser);
  });
  setUpAll(() async {
    await Firebase.initializeApp();
  });

  final MockFirebaseAuth mockFirebaseAuth = MockFirebaseAuth();
  final Auth auth = Auth(auth: mockFirebaseAuth);
  setUp(() {});
  tearDown(() {});

  test("emit occurs", () async {
    expectLater(auth.user, emitsInOrder([_mockUser]));
  });

  test("create account", () async {
    when(
      mockFirebaseAuth.createUserWithEmailAndPassword(
          email: "tadas@gmail.com", password: "123456"),
    ).thenAnswer((_) async => mockCredential);

    expect(await auth.createAccount("tadas@gmail.com", "123456"), "Success");
  });

  test("create account exception", () async {
    when(
      mockFirebaseAuth.createUserWithEmailAndPassword(
          email:  "tadas@gmail.com", password:  "123456"),
    ).thenAnswer((realInvocation) =>
        throw FirebaseAuthException(message: "You screwed up", code: "500"));

    expect(
        await auth.createAccount("tadas@gmail.com", "123456"),
        "You screwed up");
  });

  test("sign in", () async {
    when(
      mockFirebaseAuth.signInWithEmailAndPassword(
          email: "tadas@gmail.com", password: "123456"),
    ).thenAnswer((_) async => mockCredential);

    expect(await auth.signIn("tadas@gmail.com", "123456"),
        "Success");
  });

  test("sign in exception", () async {
    when(
      mockFirebaseAuth.signInWithEmailAndPassword(
          email: "tadas@gmail.com", password: "123456"),
    ).thenAnswer((realInvocation) =>
        throw FirebaseAuthException(message: "You screwed up", code: "500"));

    expect(await auth.signIn("tadas@gmail.com", "123456"),
        "You screwed up");
  });

  test("sign out", () async {
    when(
      mockFirebaseAuth.signOut(),
    ).thenAnswer((_) async => mockCredential);

    expect(await auth.signOut(), "Success");
  });

  test("create account exception", () async {
    when(
      mockFirebaseAuth.signOut(),
    ).thenAnswer((realInvocation) =>
        throw FirebaseAuthException(message: "You screwed up", code: "500"));

    expect(await auth.signOut(), "You screwed up");
  });
}
