// Importing necessary packages and modules
import 'package:bloc/bloc.dart';
import '../../../../../../core/strings/messages.dart';
import '../../../../domain/entities/post.dart';
import '../../../../domain/usecases/add_post.dart';
import '../../../../domain/usecases/delete_post.dart';
import '../../../../domain/usecases/update_post.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../../../core/errors/failures.dart';
import '../../../../../../core/strings/failures.dart';

// Part directives to include event and state files
part 'add_delete_update_post_event.dart';
part 'add_delete_update_post_state.dart';

// Bloc class to handle add, delete, and update post events
class AddDeleteUpdatePostBloc
    extends Bloc<AddDeleteUpdatePostEvent, AddDeleteUpdatePostState> {
  // Use cases for adding, deleting, and updating posts
  final AddPostUsecase addPost;
  final DeletePostUsecase deletePost;
  final UpdatePostUsecase updatePost;

  // Constructor to initialize use cases and set the initial state
  AddDeleteUpdatePostBloc({
    required this.addPost,
    required this.deletePost,
    required this.updatePost,
  }) : super(AddDeleteUpdatePostInitial()) {
    // Event handler for AddDeleteUpdatePostEvent
    on<AddDeleteUpdatePostEvent>((event, emit) async {
      // Handling AddPostEvent
      if (event is AddPostEvent) {
        // Emit loading state
        emit(LoadingAddDeleteUpdatePostState());

        // Execute addPost use case
        final failureOrDoneMessage = await addPost(event.post);

        // Emit either success or error state based on the result
        emit(
          _eitherDoneMessageOrErrorState(
            failureOrDoneMessage,
            ADD_SUCCESS_MESSAGE,
          ),
        );
        // Handling UpdatePostEvent
      } else if (event is UpdatePostEvent) {
        // Emit loading state
        emit(LoadingAddDeleteUpdatePostState());

        // Execute updatePost use case
        final failureOrDoneMessage = await updatePost(event.post);

        // Emit either success or error state based on the result
        emit(
          _eitherDoneMessageOrErrorState(
            failureOrDoneMessage,
            UPDATE_SUCCESS_MESSAGE,
          ),
        );
        // Handling DeletePostEvent
      } else if (event is DeletePostEvent) {
        // Emit loading state
        emit(LoadingAddDeleteUpdatePostState());

        // Execute deletePost use case
        final failureOrDoneMessage = await deletePost(event.postId);

        // Emit either success or error state based on the result
        emit(
          _eitherDoneMessageOrErrorState(
            failureOrDoneMessage,
            DELETE_SUCCESS_MESSAGE,
          ),
        );
      }
    });
  }

  // Helper method to map Either<Failure, Unit> to state
  AddDeleteUpdatePostState _eitherDoneMessageOrErrorState(
    Either<Failure, Unit> either,
    String message,
  ) {
    return either.fold(
      // Map failure to error state
      (failure) =>
          ErrorAddDeleteUpdatePostState(message: _mapFailureToMessage(failure)),
      // Map success to message state
      (_) => MessageAddDeleteUpdatePostState(message: message),
    );
  }

  // Helper method to map Failure to error message
  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure _:
        return SERVER_FAILURE_MESSAGE;
      case OfflineFailure _:
        return OFFLINE_FAILURE_MESSAGE;
      default:
        return "Unexpected Error , Please try again later .";
    }
  }
}

//The underscore (_) in the line case OfflineFailure _: is a type test pattern introduced in Dart 2.15. 
//It is used to match any instance of the OfflineFailure type without binding the matched value to a variable. 
//This is useful when you only care about the type of the object and not the object itself.

//In this context, it means that if the failure is of type OfflineFailure, the corresponding case will be executed, 
//but the actual instance of OfflineFailure is not needed, so it is not assigned to a variable.

//The benefit of using the underscore (_) in the type test pattern is to improve code readability and maintainability 
//by clearly indicating that the matched value is not needed. 
//This can make the code cleaner and more concise, as it avoids the need to introduce an unused variable. 
//It also helps to prevent potential warnings or errors related to unused variables, making the code more robust and easier to understand.


