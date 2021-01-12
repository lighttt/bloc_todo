import 'package:bloc_todo/models/todo.dart';

enum EventType { add, delete }

class TodoEvent {
  Todo todo;
  int todoIndex;
  EventType eventType;

  TodoEvent.add(Todo todo) {
    this.eventType = EventType.add;
    this.todo = todo;
  }

  TodoEvent.delete(int index) {
    this.eventType = EventType.delete;
    this.todoIndex = index;
  }
}
