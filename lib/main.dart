/* Developed by Eng Mouaz M. AlShahmeh */
import 'package:bloc_example/controllers/todos/todos_bloc.dart';
import 'package:flutter/material.dart';
import 'package:bloc_example/views/screens/crud/list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    /// TODO: add multi bloc provider above your app
    ///  to listen to blocs over the app
    MultiBlocProvider(providers: [
      BlocProvider<TodosBloc>(
        create: (context) => TodosBloc()..add(LoadTodos()),
      ),
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Development BLoC Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TodoList(),
    );
  }
}
