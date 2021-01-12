import 'package:bloc_todo/blocs/todo_bloc.dart';
import 'package:bloc_todo/blocs/todo_event.dart';
import 'package:bloc_todo/models/todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef OnSaveCallback = Function(String task, String note);

class AddEditScreen extends StatefulWidget {
  static const String routeName = "/add_edit_screen";

  @override
  _AddEditScreenState createState() => _AddEditScreenState();
}

class _AddEditScreenState extends State<AddEditScreen> {
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _title;
  String _description;

  void _saveForm() {
    bool isValid = _formKey.currentState.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState.save();
    BlocProvider.of<TodoBloc>(context).add(TodoEvent.add(Todo(
      id: DateTime.now().toString(),
      title: _title,
      description: _description,
    )));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Todo"),
        actions: [IconButton(icon: Icon(Icons.save), onPressed: _saveForm)],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              style: textTheme.headline5,
              decoration: InputDecoration(
                hintText: "Enter a title",
              ),
              validator: (val) {
                return val.trim().isEmpty ? "Title cannot be empty" : null;
              },
              onSaved: (value) => _title = value,
            ),
            TextFormField(
              maxLines: 10,
              style: textTheme.subtitle1,
              decoration: InputDecoration(
                hintText: "Enter the description",
              ),
              validator: (val) {
                return val.trim().isEmpty
                    ? "Description cannot be empty"
                    : null;
              },
              onSaved: (value) => _description = value,
            )
          ],
        ),
      ),
    );
  }
}
