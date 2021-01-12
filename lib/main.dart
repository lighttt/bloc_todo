import 'package:bloc_todo/blocs/todo_bloc.dart';
import 'package:bloc_todo/blocs/todo_observer.dart';
import 'package:bloc_todo/screens/add_edit_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'screens/home_screen.dart';

void main() {
  Bloc.observer = TodoBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<TodoBloc>(
      create: (BuildContext context) {
        return TodoBloc();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Todo Bloc",
        theme: ThemeData.dark(),
        home: HomeScreen(),
        routes: {
          AddEditScreen.routeName: (ctx) => AddEditScreen(),
        },
      ),
    );
  }
}
