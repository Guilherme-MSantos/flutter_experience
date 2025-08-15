import 'package:cinebox/ui/Movies/commands/search_movies_by_name_command.dart';
import 'package:cinebox/ui/Movies/widgets/movies_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MoviesBySearch extends ConsumerStatefulWidget {
  const MoviesBySearch({super.key});

  @override
  ConsumerState<MoviesBySearch> createState() => _MoviesBySearchState();
}

class _MoviesBySearchState extends ConsumerState<MoviesBySearch> {
  @override
  Widget build(BuildContext context) {
    final moviesResult = ref.watch(searchMoviesByNameCommandProvider);

    return moviesResult.when(
      loading: () => Center(
        child: CircularProgressIndicator(),
      ),
      error: (error,stackTrace)=> Center(child: Text('Erro ao buscar filmes'),),
      data: (data){
        return Container(
          margin: EdgeInsets.only(bottom: 130),
          child: MoviesBox(
            title: 'Filmes Encontrados',
            vertical: true,
            movies: data,
          ),
        );
      },
    );

  }
}
