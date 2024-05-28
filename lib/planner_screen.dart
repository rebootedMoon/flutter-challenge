import 'package:flutter/material.dart';
import 'package:flutter_challenge/constants/gaps.dart';
import 'package:flutter_challenge/constants/sizes.dart';
import 'package:flutter_challenge/widgets/time_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final days = [17, 18, 19, 20, 21, 22];

class PlannerScreen extends StatelessWidget {
  const PlannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final today = DateTime.now().day;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size20, vertical: Sizes.size20),
        child: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 32,
                      backgroundImage: NetworkImage(
                          "https://avatars.githubusercontent.com/u/90151845?v=4"),
                    ),
                    FaIcon(
                      FontAwesomeIcons.plus,
                      size: Sizes.size36,
                    )
                  ],
                ),
                Gaps.v20,
                const Text("MONDAY 16",
                    style: TextStyle(
                      fontSize: Sizes.size16,
                    )),
                Gaps.v10,
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      const Text("TODAY",
                          style: TextStyle(
                            fontSize: Sizes.size36,
                            fontWeight: FontWeight.w600,
                          )),
                      Gaps.h6,
                      const FaIcon(
                        Icons.circle,
                        size: Sizes.size10,
                        color: Colors.red,
                      ),
                      for (var day in days)
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: Sizes.size10),
                          child: Text(day.toString(),
                              style: TextStyle(
                                fontSize: Sizes.size36,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey.shade500,
                              )),
                        ),
                    ],
                  ),
                ),
                Gaps.v32,
                const TimeCard(
                  startHour: "11",
                  startMin: "30",
                  endHour: "12",
                  endMin: "20",
                  title: "Design\nMeeting",
                  color: Colors.amber,
                ),
                Gaps.v20,
                TimeCard(
                  startHour: "12",
                  startMin: "35",
                  endHour: "14",
                  endMin: "10",
                  title: "Daily\nProject",
                  color: Colors.purple.shade300,
                ),
                Gaps.v20,
                TimeCard(
                  startHour: "15",
                  startMin: "00",
                  endHour: "16",
                  endMin: "30",
                  title: "Weekly\nPlanning",
                  color: Colors.green.shade500,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
