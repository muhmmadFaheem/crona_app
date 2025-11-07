import 'package:crona_app/view/cases.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class SplashScreen extends StatefulWidget {
   const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{
  late AnimationController controller = AnimationController(
    duration: Duration(seconds: 3),
    vsync: this)..repeat();
    
      @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DashScreen()),
      );
    });
  }
 
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      backgroundColor: Colors.white54,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        
            AnimatedBuilder(
              animation:controller,
               builder: (BuildContext context , Widget ? child){
                return Transform.rotate(
                  angle:controller.value * 1.4 * math.pi,
                  child: Center(
                  child:  Image.asset("asset/virus.png",
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover,),
              ));
                  
               
               }),

               SizedBox(height: 20,),
            
              Text(
                "Covid-19 Tracker App",
                style: TextStyle(
                  fontFamily: 'Ubuntu-Bold',
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              )
          ],
        ),
      ),
    );
  }
}