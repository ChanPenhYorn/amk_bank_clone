import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_architecture/controllers/splash_controller.dart';
import 'package:getx_mvvm_architecture/r.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<SplashController>();

    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(AssetImages.splash), fit: BoxFit.cover)),
        ));
  }
}
