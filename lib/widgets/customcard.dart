import 'package:coffeeapp/constants/constants.dart';
import 'package:coffeeapp/pages/cardProduct_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

enum Model {
  coffee,
  beans,
  coffeeMaker,
}

class CustomCard extends StatelessWidget {
  final Model model;
  final num numRate;
  final String nameProduct;
  final String descriptionProduct;
  final num priceProduct;
  final String nameImageFile;
  const CustomCard({
    super.key,
    required this.numRate,
    required this.nameProduct,
    required this.descriptionProduct,
    required this.priceProduct,
    required this.nameImageFile,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: InkWell(
        overlayColor: const WidgetStatePropertyAll(Colors.transparent),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CardproductPage(
                model:model,
                numRate: numRate,
                nameProduct: nameProduct,
                descriptionProduct: descriptionProduct,
                priceProduct: priceProduct,
                nameImageFile: nameImageFile,
              ),
            ),
          );
        },
        child: Container(
          width: 150,
          height: 250,
          decoration: ShapeDecoration(
            gradient: const LinearGradient(
              begin: Alignment(0.69, -0.73),
              end: Alignment(-0.69, 0.73),
              colors: [Color(0xFF21262E), Color(0x0021262E)],
            ),
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                width: 1,
                color: Color(0xFF21262E),
              ),
              borderRadius: BorderRadius.circular(23),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(23),
                      child: Image.asset(
                        "assets/images/$nameImageFile.png",
                        width: 136,
                        height: 136,
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        height: 22,
                        width: 53,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.7),
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(23),
                            bottomLeft: Radius.circular(23),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              "assets/icons/star.svg",
                              width: 12,
                              height: 12,
                            ),
                            Text(
                              "$numRate",
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        nameProduct,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        descriptionProduct,
                        style: const TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          fontSize: 15,
                          color: Corange,
                          fontWeight: FontWeight.bold,
                        ),
                        children: <TextSpan>[
                          const TextSpan(text: "\$ "),
                          TextSpan(
                            text: "$priceProduct",
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      overlayColor: const WidgetStatePropertyAll(
                        Colors.transparent,
                      ),
                      child: Container(
                        width: 29,
                        height: 29,
                        decoration: BoxDecoration(
                          color: Corange,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.add,
                            size: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
