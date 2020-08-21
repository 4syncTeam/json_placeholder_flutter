import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jsonplaceholder/bloc/todo_bloc.dart';
import 'package:jsonplaceholder/widgets/todo_card.dart';

class TodoTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.bloc<TodoBloc>().add(GetTodoEvent());
        },
        child: Icon(Icons.download_rounded),
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state is TodoLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is TodosArrived) {
            return ListView.separated(
              itemCount: state.todos.length,
              itemBuilder: (context, index) {
                return TodoCard(state.todos[index]);
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  endIndent: 12,
                  indent: 12,
                  thickness: 2,
                  color: Colors.grey[300],
                );
              },
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
