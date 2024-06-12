// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:bloc_flutter_infinite_list/posts/posts.dart';

// import '../bloc/post_cubit.dart';

// class PostsList extends StatefulWidget {
//   const PostsList({super.key});

//   @override
//   State<PostsList> createState() => _PostsListState();
// }

// class _PostsListState extends State<PostsList> {
//   final _scrollController = ScrollController();

//   @override
//   void initState() {
//     super.initState();
//     _scrollController.addListener(_onScroll);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<PostCubit, PostState>(
//       builder: (context, state) {
//         if (state.status == PostStatus.failure) {
//           return const Center(child: Text('Failed to fetch posts'));
//         } else if (state.status == PostStatus.success) {
//           if (state.posts.isEmpty) {
//             return const Center(child: Text('No posts'));
//           } else {
//             return ListView.builder(
//               controller: _scrollController,
//               itemBuilder: (BuildContext context, int index) {
//                 return index >= state.posts.length
//                     ? const BottomLoader()
//                     : PostListItem(post: state.posts[index]);
//               },
//               itemCount: state.limiteMaximo
//                   ? state.posts.length
//                   : state.posts.length + 1,
//             );
//           }
//         } else {
//           return const Center(child: CircularProgressIndicator());
//         }
//       },
//     );
//   }

//   @override
//   void dispose() {
//     _scrollController
//       ..removeListener(_onScroll)
//       ..dispose();
//     super.dispose();
//   }

//   void _onScroll() {
//     if (_isBottom) context.read<PostCubit>().fetchPosts();
//   }

//   bool get _isBottom {
//     if (!_scrollController.hasClients) return false;
//     final maxScroll = _scrollController.position.maxScrollExtent;
//     final currentScroll = _scrollController.offset;
//     return currentScroll >= (maxScroll * 0.9);
//   }
// }

// class PostListItem extends StatelessWidget {
//   final Post post;

//   const PostListItem({super.key, required this.post});

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       title: Text(post.title),
//       subtitle: Text(post.body),
//     );
//   }
// }

// class BottomLoader extends StatelessWidget {
//   const BottomLoader({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Center(
//       child: Padding(
//         padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
//         child: CircularProgressIndicator(),
//       ),
//     );
//   }
// }
