import 'package:even_exercise/constants.dart';
import 'package:even_exercise/widgets/concierge_card.dart';
import 'package:even_exercise/widgets/hospital_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final NavState navState;

  const HomeScreen({Key? key, required this.navState}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NavState _navState = NavState.noNav;
  @override
  void initState() {
    super.initState();
    navigateIn();
  }

  @override
  void didUpdateWidget(covariant HomeScreen oldWidget) {
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
      child: AnimatedSlide(
        duration: shortAnimationDuration,
        curve: Curves.easeIn,
        offset: _navState == NavState.noNav ? Offset.zero : const Offset(-1, 0),
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 40),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
              child: Text(
                "Hospitals near you",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              height: 510,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                children: const [HospitalCard(), HospitalCard()],
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
              child: Text(
                "Your medical concierge",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.w700),
              ),
            ),
            const ConciergeCard()
          ],
        ),
      ),
    );
  }
}
