import 'package:flutter/material.dart'; // Imports the Flutter material package which provides pre-designed widgets.
import 'package:focusflow/app_router.dart'; // Imports the AppRouter class from the app_router.dart file in the focusflow package.

void main() {
  // The main function is the entry point of the Flutter application.
  runApp(
    FocusFLowApp(),
  ); // runApp initializes the app and loads the FocusFLowApp widget.
}

class FocusFLowApp extends StatelessWidget {
  // Defines a new stateless widget called FocusFLowApp.
  FocusFLowApp({
    super.key,
  }); // Constructor for the FocusFLowApp class, with an optional key parameter.
  final AppRouter _appRouter =
      AppRouter(); // Creates an instance of the AppRouter class.

  @override
  Widget build(BuildContext context) {
    // The build method describes the part of the user interface represented by this widget.
    return MaterialApp(
      // Returns a MaterialApp widget which is the root of the application.
      debugShowCheckedModeBanner:
          false, // Disables the debug banner that appears in the top right corner of the app.
      onGenerateRoute:
          _appRouter
              .generateRoute, // Sets the route generator callback to the generateRoute method of the _appRouter instance.
    );
  }
}
