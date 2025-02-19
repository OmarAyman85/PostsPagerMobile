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
