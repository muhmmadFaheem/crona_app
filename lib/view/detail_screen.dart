import 'package:crona_app/services/app_services.dart';
import 'package:crona_app/widgets/custom_tile.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final String name;
  final String flag;
  final int cases;
  final int  recover;
   final int  deaths;
  final int  tests;
  const DetailScreen({super.key, required this.name , required this.flag,required this.cases,required this.tests,
  required this.recover,required this.deaths});
  
  @override
  State<DetailScreen> createState() => _DetailScreenState();
  
}

class _DetailScreenState extends State<DetailScreen> {
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xff3bebd3),
        title: Text(
          widget.name.toString(),
          style: TextStyle(fontFamily: 'Ubuntu-Bold'),

        ),
        centerTitle: true,
      ),
      body: Column(
        children :[

          Center(
            child: Container(
              height: 300,
              width: 200,
              decoration: BoxDecoration(
              
                borderRadius: BorderRadius.circular(20)
              ),
              child: Image.network(widget.flag.toString()),
            ),
          ),
          CustomTile(name: 'Tests', number: widget.tests),
          CustomTile(name: 'Cases', number: widget.cases),
           CustomTile(name: 'Recoverd', number: widget.recover),
          CustomTile(name: 'Deaths', number: widget.deaths),

        ]
      )

      
    );
  }
}