import 'package:flutter/material.dart';

import '../../user/presentation/pages/login_page.dart';
import '../theme/style.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Center(
              child: Text(
                "Welcome to WhatsApp Clone",
                style: TextStyle(fontSize: 20, color: tabColor),
              ),
            ),
            Image.asset("assets/bg_image.png"),
            /*Image.asset(
              "assets/bg_image.png",
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),*/

            Column(
              children: [
                const Text(
                  "Read our Privacy Policy Tap, 'Agree and Continue' to accept the Team of Service",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: textColor,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()),
                    );
                  },
                  child: Container(
                    width: 200,
                    height: 40,
                    decoration: BoxDecoration(
                      color: tabColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Center(
                      child: Text(
                        "AGREE AND CONTINUE",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
