// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:bloc_todo/blocs/todo_bloc.dart';
import 'package:bloc_todo/blocs/todo_event.dart';
import 'package:bloc_todo/blocs/todo_observer.dart';
import 'package:bloc_todo/models/todo.dart';
import 'package:bloc_todo/screens/add_edit_screen.dart';
import 'package:bloc_todo/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_todo/main.dart';
import 'package:mockito/mockito.dart';

class MockTodoBloc extends Mock implements TodoBloc {}

void main() {
  Widget makeTestableWidget({Widget child, TodoBloc todoBloc}) {
    return BlocProvider<TodoBloc>(
      create: (BuildContext context) {
        return todoBloc;
      },
      child: MaterialApp(
        home: child,
      ),
    );
  }

  testWidgets(
      'Given user enters fields, When user taps save, Then update todo list',
      (WidgetTester tester) async {
    // arrange
    MockTodoBloc mockTodoBloc = MockTodoBloc();
    Todo addTodo = Todo(title: "", description: "", id: "123");

    // act
    AddEditScreen addEditScreen = AddEditScreen();
    // assert
    await tester.pumpWidget(
        makeTestableWidget(child: addEditScreen, todoBloc: mockTodoBloc));
    await tester.tap(find.byKey(Key("add_widget")));
    verifyNever(mockTodoBloc.add(TodoEvent.add(addTodo)));
  });
}
