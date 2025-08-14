import 'package:json_annotation/json_annotation.dart';
import 'package:cinebox/data/models/movie_item.dart';

part 'movie_response.g.dart';

@JsonSerializable()
class MovieResponse{
  final int page ;
  final List<MovieItem> results ;
  final int totalResults;
  final int totalPages ;

  MovieResponse( {
  required this.page,
  required this.results,
  required this.totalResults,
  required this.totalPages,
});

  factory MovieResponse.fromJson(Map<String,dynamic> json) => _$MovieResponseFromJson(json) ;


  Map<String,dynamic> toJson() => _$MovieResponseToJson(this) ;
}
