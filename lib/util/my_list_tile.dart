// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
    final String iconImagePath;
    final String tileTitle;
    final String tileSubtitle;

  const MyListTile({
    super.key,
    required this.iconImagePath,
    required this.tileTitle,
    required this.tileSubtitle,
    });

  @override
  Widget build(BuildContext context) {
         return Padding(
           padding: const EdgeInsets.only(bottom: 15.0),
           child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  //icon
                  Row(
                    children: [
                    Container(
                    height: 40,
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(12)
                      ),
                    child: Image.asset(iconImagePath),
                  ),
                  
                  SizedBox(height: 20),
           
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        tileTitle,
                      style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        tileSubtitle,
                      style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600]
                      ),),
                    ],
                  ),
           
                    ],),
           
                 Icon(Icons.arrow_forward),
            
                 ],
                ),
         );
  }
}