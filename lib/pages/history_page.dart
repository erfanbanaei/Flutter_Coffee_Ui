import 'package:coffeeapp/widgets/custombuttontop.dart';
import 'package:coffeeapp/widgets/orderHistoryItem.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButtonTop(
                    models: Models.lang,
                    text: "en",
                  ),
                  Text(
                    "Order History",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  CustomButtonTop(models: Models.profile),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: OrderHistoryItem(
                  orderDate: "20th March 16:23",
                  totalAmount: "\$ 74.40",
                  imagePath: "assets/images/coffee2.png",
                  coffeeName: "Cappuccino",
                  coffeeDescription: "With Steamed Milk",
                  price: "37.20",
                  historyList: [
                    {"size": "S", "price": "4.20", "number": 2},
                    {"size": "M", "price": "6.20", "number": 2},
                    {"size": "L", "price": "8.20", "number": 2},
                  ],
                ),
              ),
              SizedBox(height: 15),
              OrderHistoryItem(
                imagePath: "assets/images/coffee1.png",
                coffeeName: "Cappuccino",
                coffeeDescription: "With Steamed Milk",
                price: "37.20",
                historyList: [
                  {"size": "S", "price": "4.20", "number": 2},
                  {"size": "M", "price": "6.20", "number": 2},
                ],
              ),
              SizedBox(
                height: 10,
              ),
              OrderHistoryItem(
                orderDate: "19th March 2023",
                totalAmount: "\$ 74.40",
                imagePath: "assets/images/beans1.png",
                coffeeName: "Cappuccino",
                coffeeDescription: "With Steamed Milk",
                price: "37.20",
                historyList: [
                  {"size": "250gm", "price": "4.20", "number": 2},
                  {"size": "500gm", "price": "6.20", "number": 2},
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
