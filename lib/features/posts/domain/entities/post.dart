// Importing the Equatable package to make the Post class equatable.
import 'package:equatable/equatable.dart';

// Defining the Post class which extends Equatable to enable value comparison.
class Post extends Equatable {
  // Declaring the fields of the Post class.
  final int? id; // Nullable integer field for the post ID.
  final String title; // Non-nullable string field for the post title.
  final String body; // Non-nullable string field for the post body.

  // Constructor for the Post class with named parameters.
  // The title and body parameters are required, while id is optional.
  const Post({this.id, required this.title, required this.body});

  // Overriding the props getter from Equatable to include the fields for comparison.
  @override
  List<Object?> get props => [id, title, body];
}

// We are using Equatable to simplify the process of comparing instances of the Post class.
// By extending Equatable and overriding the props getter, we can easily check if two Post
// objects are equal based on their field values, rather than their references.

// If two instances of the Post class have equal field values, Equatable will consider them
// to be equal. This means that the equality operator (==) will return true when comparing
// these instances. This is useful for simplifying comparisons and ensuring that objects
// with the same data are treated as equal, even if they are different instances in memory.

//If two instances of the Post class are considered equal by Equatable (i.e., their field values are equal), 
//the equality operator (==) will return true when comparing these instances. This means that:
//1. They will be treated as the same object in collections that rely on equality, such as sets or maps.
//2. They can be used interchangeably in logical comparisons.
//3.It simplifies testing and state management by ensuring that objects with the same data are treated as equal, 
//even if they are different instances in memory.




