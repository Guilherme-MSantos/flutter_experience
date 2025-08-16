import 'package:cinebox/ui/Movies/commands/get_movies_by_genre_command.dart';
import 'package:cinebox/ui/Movies/widgets/movies_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MoviesByGenre extends ConsumerWidget {
  const MoviesByGenre({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchMovies = ref.watch(getMoviesByGenreCommandProvider);

    return searchMovies.when(
      loading: () => Center(
        child: CircularProgressIndicator(),
      ),
      error: (error,stackTrace)=> Center(child: Text('Erro ao buscar filmes por gênero'),),
      data: (data){
        return Container(
          margin: EdgeInsets.only(bottom: 130),
          child: MoviesBox(
            key: UniqueKey(),
            title: 'Filmes Encontrados busca',
            vertical: true,
            movies: data,
          ),
        );
      },
    );

  }
}
