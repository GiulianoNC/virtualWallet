// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:virtual_wallet_app/util/my_button.dart';
import 'package:virtual_wallet_app/util/my_card.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:virtual_wallet_app/util/my_list_tile.dart';


class HomePage extends StatefulWidget {
    static const String routeName = "HomePage";

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //pageController
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey[300],
      floatingActionButton: FloatingActionButton(
        onPressed:(){},
        backgroundColor: Colors.grey,
        child: Icon(
          Icons.monetization_on,
          size: 32,
          ),
         ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          color: Colors.grey[200],
          child: Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
              IconButton(
                onPressed: (){},
               icon: Icon(
                Icons.home,
                size: 28,
                color: Colors.grey,
                )),
               IconButton(
                onPressed: (){},
               icon: Icon(Icons.settings,
               size: 28,
               color: Colors.grey,
               )),
            ]),
          ),
        ),
      body: Column(
         children: [
        //appBar
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.0),
          child: Row( 
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                Row(children: [
                  Text(
                    "My",
                     style: TextStyle(fontSize: 26,
                     fontWeight: FontWeight.bold),
                  ),
                  Text(
                     " cards",
                     style: TextStyle(fontSize: 28),
                  ),
                ],
                ),
                //plus buttom
                Container(
                  padding: EdgeInsets.all(8),
                  decoration:BoxDecoration(
                    color:Colors.grey[400],
                    shape: BoxShape.circle
                    ),
                  child: Icon(Icons.add),
                ),
              ],
              ),
        ),
        SizedBox(height: 15),

        //cards
        Container(
          height: 200,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: PageView(
              scrollDirection: Axis.horizontal,
              controller: _controller,
              children: [
                MyCard(
                  balance: 5250.20,
                  cardNumber: 12345678,
                  expiryMonth: 12,
                  expiryYear: 24,
                  color: Colors.deepPurple,
                ),
                MyCard(
                  balance: 2350.20,
                  cardNumber: 12345678,
                  expiryMonth: 11,
                  expiryYear: 25,
                  color: Colors.orange,
            
                ),
                MyCard(
                  balance: 5250.20,
                  cardNumber: 12345678,
                  expiryMonth: 12,
                  expiryYear: 24,
                  color: Colors.green,
                ),
              ],
            ),
          ),
        ),
        SmoothPageIndicator(
          controller: _controller,
           count: 3,
           effect: ExpandingDotsEffect(
            activeDotColor: Colors.grey.shade800
            ),
           ),


          SizedBox(height: 20),

           //buttons send and pay
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 25.0),
             child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //send
                MyButton(iconImagePath: "images/send-money.png",
                 buttonText: "Send"
                 ),

                //pay
                MyButton(iconImagePath: "images/credit-card.png",
                 buttonText: "Pay"
                 ),

                //bills
                MyButton(iconImagePath: "images/bill.png",
                 buttonText: "Bills"
                 ),
              ],
             ),
           ),          

        SizedBox(height: 20),
        //column stats transactions
        Padding(
          padding: const EdgeInsets.symmetric(horizontal:25.0),
          child: Column(
            children: [
              //statics
              MyListTile(iconImagePath: "images/graph.png",
               tileTitle: "Statitics",
                tileSubtitle: "Payments and Income"
                ),
              //transaction
               MyListTile(iconImagePath: "images/transaction.png",
               tileTitle: "Transaction",
                tileSubtitle: "Transaction History"
                )
          ],),
        )
        ]
      )
    );
  }
}