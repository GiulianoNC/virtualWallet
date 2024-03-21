// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';


class MyCard extends StatelessWidget {

  final double balance;
  final int cardNumber;
  final int expiryMonth;
  final int expiryYear;
  final color;

  const MyCard({
    super.key,
    required this.balance,
    required this.cardNumber,
    required this.expiryMonth,
    required this.expiryYear,
    required this.color,
    });

  @override
  Widget build(BuildContext context) {
    return Container(
          width: 300,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(16)
            ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Balance",
                    style: TextStyle(
                    color:Colors.white 
                    ),
                  ),
                  Image.asset(
                    "images/visa.png",
                    height: 50,
                  )
                ],
              ),
              Text("$balance",
                style: TextStyle(
                color:Colors.white,
                fontSize: 36,
                fontWeight: FontWeight.bold,
                ),
              ),
              //SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(cardNumber.toString(),
                  style: TextStyle(
                  color:Colors.white 
                ),
                ),
                //dia de expiracion
                Text("$expiryMonth/$expiryYear",
                 style: TextStyle(
                 color:Colors.white 
                ),
                ),
                ],
              )
            ]
            ),
        );
        
  }
}