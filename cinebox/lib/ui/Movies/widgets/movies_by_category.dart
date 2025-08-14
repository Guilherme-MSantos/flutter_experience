import 'package:cinebox/ui/Movies/widgets/movies_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MoviesByCategory extends ConsumerStatefulWidget {
  const MoviesByCategory({super.key});

  @override
  ConsumerState<MoviesByCategory> createState() => _MoviesByCategoryState();
}

class _MoviesByCategoryState extends ConsumerState<MoviesByCategory> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 130),
      child: Column(
        children: [
          MoviesBox(title: 'Mais Populares',) ,
          MoviesBox(title: 'Top Filmes',)
        ],
      ),
    );
  }
}
