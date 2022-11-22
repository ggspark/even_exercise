import 'package:even_exercise/constants.dart';
import 'package:even_exercise/widgets/prescription_box.dart';
import 'package:flutter/material.dart';

class ConsultationCard extends StatelessWidget {
  const ConsultationCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 32),
          child: SizedBox(
            width: 80,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("05:35 PM",
                    textAlign: TextAlign.right,
                    style: Theme.of(context).textTheme.bodySmall),
                Text(
                  "Today",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.all(8),
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(24),
              ),
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  color: Theme.of(context).colorScheme.surface,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "CONSULTATION",
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          const SizedBox(
                            height: 24,
                            child: Image(
                                image: AssetImage('images/icon1.png'),
                                fit: BoxFit.cover),
                          ),
                        ],
                      ),
                      Text(
                        "Dr. Jordan Henderson",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "Aster RV - Multispeciality Hospital, JP Nagar, Bengaluru",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontSize: 10, height: 2),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          alignment: WrapAlignment.start,
                          direction: Axis.horizontal,
                          children: const [
                            PrescriptionBox(),
                            PrescriptionBox(),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(16),
                            ),
                            color: Color(buttonColor)),
                        child: Text(
                          "UPLOAD DOCS",
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    color: const Color(lightBackgroundColor),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Feedback",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                  ),
                            ),
                            Text(
                              "Edit",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                      fontSize: 10,
                                      color: const Color(buttonColor),
                                      fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          "Every interaction with the hospital was great!",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    )),
              ],
            ),
          ),
        )
      ],
    );
  }
}
