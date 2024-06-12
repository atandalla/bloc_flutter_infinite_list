import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

import '../models/rick_morty_api.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(const PostState());

  Future<void> fetchCharacters() async {
    if (state.limiteMaximo || state.isLoading) return;
    emit(state.copyWith(isLoading: true));
    try {
      if (state.status == PostStatus.initial) {
        final response = await _fetchCharacters();
        emit(state.copyWith(
          status: PostStatus.success,
          characters: response.results,
          nextPageUrl: response.info.next,
          limiteMaximo: response.info.next == null,
          isLoading: false,
        ));
      } else {
        final response = await _fetchCharacters(state.nextPageUrl);
        emit(state.copyWith(
          status: PostStatus.success,
          characters: List.of(state.characters)..addAll(response.results),
          nextPageUrl: response.info.next,
          limiteMaximo: response.info.next == null,
          isLoading: false,
        ));
      }
    } catch (_) {
      emit(state.copyWith(status: PostStatus.failure, isLoading: false));
    }
  }

  Future<RickAndMortyResponse> _fetchCharacters([String? url]) async {
    final response = await http.get(Uri.parse(url ?? 'https://rickandmortyapi.com/api/character'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return RickAndMortyResponse.fromJson(data);
    }
    throw Exception('error fetching characters');
  }
}