import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pipocando/errors/movie_error.dart';
import 'package:pipocando/models/movie_response_model.dart';
import 'package:pipocando/repositories/movie_repository.dart';

void main() {
  final _repository = MovieRepository();

  test('Should get all popular movies', () async {
    final result = await _repository.fetchAllMovies(1);
    expect(result.isRight(), true);
    expect(result.fold(id, id), isA<MovieResponseModel>());
  });

  test('Should error to get all popular movies', () async {
    final result = await _repository.fetchAllMovies(1000);
    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<MovieError>());
  });
}
