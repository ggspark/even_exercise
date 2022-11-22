import 'package:even_exercise/constants.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key, required this.currentIndex}) : super(key: key);

  final Function currentIndex;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int selectedIndex = 0;

  void setIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
    widget.currentIndex(index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: const Color(bottomNavBgColor),
      child: Column(children: [
        Container(
          height: 60,
          padding: const EdgeInsets.only(top: 8),
          decoration: const BoxDecoration(
            color: Color(darkBackgroundColor),
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => setIndex(0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: getContainerColor(0),
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(40),
                      ),
                    ),
                    child: Icon(
                      Icons.home_outlined,
                      color: getIconColor(0),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () => setIndex(1),
                  child: Container(
                    decoration: BoxDecoration(
                      color: getContainerColor(1),
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(40),
                      ),
                    ),
                    child: Icon(
                      Icons.history_outlined,
                      color: getIconColor(1),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () => setIndex(2),
                  child: Container(
                    decoration: BoxDecoration(
                      color: getContainerColor(2),
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(40),
                      ),
                    ),
                    child: Icon(
                      Icons.spa_outlined,
                      color: getIconColor(2),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () => setIndex(3),
                  child: Container(
                    decoration: BoxDecoration(
                      color: getContainerColor(3),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(40),
                      ),
                    ),
                    child: Icon(
                      Icons.person_outline,
                      color: getIconColor(3),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }

  Color getContainerColor(int index) =>
      Color(selectedIndex == index ? bottomNavBgColor : darkBackgroundColor);
  Color getIconColor(int index) => selectedIndex == index
      ? Theme.of(context).colorScheme.onPrimary
      : Theme.of(context).colorScheme.onSurface;
}
