import 'dart:ui';

import 'package:even_exercise/constants.dart';
import 'package:flutter/material.dart';

class ServiceSelectScreen extends StatelessWidget {
  const ServiceSelectScreen({
    Key? key,
  }) : super(key: key);

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
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
              child: Stack(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.close_rounded,
                      size: 30,
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text("Choose type of service",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                  fontWeight: FontWeight.w700,
                                )),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 120,
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text(
                "Tele-Consultation",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text(
                "Consultation",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text(
                "Lab tests",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text(
                "Diagnostics",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text(
                "Health checkup",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ],
        )),
      ),
    );
  }
}
