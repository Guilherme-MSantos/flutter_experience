import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinebox/ui/Movie_Details/widgets/cast_box.dart';
import 'package:cinebox/ui/Movie_Details/widgets/movie_trailer.dart';
import 'package:cinebox/ui/Movie_Details/widgets/rating_panel.dart';
import 'package:cinebox/ui/core/themes/colors.dart';
import 'package:cinebox/ui/core/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';

class MovieDetailsScreen extends ConsumerStatefulWidget {
  const MovieDetailsScreen({super.key});

  @override
  ConsumerState<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends ConsumerState<MovieDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 24,
          children: [
            SizedBox(
              height: 278,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (ctx, index) {
                  return Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: CachedNetworkImage(
                      imageUrl:
                          'https://m.media-amazon.com/images/M/MV5BNDA3ODNhZTItY2QzNy00MmJlLTg0ZDMtNWI5MmJlZDZjZmQzXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg',
                      placeholder: (ctx, url) => Container(
                        width: 160,
                        color: AppColors.lightGrey,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                      errorWidget: (ctx, url, error) => Icon(Icons.error),
                    ),
                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8,
                children: [
                  Text(
                    'Title',
                    style: AppTextStyles.titleLarge,
                  ),
                  RatingStars(
                    starCount: 5,
                    starColor: AppColors.yellow,
                    starSize: 14,
                    valueLabelVisibility: false,
                    value: 4.5,
                  ),
                  Text(
                    'Animação, Fantasia',
                    style: AppTextStyles.lightGreyRegular,
                  ),
                  Text('2013 (JP) | 1h41', style: AppTextStyles.regularSmall),
                  Text(
                    'No passado, Yami Yugi e Seto Kaiba se enfrentaram em inúmeras ocasiões. '
                    'Yami Yugi, que habita dentro do corpo de Yugi Muto, e Kaiba vão duelar novamente, '
                    'e esta será uma batalha em que os dois terão seu orgulho e experiência colocados à prova.',
                    style: AppTextStyles.regularSmall,
                  ),
                  CastBox() ,
                  MovieTrailer(),
                  SizedBox(height: 30),
                  RatingPanel(voteAverage: 4.5, voteCount: 5000)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
