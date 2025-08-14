import 'package:cinebox/ui/Movies/widgets/genres_box.dart';
import 'package:cinebox/ui/Movies/widgets/movies_appbar.dart';
import 'package:cinebox/ui/Movies/widgets/movies_by_genre.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'widgets/movies_by_category.dart';

class MoviesScreen extends ConsumerStatefulWidget {
  const MoviesScreen({super.key});

  @override
  ConsumerState<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends ConsumerState<MoviesScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        MoviesAppbar(),
        SliverToBoxAdapter(
          child: Container(
              margin:EdgeInsets.only(top: 22 ) ,
              child: GenresBox()),
        ),
        SliverToBoxAdapter(
          child:MoviesByGenre() ,
        )
      ],
    );
  }
}
