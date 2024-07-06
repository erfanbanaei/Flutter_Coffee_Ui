import 'package:coffeeapp/constants/constants.dart';
import 'package:coffeeapp/widgets/custombuttontop.dart';
import 'package:coffeeapp/widgets/payItems.dart';
import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButtonTop(
                  models: Models.icon,
                  nameFileImage: "assets/icons/back.png",
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                const Text(
                  "Payment",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const CustomButtonTop(models: Models.profile),
              ],
            ),
            const SizedBox(height: 30),
            _buildCreditCard(),
            const SizedBox(height: 15),
            const PayItems(
              nameImageFile: "assets/icons/wallet.png",
              namePay: "Wallet",
              price: "\$ 100.50",
            ),
            const PayItems(
              nameImageFile: "assets/icons/GooglePay.png",
              namePay: "Google Pay",
              price: "",
            ),
            const PayItems(
              nameImageFile: "assets/icons/apple.png",
              namePay: "Apple Pay",
              price: "",
            ),
            const PayItems(
              nameImageFile: "assets/icons/amazon.png",
              namePay: "Amazon Pay",
              price: "",
            ),
            Expanded(
              child: Container(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: _buildTotalPriceAndPayButton(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCreditCard() {
    return Container(
      width: double.maxFinite,
      height: 250,
      decoration: BoxDecoration(
        border: Border.all(
          color: Corange,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Credit Card",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.maxFinite,
              height: 186,
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
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset("assets/icons/sim.png"),
                          Image.asset("assets/icons/visa.png"),
                        ],
                      ),
                    ),
                    const Text(
                      "3897 8923 6745 4638",
                      style: TextStyle(
                        letterSpacing: 8,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              "Card Holder Name",
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: Cgray,
                              ),
                            ),
                            Text(
                              "Robert Evans",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "Expiry Date",
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: Cgray,
                              ),
                            ),
                            Text(
                              "02/30",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTotalPriceAndPayButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            const Text(
              "Total Price",
              style: TextStyle(
                color: Cgray,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            RichText(
              text: const TextSpan(
                style: TextStyle(
                  fontSize: 20,
                  color: Corange,
                  fontWeight: FontWeight.w600,
                ),
                children: <TextSpan>[
                  TextSpan(text: "\$ "),
                  TextSpan(
                    text: "4.20",
                    style: TextStyle(
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
          onTap: () {},
          overlayColor: const MaterialStatePropertyAll(Colors.transparent),
          child: Container(
            width: 240,
            height: 60,
            decoration: BoxDecoration(
              color: Corange,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Center(
              child: Text(
                "Pay from Credit Card",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
