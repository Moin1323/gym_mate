import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gym_mate/res/colors/app_colors.dart';

class NotificationsView extends StatefulWidget {
  const NotificationsView({super.key});

  @override
  State<NotificationsView> createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<NotificationsView> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Function to get the current user's ID
  Future<String?> _getCurrentUserId() async {
    User? user = _auth.currentUser;
    return user?.uid; // Returns the UID of the logged-in user
  }

  // Function to delete a notification from Firestore
  Future<void> _deleteNotification(String userId, String notificationId) async {
    await FirebaseFirestore.instance
        .collection('notifications')
        .doc(userId)
        .collection('user_notifications')
        .doc(notificationId)
        .delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        iconTheme: IconThemeData(
          color: AppColors.secondary, // Set the leading arrow color
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Notifications',
              style: TextStyle(
                color: AppColors.secondary,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 5),
            Icon(
              Icons.notifications,
              color: AppColors.secondary,
            ),
          ],
        ),
        centerTitle: true, // Align title to the center
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<String?>(
          future: _getCurrentUserId(),
          builder: (context, AsyncSnapshot<String?> userIdSnapshot) {
            if (!userIdSnapshot.hasData) {
              return const Center(
                child: CupertinoActivityIndicator(),
              );
            }

            // Now that we have the user ID, we fetch their notifications
            String userId = userIdSnapshot.data!;

            return StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('notifications')
                  .doc(userId)
                  .collection('user_notifications')
                  .orderBy('timestamp', descending: true)
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return const Center(
                    child: Text("Error fetching notifications"),
                  );
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CupertinoActivityIndicator(),
                  );
                }

                if (snapshot.data!.docs.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'No notifications found!',
                          style: TextStyle(
                            color: AppColors.secondary,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
                }

                // Wrap the ListTile widgets in a Column inside SingleChildScrollView
                return SingleChildScrollView(
                  child: Column(
                    children: snapshot.data!.docs.map((notification) {
                      String notificationId = notification.id;

                      return Dismissible(
                        key: Key(notificationId), // Unique key for each item
                        direction: DismissDirection
                            .endToStart, // Swipe from right to left
                        background: Container(
                          color: Colors.red,
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: const Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                        ),
                        onDismissed: (direction) {
                          // Delete the notification from Firestore
                          _deleteNotification(userId, notificationId);

                          // Show a Snackbar to notify the user
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              duration: Duration(seconds: 1),
                              content: Center(
                                child: Text(
                                  'Notification deleted',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              backgroundColor: Colors.red,
                            ),
                          );
                        },
                        child: Card(
                          color: Colors.white38,
                          elevation: 3,
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.white10,
                              child: Icon(
                                Icons.notifications,
                                color: AppColors.primary,
                              ),
                            ),
                            title: Text(notification['title']),
                            subtitle: Text(notification['body']),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
