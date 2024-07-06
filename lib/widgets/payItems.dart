import 'package:flutter/material.dart';

class PayItems extends StatelessWidget {
  final String nameImageFile;
  final String namePay;
  final String price;

  const PayItems({
    super.key,
    required this.nameImageFile,
    required this.namePay,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        width: double.maxFinite,
        height: 50,
        decoration: ShapeDecoration(
          gradient: const LinearGradient(
            end: Alignment(0.69, -0.73),
            begin: Alignment(-0.69, 0.73),
            colors: [Color(0xFF21262E), Color(0x0021262E)],
          ),
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              width: 1,
              color: Color(0xFF21262E),
            ),
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const SizedBox(width: 18),
                Image.asset(nameImageFile),
                const SizedBox(width: 15),
                Text(namePay)
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Text(price),
            )
          ],
        ),
      ),
    );
  }
}
