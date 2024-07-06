import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:coffeeapp/constants/constants.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const BottomNavigationBarWidget({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Cprimary,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/home.svg",
                color: selectedIndex == 0 ? Corange : Cdarkgray,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/card.svg",
                color: selectedIndex == 1 ? Corange : Cdarkgray,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/favorite.svg",
                color: selectedIndex == 2 ? Corange : Cdarkgray,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/notifications.svg",
                color: selectedIndex == 3 ? Corange : Cdarkgray,
              ),
              label: "",
            ),
          ],
          currentIndex: selectedIndex,
          selectedItemColor: Corange,
          unselectedItemColor: Cdarkgray,
          onTap: onItemTapped,
        ),
      ),
    );
  }
}
