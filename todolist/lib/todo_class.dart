// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Todo {
  String title;
  Color backgroundColor;
  bool value;
  Todo({
    required this.title,
    required this.backgroundColor,
    this.value=false,
  });

  
}
