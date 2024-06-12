part of 'post_cubit.dart';

enum PostStatus { initial, success, failure }

class PostState extends Equatable {
  const PostState({
    this.status = PostStatus.initial,
    this.characters = const <Character>[],
    this.limiteMaximo = false,
    this.nextPageUrl,
    this.isLoading = false,
  });

  final PostStatus status;
  final List<Character> characters;
  final bool limiteMaximo;
  final String? nextPageUrl;
  final bool isLoading;

  PostState copyWith({
    PostStatus? status,
    List<Character>? characters,
    bool? limiteMaximo,
    String? nextPageUrl,
    bool? isLoading,
  }) {
    return PostState(
      status: status ?? this.status,
      characters: characters ?? this.characters,
      limiteMaximo: limiteMaximo ?? this.limiteMaximo,
      nextPageUrl: nextPageUrl ?? this.nextPageUrl,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [status, characters, limiteMaximo, nextPageUrl, isLoading];
}
