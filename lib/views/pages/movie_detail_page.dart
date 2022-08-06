import 'package:flutter/material.dart';
import 'package:pipocando/views/widgets/chip_companies.dart';
import 'package:pipocando/views/widgets/chip_genres.dart';
import 'package:pipocando/views/widgets/chip_language.dart';

import '../../controllers/movie_detail_controller.dart';
import '../../views/widgets/centered_message.dart';
import '../../views/widgets/centered_progress.dart';
import '../../views/widgets/chip_date.dart';
import '../../views/widgets/rate.dart';

class MovieDetailPage extends StatefulWidget {
  final int movieId;

  MovieDetailPage(this.movieId);

  @override
  _MovieDetailPageState createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  final _controller = MovieDetailController();

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  _initialize() async {
    setState(() {
      _controller.loading = true;
    });

    await _controller.fetchMovieById(widget.movieId);

    setState(() {
      _controller.loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildMovieDetail(),
    );
  }

  _buildAppBar() {
    return AppBar(
      title: Text(_controller.movieDetail?.title ?? ''),
    );
  }

  _buildMovieDetail() {
    if (_controller.loading) {
      return CenteredProgress();
    }

    if (_controller.movieError != null) {
      return CenteredMessage(message: _controller.movieError!.message);
    }

    return ListView(
      children: [
        _buildCover(),
        _buildStatus(),
        _buildGenres(),
        _buildCompanies(),
        _buildOverview(),
      ],
    );
  }

  _buildCompanies() {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ChipCompanies(companies: _controller.movieDetail!.productionCompanies)
        ],
      ),
    );
  }

  _buildGenres() {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ChipGenre(genres: _controller.movieDetail!.genres)
        ],
      ),
    );
  }

  _buildOverview() {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: Text(
        _controller.movieDetail!.overview,
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.bodyText2,
      ),
    );
  }

  _buildStatus() {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Rate(_controller.movieDetail!.voteAverage),
          ChipLanguage(language: _controller.movieDetail!.originalLanguage),
          ChipDate(date: _controller.movieDetail!.releaseDate)
        ],
      ),
    );
  }

  _buildCover() {
    return Image.network(
      'https://image.tmdb.org/t/p/w500${_controller.movieDetail!.backdropPath}',
    );
  }
}
