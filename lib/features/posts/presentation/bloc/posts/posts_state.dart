// Import the part file 'posts_bloc.dart' to include the bloc logic
part of 'posts_bloc.dart';

// Define an abstract class 'PostsState' that extends Equatable for state comparison
abstract class PostsState extends Equatable {
  // Constructor for PostsState
  const PostsState();

  // Override the props method to return an empty list for state comparison
  @override
  List<Object> get props => [];
}

// Define a state for the initial state of the posts
class PostsInitial extends PostsState {}

// Define a state for when posts are being loaded
class LoadingPostsState extends PostsState {}

// Define a state for when posts are successfully loaded
class LoadedPostsState extends PostsState {
  // A list of posts that are loaded
  final List<Post> posts;

  // Constructor for LoadedPostsState with required posts parameter
  const LoadedPostsState({required this.posts});

  // Override the props method to include the posts for state comparison
  @override
  List<Object> get props => [posts];
}

// Define a state for when there is an error loading posts
class ErrorPostsState extends PostsState {
  // A message describing the error
  final String message;

  // Constructor for ErrorPostsState with required message parameter
  const ErrorPostsState({required this.message});

  // Override the props method to include the message for state comparison
  @override
  List<Object> get props => [message];
}
