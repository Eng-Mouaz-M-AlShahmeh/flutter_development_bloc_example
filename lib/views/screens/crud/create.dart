/* Developed by Eng Mouaz M. AlShahmeh */
import 'package:bloc_example/controllers/todos/todos_bloc.dart';
import 'package:flutter/material.dart';
import 'package:bloc_example/models/todo.dart';
import 'package:bloc_example/views/screens/crud/list.dart';
import 'package:bloc_example/views/widgets/button.dart';
import 'package:bloc_example/views/widgets/text_form_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateTodo extends StatelessWidget {
  CreateTodo({Key? key}) : super(key: key);

  final _createKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Create Todo'),
          centerTitle: true,
        ),
        body: BlocConsumer(
            // TODO: add bloc consumer above widgets we need listen to bloc
            bloc: BlocProvider.of<TodosBloc>(context),
            listener: (context, state) {},
            builder: (context, state) {
              if (state is TodosInitial) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is TodosLoaded) {
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: Form(
                      key: _createKey,
                      child: Column(children: [
                        iTextFormFieldNew(
                          context,
                          'Todo Text',
                          'Enter Todo Text',
                          Icons.title,
                          (val) => context.read<TodosBloc>().add(SetTitle(
                              val)), // TODO: we write read if we do not need rebuild
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05),
                        iTextFormFieldNew(
                          context,
                          'Todo Dsc',
                          'Enter Todo Dsc',
                          Icons.description,
                          (val) => context.read<TodosBloc>().add(SetDsc(
                              val)), // TODO: we write read if we do not need rebuild
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05),
                        iOutlinedButton(context, _createKey, 'Add Todo', () {
                          context.read<TodosBloc>().add(AddTodo(
                                // TODO: we write read if we do not need rebuild
                                TodoModel(
                                    id: DateTime.now().microsecond,
                                    title: state.title,
                                    dsc: state.dsc),
                              ));

                          context.read<TodosBloc>().add(const SetTitle(
                              '')); // TODO: we write read if we do not need rebuild
                          context.read<TodosBloc>().add(const SetDsc(
                              '')); // TODO: we write read if we do not need rebuild
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const TodoList()));
                        }),
                      ]),
                    ),
                  ),
                );
              } else {
                return const SizedBox();
              }
            }),
      ),
    );
  }
}
