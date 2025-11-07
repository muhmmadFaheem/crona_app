import 'package:flutter/material.dart';

class CustomTile extends StatelessWidget {
CustomTile({super.key,required this.name,required this.number});

  String name;
  int number;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        height: 70,
        width: 320,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white
          
        ),
        child: Row(
          children: [
            Text(   
              name,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                fontFamily: 'Ubuntu-Bold'
              ),
            ),
            Expanded(child: SizedBox(width: 180,)),
              
            Text(
              number.toString(),
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                fontFamily: 'Ubuntu-Bold'
              ),
            ),
          ],
        ),
      ),
    );
  }
}