import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jsonplaceholder/screens/home_screen.dart';

import 'bloc/photo_bloc.dart';
import 'bloc/post_bloc.dart';
import 'bloc/todo_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => PostBloc()),
        BlocProvider(create: (BuildContext context) => PhotoBloc()),
        BlocProvider(create: (BuildContext context) => TodoBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => HomeScreen(),
        },
      ),
    );
  }
}
