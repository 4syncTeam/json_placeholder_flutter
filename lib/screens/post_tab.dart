import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jsonplaceholder/bloc/post_bloc.dart';
import 'package:jsonplaceholder/widgets/post_card.dart';

class PostTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<PostBloc>(context).add(GetPosts());
        },
        child: Icon(Icons.download_rounded),
      ),
      body: Container(
        child: BlocBuilder<PostBloc, PostState>(
          builder: (context, state) {
            if (state is PostsLoading) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is PostsArrived) {
              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: PostCard(
                      post: state.posts[index],
                    ),
                  );
                },
                itemCount: state.posts.length,
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
