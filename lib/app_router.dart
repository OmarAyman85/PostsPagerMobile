import 'package:flutter/material.dart'; // Imports the Flutter material package, which contains essential widgets and utilities for building a Flutter app.
import 'package:focusflow/constants/strings.dart';
import 'package:focusflow/presentation/screens/todos_screen.dart'; // Imports the TodosScreen widget from the specified path.

// Defines the AppRouter class.
class AppRouter {
  // Defines a method generateRoute that takes RouteSettings as an argument and returns a Route.
  Route? generateRoute(RouteSettings settings) {
    // Switch statement to handle different route names.
    switch (settings.name) {
      // Case for the root route ("/").
      case todosScreen:
        // Returns a MaterialPageRoute that builds the TodosScreen widget.
        return MaterialPageRoute(builder: (_) => TodosScreen());
    }
    return null;
  }
}
