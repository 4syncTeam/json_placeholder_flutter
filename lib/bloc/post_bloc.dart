import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jsonplaceholder/data_provider/provider.dart';
import 'package:jsonplaceholder/model/post_model.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  Provider postProvider;
  PostBloc() : super(PostInitial()) {
    postProvider = Provider();
  }

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    if (event is GetPosts) {
      yield PostsLoading();
      List<Post> posts = await postProvider.getPosts();
      yield PostsArrived(posts);
    }
  }
}

// States
class PostState extends Equatable {
  @override
  List<Object> get props => [];
}

class PostInitial extends PostState {}

class PostsLoading extends PostState {}

class PostsArrived extends PostState {
  List<Post> posts;
  PostsArrived(this.posts);
}

// Events
class PostEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetLatestEvent extends PostEvent {}

class GetPosts extends PostEvent {}
