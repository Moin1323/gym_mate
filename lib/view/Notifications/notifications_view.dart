import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Add FirebaseAuth to get user info
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
    return user?.uid;
  }

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
            FutureBuilder<String?>(
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
                      return const Center(
                        child: Text('No notifications found!'),
                      );
                    }

                    return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        var notification = snapshot.data!.docs[index];
                        return Card(
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
                        );
                      },
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
