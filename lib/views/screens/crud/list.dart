/* Developed by Eng Mouaz M. AlShahmeh */
import 'package:bloc_example/controllers/todos/todos_bloc.dart';
import 'package:flutter/material.dart';
import 'package:bloc_example/views/screens/crud/create.dart';
import 'package:bloc_example/views/screens/crud/show.dart';
import 'package:bloc_example/views/screens/crud/update.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoList extends StatelessWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Todos\' List'),
        centerTitle: true,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height * 0.8,
        width: MediaQuery.of(context).size.width,
        child: BlocBuilder<TodosBloc, TodosState>(
          // TODO: add BlocBuilder with require builder
          builder: (context, state) {
            if (state is TodosInitial) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is TodosLoaded) {
              return ListView.builder(
                  itemCount: state.todos.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(state.todos[index]!.title!),
                      subtitle: Text(state.todos[index]!.dsc!),
                      trailing: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  context.read<TodosBloc>().add(SelectTodo(state
                                          .todos[
                                      index]!)); // TODO: we write read if we do not need rebuild
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => UpdateTodo()));
                                },
                                child: const Icon(
                                  Icons.edit,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.width * 0.01),
                            Expanded(
                              child: InkWell(
                                  onTap: () {
                                    context.read<TodosBloc>().add(SelectTodo(state
                                            .todos[
                                        index]!)); // TODO: we write read if we do not need rebuild
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ShowTodo()));
                                  },
                                  child: const Icon(
                                    Icons.remove_red_eye,
                                    color: Colors.blue,
                                  )),
                            ),
                          ],
                        ),
                      ),
                      leading: InkWell(
                          onTap: () {
                            context.read<TodosBloc>().add(RemoveTodo(state
                                    .todos[
                                index]!)); // TODO: we write read if we do not need rebuild
                          },
                          child: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          )),
                    );
                  });
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => CreateTodo()));
        },
        child: const Icon(Icons.add),
      ),
    ));
  }
}
