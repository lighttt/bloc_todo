import 'package:bloc_todo/blocs/todo_event.dart';
import 'package:bloc_todo/models/todo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoBloc extends Bloc<TodoEvent, List<Todo>> {
  TodoBloc({List<Todo> initialState}) : super([]);

  @override
  Stream<List<Todo>> mapEventToState(TodoEvent event) async* {
    switch (event.eventType) {
      case EventType.add:
        List<Todo> newState = List.from(state);
        if (event.todo != null) {
          newState.add(event.todo);
        }
        yield newState;
        break;
      case EventType.delete:
        List<Todo> newState = List.from(state);
        newState.removeAt(event.todoIndex);
        yield newState;
        break;
      default:
        throw Exception("Event not found $event");
    }
  }
}
