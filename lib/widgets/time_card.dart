import 'package:flutter/material.dart';
import 'package:flutter_challenge/constants/gaps.dart';
import 'package:flutter_challenge/constants/sizes.dart';

class TimeCard extends StatelessWidget {
  const TimeCard({
    super.key,
    required this.startHour,
    required this.startMin,
    required this.endHour,
    required this.endMin,
    required this.title,
    required this.color,
  });
  final String startHour;
  final String startMin;
  final String endHour;
  final String endMin;
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.size10,
        vertical: Sizes.size20,
      ),
      height: 200,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(
          Sizes.size20,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: DefaultTextStyle(
              style: const TextStyle(color: Colors.black),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Text(startHour,
                        style: const TextStyle(
                          fontSize: Sizes.size28,
                        )),
                    Text(startMin,
                        style: const TextStyle(
                            fontSize: Sizes.size18, height: 0.9)),
                    Gaps.v10,
                    Container(
                      height: 20,
                      width: 2,
                      color: Colors.black,
                    ),
                    Text(endHour,
                        style: const TextStyle(
                          fontSize: Sizes.size28,
                        )),
                    Text(endMin,
                        style: const TextStyle(
                          fontSize: Sizes.size18,
                          height: 0.9,
                        )),
                  ]),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: Sizes.size12),
                          child: Text(
                            title.toUpperCase(),
                            style: const TextStyle(
                                fontSize: Sizes.size48,
                                fontWeight: FontWeight.w600,
                                height: 1),
                          ),
                        ),
                        const DefaultTextStyle(
                          style: TextStyle(
                            color: Colors.black45,
                            fontSize: Sizes.size16,
                            fontWeight: FontWeight.w700,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("ME"),
                              Text("RECHARD"),
                              Text("CIRY"),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
