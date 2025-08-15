import 'dart:async';

import 'package:cinebox/ui/Movies/movies_view_model.dart';
import 'package:cinebox/ui/core/themes/colors.dart';
import 'package:cinebox/ui/core/themes/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MoviesAppbar extends ConsumerStatefulWidget {
  const MoviesAppbar({super.key});

  @override
  ConsumerState<MoviesAppbar> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends ConsumerState<MoviesAppbar> {
  Timer? _debounce;
  final _searchController = TextEditingController();
final _showClearButton = ValueNotifier<bool>(false) ;
  void onSearchChanged(String query) {
    if (query.isEmpty) {
      _debounce?.cancel();
      ref.read(moviesViewModelProvider.notifier).fetchMoviesByCategory();
      return;
    }
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(Duration(milliseconds: 500), () {
      FocusScope.of(context).unfocus() ;
      ref.read(moviesViewModelProvider.notifier).fetchMoviesBySearch(query);
    });
  }

  @override
  void initState() {
    super.initState();
    _searchController.addListener((){
    _showClearButton.value = _searchController.text.isNotEmpty ;
    }) ;
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: MediaQuery.sizeOf(context).height * .25,
      foregroundColor: Colors.black,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset(
          R.ASSETS_IMAGES_SMALL_BANNER_PNG,
          fit: BoxFit.cover,
        ),
        titlePadding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
        title: SizedBox(
          height: 36,
          child: TextFormField(
            controller: _searchController,
            onChanged: onSearchChanged,
            style: TextStyle(
              color: Colors.grey[600],
              fontWeight: FontWeight.w400,
              fontSize: 12,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide.none,
              ),
              hintText: "Procurar Filme",
              hintStyle: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.grey[600],
              ),
              prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Icon(
                  Icons.search,
                  color: Colors.grey[600],
                  size: 15,
                ),
              ),
              suffixIcon: ValueListenableBuilder(
                valueListenable: _showClearButton,
                builder: (_, value, _) {
                  return Visibility(
                    visible: value,
                    child: IconButton(
                      onPressed: (){
                        _searchController.clear() ;
                        ref.read(moviesViewModelProvider.notifier).fetchMoviesByCategory();
                      },
                      icon: Icon(
                        Icons.clear,
                        color: AppColors.lightGrey,
                        size: 15,
                      ),
                    ),
                  );
                }
              ),
            ),
          ),
        ),
      ),
    );
  }
}
