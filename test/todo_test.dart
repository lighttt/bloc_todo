import 'package:bloc_todo/common/validator.dart';
import 'package:bloc_todo/models/todo.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final List<Todo> todos = [];

  group("Todo tests", () {
    /// Validation test
    test(
      'Given user enters empty fileds, When user taps add, Then expect field empty',
      () async {
        // arrange
        Todo addTodo = Todo(title: "", description: "", id: "123");
        // act
        String titleRes = Validator.titleValidator(addTodo.title);
        String descRes = Validator.descriptionValidator(addTodo.description);
        // assert
        expect(titleRes, "Title cannot be empty");
        expect(descRes, "Description cannot be empty");
      },
    );

    /// Simple add test
    test(
        "Given user enters fields, When user taps add its, Then update todo list",
        () {
      // arrange
      Todo addTodo = Todo(title: "ABC", id: "123", description: "12312");
      // act
      todos.add(addTodo);
      // assert
      expect(todos.length, 1);
    });
  });
}
