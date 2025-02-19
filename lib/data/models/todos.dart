class TodosModel {
  List<Todos>? todos; // Declares a nullable list of Todos objects.

  TodosModel({
    this.todos,
  }); // Constructor for TodosModel that initializes the todos list.

  TodosModel.fromJson(Map<String, dynamic> json) {
    // Named constructor that initializes a TodosModel object from a JSON map.
    if (json['todos'] != null) {
      // Checks if the todos key exists in the JSON map.
      todos = <Todos>[]; // Initializes the todos list as an empty list.
      json['todos'].forEach((v) {
        // Iterates over each item in the JSON todos list.
        todos!.add(
          Todos.fromJson(v),
        ); // Adds a new Todos object to the list by converting each JSON item to a Todos object.
      });
    }
  }

  Map<String, dynamic> toJson() {
    // Method to convert the TodosModel object to a JSON map.
    final Map<String, dynamic> data =
        <String, dynamic>{}; // Initializes an empty map to hold the JSON data.
    if (todos != null) {
      // Checks if the todos list is not null.
      data['todos'] =
          todos!
              .map((v) => v.toJson())
              .toList(); // Converts each Todos object in the list to JSON and adds it to the map.
    }
    return data; // Returns the JSON map.
  }
}

//*********************************************************************************************************/
//*********************************************************************************************************/
//*********************************************************************************************************/

class Todos {
  int? id; // Declares a nullable integer id.
  String? todo; // Declares a nullable string todo.
  bool? completed; // Declares a nullable boolean completed.
  int? userId; // Declares a nullable integer userId.

  Todos({
    this.id,
    this.todo,
    this.completed,
    this.userId,
  }); // Constructor for Todos that initializes the fields.

  Todos.fromJson(Map<String, dynamic> json) {
    // Named constructor that initializes a Todos object from a JSON map.
    id = json['id']; // Assigns the id field from the JSON map.
    todo = json['todo']; // Assigns the todo field from the JSON map.
    completed =
        json['completed']; // Assigns the completed field from the JSON map.
    userId = json['userId']; // Assigns the userId field from the JSON map.
  }

  Map<String, dynamic> toJson() {
    // Method to convert the Todos object to a JSON map.
    final Map<String, dynamic> data =
        <String, dynamic>{}; // Initializes an empty map to hold the JSON data.
    data['id'] = id; // Adds the id field to the JSON map.
    data['todo'] = todo; // Adds the todo field to the JSON map.
    data['completed'] = completed; // Adds the completed field to the JSON map.
    data['userId'] = userId; // Adds the userId field to the JSON map.
    return data; // Returns the JSON map.
  }
}

//*********************************************************************************************************/
//*********************************************************************************************************/
//*********************************************************************************************************/
