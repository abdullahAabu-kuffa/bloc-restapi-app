import 'package:bloc_app/constants/my_colors.dart';
import 'package:bloc_app/constants/strings.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myGray,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, allCharactersRoute);
                },
                child: Text(
                  'GO',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: MyColors.myYellow,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Welcome to Rick and Morty',
              style: TextStyle(color: MyColors.myWaite),
            ),
          ],
        ),
      ),
    );
  }
}
