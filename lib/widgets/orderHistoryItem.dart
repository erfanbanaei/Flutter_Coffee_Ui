import 'package:coffeeapp/constants/constants.dart';
import 'package:flutter/material.dart';

class OrderHistoryItem extends StatelessWidget {
  final String? orderDate;
  final String? totalAmount;
  final String imagePath;
  final String coffeeName;
  final String coffeeDescription;
  final String price;
  final List<Map<String, dynamic>> historyList;

  const OrderHistoryItem({
    super.key,
    this.orderDate,
    this.totalAmount,
    required this.imagePath,
    required this.coffeeName,
    required this.coffeeDescription,
    required this.price,
    required this.historyList,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (orderDate != null && totalAmount != null) ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Order Date",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    orderDate!,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Total Amount",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    totalAmount!,
                    style: TextStyle(
                      fontSize: 14,
                      color: Corange,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 15),
        ],
        Container(
          width: double.maxFinite,
          height: 255,
          decoration: ShapeDecoration(
            gradient: const LinearGradient(
              end: Alignment(0.36, -0.93),
              begin: Alignment(-0.36, 0.93),
              colors: [Color(0xFF262B33), Color(0x00262B33)],
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(23),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            imagePath,
                            width: 57,
                            height: 57,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              coffeeName,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              coffeeDescription,
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: Cgray,
                              ),
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ],
                    ),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 20,
                          color: Corange,
                          fontWeight: FontWeight.bold,
                        ),
                        children: <TextSpan>[
                          TextSpan(text: "\$ "),
                          TextSpan(
                            text: price,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                ...historyList
                    .map((item) => buildHistoryList(
                        item['size'], item['price'], item['number']))
                    .toList(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildHistoryList(String size, String price, int number) {
    num totalPrice = num.parse(price) * number;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 56,
              height: 35,
              decoration: const BoxDecoration(
                color: Cprimary,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
              ),
              child: Center(
                child: Text(
                  size,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 1),
            Container(
              width: 82,
              height: 35,
              decoration: const BoxDecoration(
                color: Cprimary,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Center(
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 16,
                      color: Corange,
                      fontWeight: FontWeight.bold,
                    ),
                    children: <TextSpan>[
                      const TextSpan(text: "\$ "),
                      TextSpan(
                        text: price,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        RichText(
          text: TextSpan(
            style: const TextStyle(
              fontSize: 16,
              color: Corange,
              fontWeight: FontWeight.w600,
            ),
            children: <TextSpan>[
              const TextSpan(text: "☓ "),
              TextSpan(
                text: "$number",
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        Text(
          "$totalPrice",
          style: const TextStyle(
            color: Corange,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
