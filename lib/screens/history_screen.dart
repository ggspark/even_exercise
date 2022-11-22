import 'package:even_exercise/constants.dart';
import 'package:even_exercise/screens/service_select_screen.dart';
import 'package:even_exercise/widgets/consultation_card.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
  final NavState navState;

  const HistoryScreen({Key? key, required this.navState}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  bool _animating = false;
  NavState _navState = NavState.noNav;

  @override
  void initState() {
    super.initState();
    navigateIn();
  }

  @override
  void didUpdateWidget(covariant HistoryScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.navState == NavState.bottomNavOut) {
      navigateOut();
    }
  }

  void navigateIn() async {
    setState(() {
      _navState = NavState.bottomNavIn;
    });
    await Future.delayed(shortAnimationDuration);
    if (mounted) {
      setState(() {
        _navState = NavState.noNav;
      });
    }
  }

  void navigateOut() async {
    if (mounted) {
      setState(() {
        _navState = NavState.bottomNavOut;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          AnimatedSlide(
            duration: shortAnimationDuration,
            curve: Curves.easeIn,
            offset: _navState == NavState.noNav
                ? Offset.zero
                : const Offset(0, 0.5),
            child: Container(
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
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: AnimatedOpacity(
                  duration: shortAnimationDuration,
                  curve: Curves.easeIn,
                  opacity: _navState == NavState.noNav ? 1 : 0,
                  child: Text(
                    "My History",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              AnimatedOpacity(
                duration: shortAnimationDuration,
                curve: Curves.easeIn,
                opacity: _navState == NavState.noNav ? 1 : 0,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () async => {
                        setState(() => {_animating = true}),
                        await Future.delayed(animationDuration),
                        openSelectService(context),
                        await Future.delayed(animationDuration),
                        setState(() => {_animating = false}),
                      },
                      child: AnimatedSlide(
                        duration: shortAnimationDuration,
                        curve: Curves.easeIn,
                        offset: _navState == NavState.noNav
                            ? Offset.zero
                            : const Offset(0, -2),
                        child: Container(
                          width: 64,
                          height: 64,
                          margin: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 20),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: const Color(buttonColorLight),
                                  width: 6),
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
                    ),
                    Text(
                      "Add consultation",
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: const Color(buttonColor)),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    AnimatedSlide(
                      duration: shortAnimationDuration,
                      curve: Curves.easeIn,
                      offset: _navState == NavState.noNav
                          ? Offset.zero
                          : const Offset(1, 0),
                      child: const ConsultationCard(),
                    ),
                    AnimatedSlide(
                      duration: shortAnimationDuration,
                      curve: Curves.easeIn,
                      offset: _navState == NavState.noNav
                          ? Offset.zero
                          : const Offset(1.5, 0),
                      child: const ConsultationCard(),
                    ),
                    AnimatedSlide(
                      duration: shortAnimationDuration,
                      curve: Curves.easeIn,
                      offset: _navState == NavState.noNav
                          ? Offset.zero
                          : const Offset(2, 0),
                      child: const ConsultationCard(),
                    ),
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
                duration: animationDuration,
                width: _animating
                    ? MediaQuery.of(context).size.longestSide * 2
                    : 0,
                height: _animating
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
          transitionDuration: animationDuration,
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c)),
    );
  }
}
