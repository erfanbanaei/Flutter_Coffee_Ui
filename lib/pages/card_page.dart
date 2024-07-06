import 'package:coffeeapp/constants/constants.dart';
import 'package:coffeeapp/pages/payment_page.dart';
import 'package:coffeeapp/widgets/custombuttontop.dart';
import 'package:flutter/material.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  List<int> quantities = List<int>.filled(8, 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            const _Header(),
            const SizedBox(height: 20),
            _buildCardItem(
              "assets/images/coffee1.png",
              "Cappuccino",
              "With Steamed Milk",
              ["S", "M", "L"],
              [0, 1, 2],
              [4.20, 4.20, 4.20],
            ),
            const SizedBox(height: 20),
            _buildCardItem(
              "assets/images/coffee2.png",
              "Cappuccino",
              "With Steamed Milk",
              ["M"],
              [3],
              [6.20],
            ),
            const SizedBox(height: 20),
            _buildCardItem(
              "assets/images/beans1.png",
              "Robusta Beans",
              "From Africa",
              ["250gm"],
              [7],
              [6.20],
            ),
            const SizedBox(height: 20),
            _buildCardItem(
              "assets/images/beans2.png",
              "Liberica Coffee Beans",
              "With Steamed Milk",
              ["250gm", "500gm", "1kg"],
              [4, 5, 6],
              [4.20, 4.20, 4.20],
            ),
            const SizedBox(height: 20),
            _buildTotalPrice(context),
          ],
        ),
      ),
    );
  }

  Widget _buildCardItem(String imagePath, String title, String subtitle,
      List<String> sizes, List<int> indices, List<double> prices) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          end: Alignment(0.36, -0.93),
          begin: Alignment(-0.36, 0.93),
          colors: [Color(0xFF262B33), Color(0x00262B33)],
        ),
        borderRadius: BorderRadius.circular(23),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(imagePath, width: 100, height: 100),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w400)),
                  Text(subtitle,
                      style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Cgray)),
                  const SizedBox(height: 10),
                  Container(
                    width: 118,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Cprimary,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                      child: Text(
                        "Medium Roasted",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Cgray,
                            fontSize: 10,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          ...sizes.asMap().entries.map((entry) {
            int index = entry.key;
            String size = entry.value;
            return buildSizeRow(size, indices[index], prices[index], true);
          }).toList(),
        ],
      ),
    );
  }

  Widget buildSizeRow(String size, int index, double price, bool isCoffee) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildSizeContainer(size, isCoffee),
        _buildPriceText(price),
        _buildQuantityControl(index, isCoffee),
      ],
    );
  }

  Widget _buildSizeContainer(String size, bool isCoffee) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Container(
        width: 75,
        height: 32,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Cprimary,
        ),
        child: Center(
          child: Text(
            size,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: isCoffee ? Colors.white : Cgray,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPriceText(double price) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(
            fontSize: 16, color: Corange, fontWeight: FontWeight.w600),
        children: <TextSpan>[
          const TextSpan(text: "\$ "),
          TextSpan(
            text: price.toStringAsFixed(2),
            style: const TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  Widget _buildQuantityControl(int index, bool isCoffee) {
    return Row(
      children: [
        _buildQuantityButton(Icons.remove, () {
          setState(() {
            if (quantities[index] > 0) quantities[index]--;
          });
        }),
        _buildQuantityDisplay(index),
        _buildQuantityButton(Icons.add, () {
          setState(() {
            quantities[index]++;
          });
        }),
      ],
    );
  }

  Widget _buildQuantityButton(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 29,
        height: 29,
        decoration: BoxDecoration(
            color: Corange, borderRadius: BorderRadius.circular(7)),
        child: Icon(icon, color: Colors.white, size: 18),
      ),
    );
  }

  Widget _buildQuantityDisplay(int index) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: Container(
        width: 50,
        height: 30,
        decoration: BoxDecoration(
          color: Cprimary,
          borderRadius: BorderRadius.circular(7),
          border: Border.all(color: Corange),
        ),
        child: Center(
          child: Text(
            quantities[index].toString(),
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _buildTotalPrice(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const Text(
                "Total Price",
                style: TextStyle(
                    color: Cgray, fontSize: 12, fontWeight: FontWeight.w500),
              ),
              RichText(
                text: const TextSpan(
                  style: TextStyle(
                      fontSize: 20,
                      color: Corange,
                      fontWeight: FontWeight.w600),
                  children: <TextSpan>[
                    TextSpan(text: "\$ "),
                    TextSpan(
                      text: "10.40",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const PaymentPage()),
              );
            },
            overlayColor: const MaterialStatePropertyAll(Colors.transparent),
            child: Container(
              width: 240,
              height: 60,
              decoration: BoxDecoration(
                  color: Corange, borderRadius: BorderRadius.circular(20)),
              child: const Center(
                child: Text(
                  "Pay",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomButtonTop(models: Models.lang, text: "en"),
        Text(
          "Card",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        CustomButtonTop(models: Models.profile),
      ],
    );
  }
}
