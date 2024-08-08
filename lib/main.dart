import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travelling_app/config/Delegate/custom_search_delegate.dart';
import 'package:travelling_app/config/components/place_by_id.dart';
import 'package:travelling_app/config/routes/routes_name.dart';
import 'package:travelling_app/views/Bottom_navigationBar_items/search_screen.dart';
import 'package:travelling_app/views/home_screen.dart';
import 'package:travelling_app/views/login_screen.dart';
import 'package:travelling_app/views/signup_screen.dart';
import 'package:travelling_app/views/welcome_screen.dart';
import 'dart:convert';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';

import 'config/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

Future<bool> isFirstTime() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  bool? isFirstTime = prefs.getBool('first_time');
  String? token = prefs.getString('token') ?? null;

  if (isFirstTime == null) {
    prefs.setBool('first_time', false);
    return true;
  }

  return false;
}

Future<bool> isLogged() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('token') ?? null;

  if (token != null) {
    Map<String, dynamic> payload = parseJwt(token);
    print('Payload: $payload');
    return true;
  }

  return false;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Routes.generateRoute,
      // navigatorObservers: [FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance)],
      home: HomeScreen(),
      // home: FutureBuilder(
      //   future: isFirstTime(),
      //   builder: (context, AsyncSnapshot<bool> snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return CircularProgressIndicator(); // Show loading spinner while waiting
      //     } else {
      //       if (snapshot.hasError) {
      //         return Text('Error: ${snapshot.error}');
      //       } else {
      //         return snapshot.data == true ? WelcomeScreen() : isLogged() == true ? HomeScreen() : LoginScreen();
      //       }
      //     }
      //   },
      // ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

Map<String, dynamic> parseJwt(String token) {
  final parts = token.split('.');
  if (parts.length != 3) {
    throw Exception('Invalid token');
  }

  final payload = parts[1];
  var normalized = base64Url.normalize(payload);
  var resp = utf8.decode(base64Url.decode(normalized));

  final payloadMap = json.decode(resp);
  if (payloadMap is! Map<String, dynamic>) {
    throw Exception('Invalid payload');
  }

  return payloadMap;
}
