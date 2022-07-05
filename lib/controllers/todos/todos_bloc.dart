/* Developed by Eng Mouaz M. AlShahmeh */
import 'dart:async';
import 'package:bloc_example/models/todo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'todos_event.dart';
part 'todos_state.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  TodosBloc() : super(TodosInitial()) {
    on<LoadTodos>((event, emit) async {
      await Future<void>.delayed(const Duration(seconds: 0));
      emit(const TodosLoaded(
          todos: [], selectedTodo: TodoModel(), title: '', dsc: ''));
    });

    on<AddTodo>((event, emit) {
      if (state is TodosLoaded) {
        final state = this.state as TodosLoaded;
        emit(
          TodosLoaded(
            todos: List.from(state.todos)..add(event.todo),
            selectedTodo: state.selectedTodo,
            title: state.title,
            dsc: state.dsc,
          ),
        );
      }
    });

    on<RemoveTodo>((event, emit) {
      if (state is TodosLoaded) {
        final state = this.state as TodosLoaded;
        emit(
          TodosLoaded(
              todos: List.from(state.todos)..remove(event.todo),
              selectedTodo: state.selectedTodo,
              title: state.title,
              dsc: state.dsc),
        );
      }
    });

    on<EditTodo>((event, emit) {
      if (state is TodosLoaded) {
        final state = this.state as TodosLoaded;
        state.todos[state.todos
                .indexWhere((element) => element!.id == event.todo.id)] =
            event.todo;
        emit(
          TodosLoaded(
              todos: state.todos,
              selectedTodo: state.selectedTodo,
              title: state.title,
              dsc: state.dsc),
        );
      }
    });

    on<SelectTodo>((event, emit) {
      if (state is TodosLoaded) {
        final state = this.state as TodosLoaded;
        emit(
          TodosLoaded(
              todos: state.todos,
              selectedTodo: event.selectedTodo,
              title: state.title,
              dsc: state.dsc),
        );
      }
    });

    on<SetTitle>((event, emit) {
      if (state is TodosLoaded) {
        final state = this.state as TodosLoaded;
        emit(
          TodosLoaded(
              todos: state.todos,
              selectedTodo: state.selectedTodo,
              title: event.title,
              dsc: state.dsc),
        );
      }
    });

    on<SetDsc>((event, emit) {
      if (state is TodosLoaded) {
        final state = this.state as TodosLoaded;
        emit(
          TodosLoaded(
              todos: state.todos,
              selectedTodo: state.selectedTodo,
              title: state.title,
              dsc: event.dsc),
        );
      }
    });
  }
}
