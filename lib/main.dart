//
//====GOOGLE WINTERHACKS TASK #4 from Raghav Krishna M 2023BCS0171====//
//
//
//
// --- WAS TOLD TO SPEICIFY AND DEIFFERENTIATE PROPERLY INBETWEEN FLUTTER AND FIRBASE CODE---//

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; //FIREBASE FILES IMPORT//

// ------firebase initialization---//
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  //#Firebase Database--under Dependencies in pubspec.yaml
  //firebase_core: ^2.24.2
  // cloud_firestore: ^4.14.0
// firebase_auth: ^4.16.0

//--added all of 'em in pubspec.yaml and pub get command was run to resolve new dependencies and get rid of outdated versions

  // ------firebase initialization---//
  //---google-services.json  was also added---//

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Simulate a long-running task, such as loading data or checking authentication
    _navigateToMainScreen();
  }

  _navigateToMainScreen() async {
    await Future.delayed(
        const Duration(seconds: 3)); // Simulate a 3-second delay
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlutterLogo(
                size: 100.0,
              ),
              Center(child: Center(child: SizedBox(height: 16.0))),
              Center(
                child: Center(
                  child: Text(
                    'TASK #2 by RAGHAV KRISHNA M (2023BCS0171) Loading...',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page by Raghav Krishna M'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 0, 174, 255),
              Color.fromARGB(255, 254, 4, 200)
            ],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildTextField('Roll Number for IIIT-KOTTAYAM'),
                _buildTextField('Date of Birth (DD/MM/YYYY)'),
                _buildTextField('Country of Origin'),
                _buildTextField('State'),
                _buildTextField('Pincode'),
                _buildTextField('Password for IIIT-KOTTAYAM', isPassword: true),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    // Handle login logic here
                  },
                  style: ElevatedButton.styleFrom(),
                  child: const Text('Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String labelText, {bool isPassword = false}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: TextField(
        obscureText: isPassword,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(color: Colors.white),
          filled: true,
          fillColor: Colors.white.withOpacity(0.2),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white.withOpacity(0.5)),
          ),
        ),
      ),
    );
  }
}
