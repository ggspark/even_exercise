import 'package:flutter/material.dart';

class PrescriptionBox extends StatelessWidget {
  const PrescriptionBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: 32,
      margin: const EdgeInsets.fromLTRB(0, 4, 8, 4),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: const Image(
          image: AssetImage('images/prescription1.png'), fit: BoxFit.cover),
    );
  }
}
