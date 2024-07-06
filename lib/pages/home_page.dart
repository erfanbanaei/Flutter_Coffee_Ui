import 'package:coffeeapp/constants/constants.dart';
import 'package:coffeeapp/widgets/coffeelistItem.dart';
import 'package:coffeeapp/widgets/custombuttontop.dart';
import 'package:coffeeapp/widgets/customcard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

final List<String> coffeeTypes = [
  "All",
  "Cappuccino",
  "Espresso",
  "Americano",
  "Macchiato",
];

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Column(
            children: [
              const _TopBar(),
              const SizedBox(height: 30),
              const _Header(),
              const SizedBox(height: 30),
              const _SearchField(),
              const SizedBox(height: 30),
              _CoffeeTypeSelector(
                selectedIndex: selectedIndex,
                onSelect: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
              ),
              const SizedBox(height: 30),
              const _CoffeeCardList(),
              const SizedBox(height: 20),
              const _SectionTitle(title: "Coffee beans"),
              const SizedBox(height: 20),
              const _CoffeeBeansCardList(),
              const SizedBox(height: 20),
              const _SectionTitle(title: "Coffee Maker"),
              const SizedBox(height: 20),
              const _CoffeeMakerCardList(),
            ],
          ),
        ),
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar();

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomButtonTop(models: Models.lang, text: "en"),
        CustomButtonTop(models: Models.profile),
      ],
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.centerLeft,
      child: Text(
        "Find the best\ncoffee for you",
        style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
        textAlign: TextAlign.left,
      ),
    );
  }
}

class _SearchField extends StatelessWidget {
  const _SearchField();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: TextField(
        style: const TextStyle(fontSize: 16, color: Cdarkgray),
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xFF141921),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
          hintText: "Find Your Coffee...",
          hintStyle: const TextStyle(
            fontSize: 12,
            color: Cdarkgray,
            fontWeight: FontWeight.w500,
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SvgPicture.asset(
              "assets/icons/search-normal.svg",
              width: 20,
              height: 20,
            ),
          ),
        ),
      ),
    );
  }
}

class _CoffeeTypeSelector extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onSelect;

  const _CoffeeTypeSelector({
    required this.selectedIndex,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: coffeeTypes.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CoffeeListItem(
              text: coffeeTypes[index],
              isSelected: selectedIndex == index,
              onTap: () => onSelect(index),
            ),
          );
        },
      ),
    );
  }
}

class _CoffeeCardList extends StatelessWidget {
  const _CoffeeCardList();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          CustomCard(
            model: Model.coffee,
            numRate: 4.5,
            nameProduct: "Cappuccino",
            descriptionProduct: "With Steamed Milk",
            priceProduct: 4.20,
            nameImageFile: "coffee1",
          ),
          CustomCard(
            model: Model.coffee,
            numRate: 4.2,
            nameProduct: "Cappuccino",
            descriptionProduct: "With Foam",
            priceProduct: 4.20,
            nameImageFile: "coffee2",
          ),
          CustomCard(
            model: Model.coffee,
            numRate: 4.2,
            nameProduct: "Cappuccino",
            descriptionProduct: "With Foam",
            priceProduct: 4.20,
            nameImageFile: "coffee2",
          ),
        ],
      ),
    );
  }
}

class _CoffeeBeansCardList extends StatelessWidget {
  const _CoffeeBeansCardList();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          CustomCard(
            model: Model.beans,
            numRate: 4.5,
            nameProduct: "Robusta Beans",
            descriptionProduct: "Medium Roasted",
            priceProduct: 4.20,
            nameImageFile: "beans1",
          ),
          CustomCard(
            model: Model.beans,
            numRate: 4.2,
            nameProduct: "Cappuccino",
            descriptionProduct: "With Steamed Milk",
            priceProduct: 4.20,
            nameImageFile: "beans2",
          ),
          CustomCard(
            model: Model.beans,
            numRate: 4.2,
            nameProduct: "Cappuccino",
            descriptionProduct: "With Steamed Milk",
            priceProduct: 4.20,
            nameImageFile: "beans2",
          ),
        ],
      ),
    );
  }
}

class _CoffeeMakerCardList extends StatelessWidget {
  const _CoffeeMakerCardList();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 265,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          CustomCard(
            model: Model.coffeeMaker,
            numRate: 4.9,
            nameProduct: "Espresso Stove",
            descriptionProduct: "Continental Moka Percolator Pot",
            priceProduct: 10.68,
            nameImageFile: "coffeeMaker1",
          ),
          CustomCard(
            model: Model.coffeeMaker,
            numRate: 3.2,
            nameProduct: "COFFEE MAKER",
            descriptionProduct: "coffee in one touch",
            priceProduct: 34.99,
            nameImageFile: "coffeeMaker2",
          ),
          CustomCard(
            model: Model.coffeeMaker,
            numRate: 3.2,
            nameProduct: "COFFEE MAKER",
            descriptionProduct: "coffee in one touch",
            priceProduct: 34.99,
            nameImageFile: "coffeeMaker2",
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;

  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
