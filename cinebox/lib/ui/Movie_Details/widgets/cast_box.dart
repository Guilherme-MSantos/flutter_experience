import 'package:cinebox/ui/Movie_Details/widgets/actor_card.dart';
import 'package:cinebox/ui/core/themes/colors.dart';
import 'package:cinebox/ui/core/themes/text_styles.dart';
import 'package:flutter/material.dart';

class CastBox extends StatelessWidget {
  const CastBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(
        context,
      ).copyWith(dividerColor: AppColors.lightGrey.withAlpha(25)),
      child: ExpansionTile(
        dense: true,
        tilePadding: EdgeInsets.only(left: 0, right: 0),
        childrenPadding: EdgeInsets.symmetric(vertical: 10),
        title: Text(
          'Elenco',
          style: AppTextStyles.regularSmall,
        ),
        children: [
          SizedBox(
            height: 150,
            child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, index) {
                return ActorCard(
                  imageUrl:  'https://m.media-amazon.com/images/M/MV5BNDA3ODNhZTItY2QzNy00MmJlLTg0ZDMtNWI5MmJlZDZjZmQzXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg',
                    character: 'teste',
                  name: 'teste',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
