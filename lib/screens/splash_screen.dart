import 'package:flutter/material.dart';
import 'package:untitled/main.dart';
import 'package:untitled/screens/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        width: width,
        decoration: BoxDecoration(gradient: kGradient),
        child: Stack(
          children: [
            Positioned(
              right: -70,
              top: -10,
              child: Image.asset('assets/images/eafsa.png'),
            ),
            Positioned(
              left: -100,
              bottom: -100,
              child: Image.asset('assets/images/eafsa2.png'),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // text + bird
                  SizedBox(
                      child: Column(
                    children: [
                      Image.asset('assets/images/bird.png',
                          width: 186, height: 274),
                      SizedBox(
                        width: width * 0.55,
                        child: Text('Welcome To Dash App',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headlineLarge),
                      ),
                    ],
                  )),
                  // button
                  ElevatedButton(
                   onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          },
                    child: const Text('Get Started'),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
