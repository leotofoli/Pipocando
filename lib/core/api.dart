import 'package:dio/dio.dart';

const kBaseUrl = 'https://api.themoviedb.org/3';
const kApiKey =
    'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjZmQzNDgzNzc3N2FmZWRjY2Y2ODg4MTliMDY1ZWY1MyIsInN1YiI6IjYyYzZjYjQ5NzA2YjlmMDA0ZDM0OTZkYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.U3_YD-xdNTThdM3eMZBbjknjOqzS38x0PbPeWzfdlUc';

const kServerError = 'Failed to connect to the server. Try again later.';
final kDioOptions = BaseOptions(
  baseUrl: kBaseUrl,
  connectTimeout: 5000,
  receiveTimeout: 3000,
  contentType: 'application/json;charset=utf-8',
  headers: {'Authorization': 'Bearer $kApiKey'},
);