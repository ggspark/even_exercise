import 'package:even_exercise/constants.dart';
import 'package:even_exercise/widgets/consultation_card.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({
    Key? key,
  }) : super(key: key);

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
                    onTap: () => {Navigator.pushNamed(context, '/service')},
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
                      child: Icon(
                        Icons.add_rounded,
                        size: 40,
                        color: Theme.of(context).colorScheme.onPrimary,
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
        ],
      ),
    );
  }
}
