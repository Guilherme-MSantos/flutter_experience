import 'package:cinebox/ui/Movies/widgets/movies_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MoviesByGenre extends ConsumerStatefulWidget {
  const MoviesByGenre({super.key});

  @override
  ConsumerState<MoviesByGenre> createState() => _MoviesByGenreState();
}

class _MoviesByGenreState extends ConsumerState<MoviesByGenre> {
  @override
  Widget build(BuildContext context) {
    return Container(
         margin: EdgeInsets.only(bottom: 130),
        child: MoviesBox(title: 'Filmes Encontrados',vertical: true,));
  }
}
