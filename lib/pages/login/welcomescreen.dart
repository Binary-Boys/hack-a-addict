import 'package:flutter/material.dart';
import 'package:hackaddict/pages/login/userSignUp.dart';
import 'package:hackaddict/pages/login/userlogin.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:
          // padding: const EdgeInsets.all(20.0),
          Column(
        children: [
          // Logo and doves
          Stack(
            // alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  height: 200,
                  width: 150,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 128, 86, 224),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(200),
                    ),
                  ),
                  margin: EdgeInsets.zero,
                  padding: EdgeInsets.zero,
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  height: 290,
                  width: 280,
                  decoration: const BoxDecoration(
                    color: Color(0xFF2563EB),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(200),
                    ),
                  ),
                  margin: EdgeInsets.zero,
                  padding: EdgeInsets.zero,
                ),
              ),
            ],
          ),
          Image.asset('assets/images/dove.png', height: 170),
          const SizedBox(height: 30),
          const Text(
            'NEXUS',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2563EB),
            ),
          ),
          const Text(
            'Reconnecting to Life',
            style: TextStyle(
              fontSize: 18,
              color: Color(0xFF2563EB),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            '"Rebuilding life\'s in just a click"',
            style: TextStyle(
              fontSize: 16,
              fontStyle: FontStyle.italic,
            ),
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to homepage
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UserLoginScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2563EB),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      // Handle register
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => UserSignUp()),
                      );
                    },
                    child: const Text(
                      'Register',
                      style: TextStyle(color: Colors.black87),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
