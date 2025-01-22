import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_joke/app/routes/app_pages.dart';
import 'package:glass_kit/glass_kit.dart';

import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.black,
              Colors.blue.shade700,
              Colors.purple.shade700,
              Colors.black
            ],
          ),
        ),
        child: Center(
          child: GlassContainer(
               height: 60,
               width: 400,
               borderRadius: BorderRadius.circular(20),
                borderColor: Colors.white,
               gradient: LinearGradient(
                 colors: [
                   Colors.white.withOpacity(0.40),
                   Colors.white.withOpacity(0.10)
                 ],
                 begin: Alignment.topLeft,
                 end: Alignment.bottomRight,
               ),
               borderGradient: LinearGradient(
                 colors: [
                   Colors.white.withOpacity(0.60),
                   Colors.white.withOpacity(0.10),
                   Colors.lightBlueAccent.withOpacity(0.05),
                   Colors.lightBlueAccent.withOpacity(0.6)
                 ],
                 begin: Alignment.topLeft,
                 end: Alignment.bottomRight,
                 stops: [0.0, 0.39, 0.40, 1.0],
               ),
               blur: 15.0,
               borderWidth: 1.5,
               elevation: 3.0,
               isFrostedGlass: true,
               shadowColor: Colors.black.withOpacity(0.20),
               alignment: Alignment.center,
               frostedOpacity: 0.12,
               margin: EdgeInsets.all(8.0),
               padding: EdgeInsets.all(8.0),
               child: ElevatedButton(
                  onPressed: () {
             Get.toNamed(Routes.JOKE);
           },
                 child: Text('Jokes', style: TextStyle(fontSize: 24)),
                 style: ElevatedButton.styleFrom(
                   backgroundColor: Colors.transparent,
                   foregroundColor: Colors.white,
                   elevation: 0,
                   minimumSize: Size(double.infinity, double.infinity),
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(15.0),
                   ),
                 ),
               ),
             ),
        ),
      ),
    );
  }
}
