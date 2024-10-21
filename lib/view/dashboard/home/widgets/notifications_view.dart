import 'package:flutter/material.dart';
import 'package:gym_mate/res/colors/app_colors.dart';

class NotificationsView extends StatefulWidget {
  const NotificationsView({super.key});

  @override
  State<NotificationsView> createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<NotificationsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: AppColors.background,
          iconTheme: IconThemeData(
            color: AppColors.secondary, // Set the leading arrow color to white
          ),
          title: Center(
            child: Row(
              children: [
                const SizedBox(
                  width: 30,
                ),
                Text(
                  'Notifications',
                  style: TextStyle(
                    color: AppColors.secondary,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.notifications,
                  color: AppColors.secondary,
                ),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Center(
                child: Container(
                  width: 330,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white38,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment
                          .start, // Aligns the content to the start
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment
                                .start, // Aligns the text to the start
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Gym_mate 💪',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 23),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'This is the test Notification ❤️‍🔥',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
