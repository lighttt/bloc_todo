import 'package:bloc_todo/blocs/todo_bloc.dart';
import 'package:bloc_todo/blocs/todo_event.dart';
import 'package:bloc_todo/models/todo.dart';
import 'package:bloc_todo/screens/add_edit_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Todos"),
      ),
      body: BlocConsumer<TodoBloc, List<Todo>>(
        buildWhen: (List<Todo> previous, List<Todo> current) {
          return true;
        },
        listenWhen: (List<Todo> previous, List<Todo> current) {
          if (current.length > previous.length) {
            return true;
          }
          return false;
        },
        listener: (context, foodList) {
          Scaffold.of(context).showSnackBar(SnackBar(content: Text("Added")));
        },
        builder: (BuildContext context, todoList) {
          return ListView.builder(
              key: Key("list_widget"),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              padding: const EdgeInsets.all(16),
              itemCount: todoList.length,
              itemBuilder: (ctx, index) => Dismissible(
                    key: ValueKey(todoList[index].id),
                    direction: DismissDirection.endToStart,
                    background: Container(
                      color: Colors.red,
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      padding: const EdgeInsets.only(right: 10),
                      child: Icon(Icons.delete),
                      alignment: Alignment.centerRight,
                    ),
                    onDismissed: (direction) {
                      BlocProvider.of<TodoBloc>(context)
                          .add(TodoEvent.delete(index));
                    },
                    child: Card(
                      child: ListTile(
                        title: Text(todoList[index].title),
                        subtitle: Text(todoList[index].description),
                      ),
                    ),
                  ));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AddEditScreen.routeName);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
