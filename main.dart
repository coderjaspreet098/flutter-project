import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'loginpage/login_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyAHEKBmGtJhIQHWibCS0Yk9vDb7VZZ_aWI",
        appId: "1:573120270122:android:67507f9a88d2263ae31853",
        messagingSenderId: "573120270122",
        projectId: "flutter-job-85814.appspot.com")
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Placeholder future to simulate an asynchronous operation
    Future<void> _initializeApp() async {
      // Perform initialization tasks here
      await Future.delayed(const Duration(seconds: 2)); // Simulating a delay
    }

    return GetMaterialApp(
      title: 'Flutter E-commerce App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: FutureBuilder(
        future: _initializeApp(), // Placeholder future
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If initialization is done, navigate to the login screen
            return Loginscreen();
          } else {
            // While initializing, show a loading indicator or placeholder
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}

