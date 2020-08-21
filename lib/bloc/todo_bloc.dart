import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jsonplaceholder/data_provider/provider.dart';
import 'package:jsonplaceholder/model/todo_model.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  Provider postProvider;
  TodoBloc() : super(TodoInitial()) {
    postProvider = Provider();
  }

  @override
  Stream<TodoState> mapEventToState(TodoEvent event) async* {
    if (event is GetTodoEvent) {
      yield TodoLoading();
      List<TodoModel> todos = await postProvider.getTodos();
      yield TodosArrived(todos);
    }
  }
}

// States
class TodoState extends Equatable {
  @override
  List<Object> get props => [];
}

class TodoInitial extends TodoState {}

class TodoLoading extends TodoState {}

class TodosArrived extends TodoState {
  List<TodoModel> todos;
  TodosArrived(this.todos);
}

// Events
class TodoEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetTodoEvent extends TodoEvent {}
