/* Developed by Eng Mouaz M. AlShahmeh */
part of 'todos_bloc.dart';

abstract class TodosEvent extends Equatable {
  const TodosEvent();
  @override
  List<Object> get props => [];
}

class LoadTodos extends TodosEvent {}

class AddTodo extends TodosEvent {
  final TodoModel todo;
  const AddTodo(this.todo);

  @override
  List<Object> get props => [todo];
}

class RemoveTodo extends TodosEvent {
  final TodoModel todo;
  const RemoveTodo(this.todo);

  @override
  List<Object> get props => [todo];
}

class EditTodo extends TodosEvent {
  final TodoModel todo;
  const EditTodo(this.todo);

  @override
  List<Object> get props => [todo];
}

class SelectTodo extends TodosEvent {
  final TodoModel selectedTodo;
  const SelectTodo(this.selectedTodo);

  @override
  List<Object> get props => [selectedTodo];
}

class SetTitle extends TodosEvent {
  final String title;
  const SetTitle(this.title);

  @override
  List<Object> get props => [title];
}

class SetDsc extends TodosEvent {
  final String dsc;
  const SetDsc(this.dsc);

  @override
  List<Object> get props => [dsc];
}
