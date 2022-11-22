import 'package:even_exercise/constants.dart';
import 'package:even_exercise/screens/service_select_screen.dart';
import 'package:even_exercise/widgets/consultation_card.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  bool navigating = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Container(
            width: 4,
            margin: const EdgeInsets.fromLTRB(50, 80, 20, 0),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  Color(buttonColorLight),
                  Color(darkBackgroundColor),
                ],
                tileMode: TileMode.clamp,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  "My History",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontWeight: FontWeight.w700),
                ),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () async => {
                      setState(() => {navigating = true}),
                      await Future.delayed(const Duration(milliseconds: 400)),
                      openSelectService(context),
                      await Future.delayed(const Duration(milliseconds: 400)),
                      setState(() => {navigating = false}),
                    },
                    child: Container(
                      width: 64,
                      height: 64,
                      margin: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 20),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color(buttonColorLight), width: 6),
                          shape: BoxShape.circle,
                          color: const Color(buttonColor)),
                      child: Hero(
                        tag: 'hero1',
                        child: Icon(
                          Icons.add_rounded,
                          size: 40,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "Add consultation",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: const Color(buttonColor)),
                  ),
                ],
              ),
              Expanded(
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: const [
                    ConsultationCard(),
                    ConsultationCard(),
                    ConsultationCard()
                  ],
                ),
              )
            ],
          ),
          Positioned(
            top: 80,
            left: 50,
            width: 0,
            height: 0,
            child: OverflowBox(
              maxHeight: MediaQuery.of(context).size.longestSide * 2,
              maxWidth: MediaQuery.of(context).size.longestSide * 2,
              child: AnimatedContainer(
                curve: Curves.easeIn,
                duration: const Duration(milliseconds: 400),
                width: navigating
                    ? MediaQuery.of(context).size.longestSide * 2
                    : 0,
                height: navigating
                    ? MediaQuery.of(context).size.longestSide * 2
                    : 0,
                decoration: const BoxDecoration(
                    color: Color(buttonColor), shape: BoxShape.circle),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> openSelectService(BuildContext context) {
    return Navigator.push(
      context,
      PageRouteBuilder(
          pageBuilder: (_, __, ___) => const ServiceSelectScreen(),
          transitionDuration: const Duration(milliseconds: 400),
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c)),
    );
  }
}
