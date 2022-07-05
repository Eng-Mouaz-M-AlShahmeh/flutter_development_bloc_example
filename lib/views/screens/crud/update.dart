/* Developed by Eng Mouaz M. AlShahmeh */
import 'package:bloc_example/controllers/todos/todos_bloc.dart';
import 'package:flutter/material.dart';
import 'package:bloc_example/models/todo.dart';
import 'package:bloc_example/views/screens/crud/list.dart';
import 'package:bloc_example/views/widgets/button.dart';
import 'package:bloc_example/views/widgets/text_form_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateTodo extends StatelessWidget {
  UpdateTodo({Key? key}) : super(key: key);

  final _updateKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodosBloc, TodosState>(builder: (context, state) {
      // TODO: add BlocBuilder with require builder
      if (state is TodosInitial) {
        return const Center(child: CircularProgressIndicator());
      }

      if (state is TodosLoaded) {
        final TextEditingController titleController =
            TextEditingController(text: state.selectedTodo.title);
        titleController.value = titleController.value.copyWith(
          selection: TextSelection.fromPosition(
            TextPosition(
              offset: state.selectedTodo.title!.length,
            ),
          ),
        );

        final TextEditingController dscController =
            TextEditingController(text: state.selectedTodo.dsc);
        dscController.value = dscController.value.copyWith(
          selection: TextSelection.fromPosition(
            TextPosition(
              offset: state.selectedTodo.dsc!.length,
            ),
          ),
        );

        return SafeArea(
            child: Scaffold(
          appBar: AppBar(
            title: const Text('Edit Todo'),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              child: Form(
                key: _updateKey,
                child: Column(
                  children: [
                    iTextFormField(
                      context,
                      'Todo Text',
                      'Enter Todo Text',
                      Icons.title,
                      (val) =>
                          context.read<TodosBloc>().add(SelectTodo(TodoModel(
                                // TODO: we write read if we do not need rebuild
                                id: state.selectedTodo.id,
                                title: val,
                                dsc: state.selectedTodo.dsc,
                              ))),
                      titleController,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    iTextFormField(
                      context,
                      'Todo Dsc',
                      'Enter Todo Dsc',
                      Icons.description,
                      (val) =>
                          context.read<TodosBloc>().add(SelectTodo(TodoModel(
                                // TODO: we write read if we do not need rebuild
                                id: state.selectedTodo.id,
                                title: state.selectedTodo.title,
                                dsc: val,
                              ))),
                      dscController,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    iOutlinedButton(context, _updateKey, 'Update Todo', () {
                      context.read<TodosBloc>().add(EditTodo(TodoModel(
                            // TODO: we write read if we do not need rebuild
                            id: state.selectedTodo.id,
                            title: state.selectedTodo.title,
                            dsc: state.selectedTodo.dsc,
                          )));
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TodoList()));
                    }),
                  ],
                ),
              ),
            ),
          ),
        ));
      } else {
        return const SizedBox();
      }
    });
  }
}
