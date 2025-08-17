import 'package:cinebox/ui/Movie_Details/commands/get_movie_details_command.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_details_view_model.g.dart';
class MovieDetailViewModel {
  final GetMovieDetailsCommand _getMovieDetailsCommand;

  MovieDetailViewModel({required GetMovieDetailsCommand getMovieDetailsCommand})
    : _getMovieDetailsCommand = getMovieDetailsCommand;

  Future<void> fetchMovieDetails(int movieId) async {
    _getMovieDetailsCommand.execute(movieId);
  }
}

@riverpod
MovieDetailViewModel movieDetailViewModel(Ref ref) {
  return MovieDetailViewModel(
    getMovieDetailsCommand: ref.read(getMovieDetailsCommandProvider.notifier),
  );
}
