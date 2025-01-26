import 'package:flutter/material.dart';
import 'home_page.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String selectedRole = 'Student';

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background_image.png'), // Replace with your image
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'Access Account',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Secure Admin Dashboard - Log in to manage events',
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: screenWidth * 0.9, // Set width to 90% of screen width
                  child: DropdownButtonFormField<String>(
                    value: selectedRole,
                    items: ['Student', 'Admin']
                        .map((role) => DropdownMenuItem(
                      value: role,
                      child: Text(role),
                    ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedRole = value!;
                      });
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: screenWidth * 0.9, // Set width to 90% of screen width
                  child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Your admin email',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: screenWidth * 0.9, // Set width to 90% of screen width
                  child: TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: 'Enter your password',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                  ),
                ),
                SizedBox(height: 10),
                TextButton(
                  onPressed: () {}, // Add forget password logic
                  child: Text('Forget your password?', style: TextStyle(color: Colors.white)),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: screenWidth * 0.6, // Set button width to 60% of screen width
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                    child: Text('Log In'),
                  ),
                ),
                SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterPage()),
                    );
                  },
                  child: Text(
                    'Need to create an account? Sign Up',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
