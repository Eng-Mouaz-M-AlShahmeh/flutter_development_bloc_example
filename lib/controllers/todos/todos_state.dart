/* Developed by Eng Mouaz M. AlShahmeh */
part of 'todos_bloc.dart';

abstract class TodosState extends Equatable {
  const TodosState();
}

class TodosInitial extends TodosState {
  @override
  List<Object> get props => [];
}

class TodosLoaded extends TodosState {
  final List<TodoModel?> todos;
  final TodoModel selectedTodo;
  final String title;
  final String dsc;

  const TodosLoaded(
      {required this.todos,
      required this.selectedTodo,
      required this.title,
      required this.dsc});

  @override
  List<Object> get props => [todos, selectedTodo, title, dsc];
}
