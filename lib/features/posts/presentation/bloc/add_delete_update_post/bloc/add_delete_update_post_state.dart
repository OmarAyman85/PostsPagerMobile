// Part directive to include this file as part of 'add_delete_update_post_bloc.dart'
part of 'add_delete_update_post_bloc.dart';

// Abstract class representing the base state for AddDeleteUpdatePost operations
abstract class AddDeleteUpdatePostState extends Equatable {
  // Constructor for the abstract class
  const AddDeleteUpdatePostState();

  // Override the props getter from Equatable to include properties for comparison
  @override
  List<Object> get props => [];
}

// Initial state class for AddDeleteUpdatePost operations
class AddDeleteUpdatePostInitial extends AddDeleteUpdatePostState {}

// Loading state class for AddDeleteUpdatePost operations
class LoadingAddDeleteUpdatePostState extends AddDeleteUpdatePostState {}

// Error state class for AddDeleteUpdatePost operations
class ErrorAddDeleteUpdatePostState extends AddDeleteUpdatePostState {
  // Error message property
  final String message;

  // Constructor to initialize the error message
  const ErrorAddDeleteUpdatePostState({required this.message});

  // Override the props getter to include the message property for comparison
  @override
  List<Object> get props => [message];
}

// Message state class for AddDeleteUpdatePost operations
class MessageAddDeleteUpdatePostState extends AddDeleteUpdatePostState {
  // Message property
  final String message;

  // Constructor to initialize the message
  const MessageAddDeleteUpdatePostState({required this.message});

  // Override the props getter to include the message property for comparison
  @override
  List<Object> get props => [message];
}
