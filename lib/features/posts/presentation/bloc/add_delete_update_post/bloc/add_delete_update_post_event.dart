// Part directive to include this file in the main bloc file
part of 'add_delete_update_post_bloc.dart';

// Abstract class for all events related to adding, deleting, and updating posts
abstract class AddDeleteUpdatePostEvent extends Equatable {
  // Constructor for the abstract class
  const AddDeleteUpdatePostEvent();

  // Override props to include properties for comparison
  @override
  List<Object> get props => [];
}

// Event class for adding a post
class AddPostEvent extends AddDeleteUpdatePostEvent {
  // Property to hold the post to be added
  final Post post;

  // Constructor to initialize the post property
  const AddPostEvent({required this.post});

  // Override props to include the post property for comparison
  @override
  List<Object> get props => [post];
}

// Event class for updating a post
class UpdatePostEvent extends AddDeleteUpdatePostEvent {
  // Property to hold the post to be updated
  final Post post;

  // Constructor to initialize the post property
  const UpdatePostEvent({required this.post});

  // Override props to include the post property for comparison
  @override
  List<Object> get props => [post];
}

// Event class for deleting a post
class DeletePostEvent extends AddDeleteUpdatePostEvent {
  // Property to hold the ID of the post to be deleted
  final int postId;

  // Constructor to initialize the postId property
  const DeletePostEvent({required this.postId});

  // Override props to include the postId property for comparison
  @override
  List<Object> get props => [postId];
}
