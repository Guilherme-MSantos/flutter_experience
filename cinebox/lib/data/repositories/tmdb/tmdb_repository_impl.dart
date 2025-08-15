import 'dart:developer';

import 'package:cinebox/core/result/result.dart';
import 'package:cinebox/data/exception/data_exception.dart';
import 'package:cinebox/data/mappers/movie_mappers.dart';
import 'package:cinebox/data/services/tmdb/tmdb_service.dart';
import 'package:cinebox/domain/models/genre.dart';

import 'package:cinebox/domain/models/movie.dart';

import './tmdb_repository.dart';

import 'package:dio/dio.dart';

class TmdbRepositoryImpl implements TmdbRepository {
  final TmdbService _tmdbService;

  TmdbRepositoryImpl({required TmdbService tmdbService})
    : _tmdbService = tmdbService;

  @override
  Future<Result<List<Movie>>> getPopularMovies({
    String language = 'pt-BR',
    int page = 1
  }) async {
    try {
      final moviesData = await _tmdbService.getPopularMovies(
        language: language,
        page: page,
      );
      
      return Success(MovieMappers.mapToMovies(moviesData)) ;
    } on DioException catch (e,s) {
     log('ERRO ao buscar getPopularMovies',error: e , stackTrace: s) ;
     return Failure(DataException(message: 'Erro ao buscar os filmes  populares'));
    }
  }

  @override
  Future<Result<List<Movie>>> getTopRatedMovies({
    String language = 'pt-BR',
    int page = 1
  }) async {
    try {
      final moviesData = await _tmdbService.getTopRatedMovies(
        language: language,
        page: page,
      );

      return Success(MovieMappers.mapToMovies(moviesData)) ;
    } on DioException catch (e,s) {
      log('ERRO ao buscar getTopRatedMovies',error: e , stackTrace: s) ;
      return Failure(DataException(message: 'Erro ao buscar os filmes  mais bem votados'));
    }
  }

  @override
  Future<Result<List<Movie>>> getNowPlayingMovies({
    String language = 'pt-BR',
    int page = 1
  }) async {
    try {
      final moviesData = await _tmdbService.getNowPlayingMovies(
        language: language,
        page: page,
      );

      return Success(MovieMappers.mapToMovies(moviesData)) ;
    } on DioException catch (e,s) {
      log('ERRO ao buscar getNowPlayingMovies',error: e , stackTrace: s) ;
      return Failure(DataException(message: 'Erro ao buscar os filmes  em cartaz'));
    }
  }

  @override
  Future<Result<List<Movie>>> getUpComingMovies({
    String language = 'pt-BR',
    int page = 1
  }) async {
    try {
      final moviesData = await _tmdbService.getUpcomingMovies(
        language: language,
        page: page,
      );

      return Success(MovieMappers.mapToMovies(moviesData)) ;
    } on DioException catch (e,s) {
      log('ERRO ao buscar getUpcomingMovies',error: e , stackTrace: s) ;
      return Failure(DataException(message: 'Erro ao buscar os filmes  que virão'));
    }
  }

  @override
  Future<Result<List<Genre>>> getGenres() async {
  try {
    final data = await _tmdbService.getMoviesGenres() ;
    final genres = data.genres.map((g)=> Genre(id: g.id, name: g.name)).toList();
    
    return Success(genres) ; 
  } on DioException catch (e,s) {
    log('ERRO ao buscar gênero.',error: e,stackTrace: s) ;
    return  Failure(DataException(message: 'Erro ao buscar gêneros de filmes')) ;
  }
  }

  @override
  Future<Result<List<Movie>>> getMoviesByGenres({required int genreId}) async {
    try {
      final data = await _tmdbService.discoverMovies(withGenres: genreId.toString());

      return Success(MovieMappers.mapToMovies(data)) ;
    } on DioException catch (e,s) {
      log('ERRO ao buscar filmes por gênero.',error: e,stackTrace: s) ;
      return  Failure(DataException(message: 'Erro ao buscar filmes por gênero')) ;
    }
  }

  @override
  Future<Result<List<Movie>>> searchMovies({required String query}) async {
    try {
      final data = await _tmdbService.searchMovies(query: query);

      return Success(MovieMappers.mapToMovies(data)) ;
    } on DioException catch (e,s) {
      log('ERRO ao buscar filmes por nome.',error: e,stackTrace: s) ;
      return  Failure(DataException(message: 'Erro ao buscar filmes por nome')) ;
    }
  }
}
