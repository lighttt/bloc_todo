import 'package:flutter/cupertino.dart';

class Todo {
  final String id;
  final String description;
  final String title;

  Todo({
    @required this.title,
    @required this.description,
    @required this.id,
  });
}
