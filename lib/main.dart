import 'package:em_poverty/route/app_router.dart';
import 'package:flutter/material.dart';
// import 'package:em_poverty/test/uicomponent/button_component.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();

  MyApp({super.key});

  // This widget is the root of your application.
   @override
    Widget build(BuildContext context) {
      return MaterialApp.router(
        routerConfig: _appRouter.config(),
      );
    }
  }

//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

