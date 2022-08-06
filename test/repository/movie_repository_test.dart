import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pipocando/utils/errors/movie_error.dart';
import 'package:pipocando/models/movie_response_model.dart';
import 'package:pipocando/repositories/movie_repository.dart';
import 'package:pipocando/models/movie_detail_model.dart';

void main() {
  final _repository = MovieRepository();

  test('Should get all popular movies', () async {
    final result = await _repository.fetchAllMovies(1);
    expect(result.isRight(), true);
    expect(result.fold(id, id), isA<MovieResponseModel>());
  });

  test('Should error to get all popular movies', () async {
    final result = await _repository.fetchAllMovies(5010);
    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<MovieError>());
  });

  test('Should get get specific movie', () async {
    final result = await _repository.fetchMovieById(634649);
    expect(result.isRight(), true);
    expect(result.fold(id, id), isA<MovieDetailModel>());
  });

  test('Should error to get specific movie', () async {
    final result = await _repository.fetchMovieById(111634649);
    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<MovieError>());
  });
}
