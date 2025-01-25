import 'package:flutter/material.dart';
import 'signup.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(SportsEventApp());
}

class SportsEventApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(), // Set theme to dark
      home: SportsEventScreen(),
    );
  }
}

class SportsEventScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.6, // Reduce opacity to make the background darker
              child: Image.asset(
                'assets/images/background_image.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Center(
                child: Image.asset(
                  'assets/images/logo_image.png',
                  height: 80,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "SCORE '25",
                style: GoogleFonts.vt323(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2ABFED), // Replace with your custom color
                ),
              ),

              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  '"A champion is someone who gets up \n'
                      'when they can\'t"',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 65, vertical: 20),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF2ABFED),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8), // Keep corners slightly rounded
                    ),
                    padding: EdgeInsets.all(20), // Square size for diamond appearance
                  ),
                  child: Center(
                    child: Text(
                      'Join the Fest',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}