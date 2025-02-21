// This line specifies that this part of the code is part of the 'posts_bloc.dart' file.
part of 'posts_bloc.dart';

// This is an abstract class named 'PostsEvent' which extends 'Equatable'.
// 'Equatable' is used to make object comparison easier.
abstract class PostsEvent extends Equatable {
  // A constant constructor for the 'PostsEvent' class.
  const PostsEvent();

  // Overriding the 'props' getter from 'Equatable' to return an empty list.
  // This is used to determine if two instances are equal.
  @override
  List<Object> get props => [];
}

// A class named 'GetAllPostsEvent' which extends 'PostsEvent'.
// This event can be used to trigger fetching all posts.
class GetAllPostsEvent extends PostsEvent {}

// A class named 'RefreshPostsEvent' which extends 'PostsEvent'.
// This event can be used to trigger refreshing the posts.
class RefreshPostsEvent extends PostsEvent {}
