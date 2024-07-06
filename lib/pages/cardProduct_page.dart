import 'package:coffeeapp/constants/constants.dart';
import 'package:coffeeapp/widgets/custombuttontop.dart';
import 'package:coffeeapp/widgets/customcard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardproductPage extends StatefulWidget {
  final num numRate;
  final String nameProduct;
  final String descriptionProduct;
  final num priceProduct;
  final String nameImageFile;
  final Model model;

  const CardproductPage({
    super.key,
    required this.model,
    required this.numRate,
    required this.nameProduct,
    required this.descriptionProduct,
    required this.priceProduct,
    required this.nameImageFile,
  });

  @override
  State<CardproductPage> createState() => _CardproductPageState();
}

class _CardproductPageState extends State<CardproductPage> {
  @override
  String selectedSize = 'M';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: const Bottomnavigationbar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  "assets/images/${widget.nameImageFile}.png",
                  width: double.maxFinite,
                  height: 600,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomButtonTop(
                        models: Models.icon,
                        nameFileImage: "assets/icons/back.png",
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      const CustomButtonTop(
                        models: Models.icon,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 175,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(25),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.nameProduct,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    widget.descriptionProduct,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Cgray,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 56,
                                    height: 56,
                                    decoration: BoxDecoration(
                                      color: Cprimary,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      children: [
                                        SvgPicture.asset(
                                          "assets/icons/coffee.svg",
                                          width: 32,
                                          height: 32,
                                        ),
                                        const Text(
                                          "Coffee",
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                            color: Cgray,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  Container(
                                    width: 56,
                                    height: 56,
                                    decoration: BoxDecoration(
                                        color: Cprimary,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Column(
                                      children: [
                                        SvgPicture.asset(
                                          "assets/icons/milk.svg",
                                          width: 32,
                                          height: 32,
                                        ),
                                        const Text(
                                          "Milk",
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                            color: Cgray,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/icons/star.svg",
                                    width: 23,
                                    height: 23,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    "${widget.numRate}",
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  const Text(
                                    "(6,454)",
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      color: Cgray,
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                width: 132,
                                height: 56,
                                decoration: BoxDecoration(
                                  color: Cprimary,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Center(
                                  child: Text(
                                    "Medium Roasted",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Cgray,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Description",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Cgray,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Cappuccino is a latte made with more foam than steamed milk, often with a sprinkle of cocoa powder or cinnamon on top.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Size",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Cgray,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: ['S', 'M', 'L'].map((size) {
                      return SizedBox(
                        width: 100,
                        height: 40,
                        child: ChoiceChip(
                          showCheckmark: false,
                          label: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Text(size),
                            ),
                          ),
                          selected: selectedSize == size,
                          onSelected: (bool selected) {
                            setState(() {
                              selectedSize = selected ? size : selectedSize;
                            });
                          },
                          selectedColor: const Color(0XFF141921),
                          backgroundColor: const Color(0XFF141921),
                          labelStyle: TextStyle(
                            color: selectedSize == size ? Corange : Cdarkgray,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: selectedSize == size
                                  ? Corange
                                  : const Color(0XFF141921),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          const Text(
                            "Price",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Cgray,
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              style: const TextStyle(
                                fontSize: 20,
                                color: Corange,
                                fontWeight: FontWeight.w600,
                              ),
                              children: <TextSpan>[
                                const TextSpan(text: "\$ "),
                                TextSpan(
                                  text: "${widget.priceProduct}",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        overlayColor:
                            const WidgetStatePropertyAll(Colors.transparent),
                        onTap: () {},
                        child: Container(
                          width: 240,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Corange,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Center(
                            child: Text(
                              "Add to Card",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
