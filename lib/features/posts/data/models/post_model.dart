// Import the Post entity from the domain layer
import '../../domain/entities/post.dart';

// Define a PostModel class that extends the Post entity
class PostModel extends Post {
  // Constructor for PostModel that calls the superclass constructor
  const PostModel({super.id, required super.title, required super.body});

  // Factory constructor to create a PostModel instance from a JSON map
  factory PostModel.fromJson(Map<String, dynamic> json) {
    // Create and return a PostModel instance using values from the JSON map
    return PostModel(id: json['id'], title: json['title'], body: json['body']);
  }

  // Method to convert a PostModel instance to a JSON map
  Map<String, dynamic> toJson() {
    // Return a map containing the id, title, and body of the post
    return {'id': id, 'title': title, 'body': body};
  }
}
