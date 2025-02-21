// Importing necessary packages and modules
import 'package:bloc/bloc.dart'; // Bloc package for state management
import '../../../../../core/errors/failures.dart'; // Custom failure classes
import '../../../../../core/strings/failures.dart'; // Failure messages
import 'package:dartz/dartz.dart'; // Dartz package for functional programming
import 'package:equatable/equatable.dart'; // Equatable package for value equality

import '../../../domain/entities/post.dart'; // Post entity
import '../../../domain/usecases/get_all_posts.dart'; // Use case for getting all posts

// Part files for event and state
part 'posts_event.dart';
part 'posts_state.dart';

// Bloc class for managing posts
class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final GetAllPostsUsecase getAllPosts; // Use case instance

  // Constructor with required use case and initial state
  PostsBloc({required this.getAllPosts}) : super(PostsInitial()) {
    // Event handler
    on<PostsEvent>((event, emit) async {
      if (event is GetAllPostsEvent) {
        // Check if event is GetAllPostsEvent
        emit(LoadingPostsState()); // Emit loading state

        final failureOrPosts = await getAllPosts(); // Fetch posts
        emit(
          _mapFailureOrPostsToState(failureOrPosts),
        ); // Emit appropriate state based on result
      } else if (event is RefreshPostsEvent) {
        // Check if event is RefreshPostsEvent
        emit(LoadingPostsState()); // Emit loading state

        final failureOrPosts = await getAllPosts(); // Fetch posts
        emit(
          _mapFailureOrPostsToState(failureOrPosts),
        ); // Emit appropriate state based on result
      }
    });
  }

  // Map failure or posts to state
  PostsState _mapFailureOrPostsToState(Either<Failure, List<Post>> either) {
    return either.fold(
      (failure) => ErrorPostsState(
        message: _mapFailureToMessage(failure),
      ), // Emit error state with message
      (posts) => LoadedPostsState(posts: posts), // Emit loaded state with posts
    );
  }

  // Map failure to error message
  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure _:
        return SERVER_FAILURE_MESSAGE; // Server failure message
      case EmptyCacheFailure _:
        return EMPTY_CACHE_FAILURE_MESSAGE; // Empty cache failure message
      case OfflineFailure _:
        return OFFLINE_FAILURE_MESSAGE; // Offline failure message
      default:
        return "Unexpected Error , Please try again later ..."; // Default error message
    }
  }
}
