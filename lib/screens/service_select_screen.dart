import 'dart:ui';

import 'package:even_exercise/constants.dart';
import 'package:flutter/material.dart';

class ServiceSelectScreen extends StatefulWidget {
  const ServiceSelectScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ServiceSelectScreen> createState() => _ServiceSelectScreenState();
}

class _ServiceSelectScreenState extends State<ServiceSelectScreen> {
  bool animating = true;

  @override
  void initState() {
    super.initState();
    runInitialAnimation();
  }

  void runInitialAnimation() async {
    setState(() {
      animating = true;
    });
    await Future.delayed(const Duration(milliseconds: 200));
    setState(() {
      animating = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Container(
        color: const Color(drawerBackground),
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Hero(
                    tag: 'hero1',
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                      child: Icon(
                        Icons.close_rounded,
                        size: 30,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeIn,
                    alignment: Alignment.center,
                    padding: animating
                        ? const EdgeInsets.symmetric(vertical: 0)
                        : const EdgeInsets.symmetric(vertical: 10),
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeIn,
                      opacity: animating ? 0 : 1,
                      child: Text(
                        "Choose type of service",
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 120,
            ),
            AnimatedSlide(
              duration: const Duration(milliseconds: 300),
              offset: animating ? const Offset(-1, 0) : Offset.zero,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Text(
                  "Tele-Consultation",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
            AnimatedSlide(
              duration: const Duration(milliseconds: 300),
              offset: animating ? const Offset(-1, 0) : Offset.zero,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Text(
                  "Consultation",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
            AnimatedSlide(
              duration: const Duration(milliseconds: 300),
              offset: animating ? const Offset(-1, 0) : Offset.zero,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Text(
                  "Lab tests",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
            AnimatedSlide(
              duration: const Duration(milliseconds: 300),
              offset: animating ? const Offset(-1, 0) : Offset.zero,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Text(
                  "Diagnostics",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
            AnimatedSlide(
              duration: const Duration(milliseconds: 300),
              offset: animating ? const Offset(-1, 0) : Offset.zero,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Text(
                  "Health checkup",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
