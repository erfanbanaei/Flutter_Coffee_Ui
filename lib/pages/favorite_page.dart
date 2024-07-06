import 'package:coffeeapp/constants/constants.dart';
import 'package:coffeeapp/widgets/custombuttontop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              _buildHeader(),
              const SizedBox(height: 25),
              _buildFavoriteItem(
                imagePath: "assets/images/coffee1.png",
                title: "Cappuccino",
                subtitle: "with steamed Milk",
                rating: 4.5,
                reviews: 6454,
                description:
                    "Cappuccino is a latte made with more foam than steamed milk, often with a sprinkle of cocoa powder or cinnamon on top.",
                icons: [
                  _IconData("assets/icons/coffee.svg", "Coffee"),
                  _IconData("assets/icons/milk.svg", "Milk"),
                ],
              ),
              const SizedBox(height: 20),
              _buildFavoriteItem(
                imagePath: "assets/images/coffee1.png",
                title: "Cappuccino",
                subtitle: "with steamed Milk",
                rating: 4.5,
                reviews: 6454,
                description:
                    "Cappuccino is a latte made with more foam than steamed milk, often with a sprinkle of cocoa powder or cinnamon on top.",
                icons: [
                  _IconData("assets/icons/coffee.svg", "Coffee"),
                  _IconData("assets/icons/milk.svg", "Milk"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomButtonTop(models: Models.lang, text: "en"),
        Text(
          "Favorites",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        CustomButtonTop(models: Models.profile),
      ],
    );
  }

  Widget _buildFavoriteItem({
    required String imagePath,
    required String title,
    required String subtitle,
    required double rating,
    required int reviews,
    required String description,
    required List<_IconData> icons,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(23),
      child: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                imagePath,
                width: double.maxFinite,
                height: 600,
                fit: BoxFit.cover,
              ),
              const Positioned(
                top: 30,
                right: 30,
                child: CustomButtonTop(models: Models.icon),
              ),
              _buildItemDetails(
                title: title,
                subtitle: subtitle,
                rating: rating,
                reviews: reviews,
                icons: icons,
              ),
            ],
          ),
          _buildDescription(description),
        ],
      ),
    );
  }

  Widget _buildItemDetails({
    required String title,
    required String subtitle,
    required double rating,
    required int reviews,
    required List<_IconData> icons,
  }) {
    return Positioned(
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
                        title,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        subtitle,
                        style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Cgray),
                      ),
                    ],
                  ),
                  _buildIconsRow(icons),
                ],
              ),
              _buildRatingsRow(rating: rating, reviews: reviews),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIconsRow(List<_IconData> icons) {
    return Row(
      children: icons
          .map((icon) => _buildIconContainer(icon.assetPath, icon.label))
          .toList(),
    );
  }

  Widget _buildIconContainer(String assetPath, String label) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          color: Cprimary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(assetPath, width: 32, height: 32),
            Text(
              label,
              style: const TextStyle(
                  fontSize: 10, fontWeight: FontWeight.w500, color: Cgray),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRatingsRow({required double rating, required int reviews}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SvgPicture.asset("assets/icons/star.svg", width: 23, height: 23),
            const SizedBox(width: 5),
            Text(
              rating.toString(),
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(width: 5),
            Text(
              "($reviews)",
              style: const TextStyle(
                  fontSize: 10, fontWeight: FontWeight.w400, color: Cgray),
            ),
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
                  color: Cgray, fontSize: 10, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDescription(String description) {
    return Container(
      width: double.maxFinite,
      height: 120,
      decoration: const ShapeDecoration(
        gradient: LinearGradient(
          end: Alignment(0.69, -0.73),
          begin: Alignment(-0.69, 0.73),
          colors: [Color(0xFF21262E), Color(0x0021262E)],
        ),
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Color(0xFF21262E)),
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Description",
              style: TextStyle(
                  fontSize: 14, fontWeight: FontWeight.w600, color: Cgray),
            ),
            SizedBox(height: 5),
            Text(
              "Cappuccino is a latte made with more foam than steamed milk, often with a sprinkle of cocoa powder or cinnamon on top.",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}

class _IconData {
  final String assetPath;
  final String label;

  _IconData(this.assetPath, this.label);
}
