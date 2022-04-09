import 'package:flutter/material.dart';
import 'package:flutter_dragndrop_demo/core/viewmodel/data.dart';
import 'package:flutter_dragndrop_demo/ui/resources/constants.dart';
import 'package:flutter_dragndrop_demo/ui/view/home.dart';
import 'package:flutter_dragndrop_demo/ui/view/splash.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<SingleChildWidget> providers = [
    ChangeNotifierProvider<Data>(
        create: (context) => Data(), child: const HomePage()),
  ];

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'GridView Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.green),
        routes: <String, WidgetBuilder>{
          Constants.splashScreen: (BuildContext context) =>
              const SplashScreen(),
          Constants.homeScreen: (BuildContext context) => const HomePage(),
        },
        initialRoute: Constants.splashScreen,
      ),
    );
  }
}
