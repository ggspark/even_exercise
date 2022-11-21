
import 'package:even_exercise/constants.dart';
import 'package:flutter/material.dart';


class ConciergeCard extends StatelessWidget {
  const ConciergeCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
      child: Column(
        children: [
          const Divider(
            height: 1,
            color: Colors.black54,
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.grey,
                    child: Icon(Icons.person),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Marco",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.w700),
                  ),
                  Text(
                    " Corleone",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
              Row(
                children: const [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Color(whatsappGreen),
                    child: Icon(
                      Icons.whatsapp,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Color(phoneBlue),
                    child: Icon(
                      Icons.call,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          const Divider(
            height: 1,
            color: Colors.black54,
          ),
        ],
      ),
    );
  }
}
