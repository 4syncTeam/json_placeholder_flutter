import 'package:flutter/material.dart';
import 'package:jsonplaceholder/model/todo_model.dart';

class TodoCard extends StatelessWidget {
  TodoModel todo;
  TodoCard(this.todo);
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Text(
              todo.title,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          todo.completed
              ? Icon(
                  Icons.done,
                  color: Colors.green,
                )
              : Icon(
                  Icons.close,
                  color: Colors.red,
                )
        ],
      ),
    );
  }
}
