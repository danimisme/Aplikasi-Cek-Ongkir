import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/landing_controller.dart';

class LandingView extends GetView<LandingController> {
  const LandingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text('LandingView'),
        backgroundColor: Color.fromARGB(255, 252, 96, 103),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 252, 96, 103),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Center(
              child: Container(
                width: 200,
                height: 200,
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Image(
                  image: AssetImage("assets/images/delivery.png"),
                  fit: BoxFit.cover,
                ),
              )
            ),
            const SizedBox(height: 20),
                   TextButton(
              onPressed: () => Get.toNamed('/home'),
              style: TextButton.styleFrom(
                // Add your custom styles here if needed
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text(
                    'Mulai',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 8), // Space between text and icon
                  Icon(
                    Icons.keyboard_double_arrow_right_rounded,
                    color: Colors.white,
                    size: 40,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 50),
          ],
        ),
      )
    );
  }
}
