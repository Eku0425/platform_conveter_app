import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/paltform_controller.dart';
import '../../controller/profile_controller.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var homeController = Get.put(HomeController());
    var profileController = Get.put(ProfileController());
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Obx(() {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Profile section
                ListTile(
                  leading: Icon(Icons.person),
                  title: const Text('Profile'),
                  subtitle: const Text('Update Profile '),
                  trailing: Switch(
                    value: profileController.isProfileEditable.value,
                    onChanged: (value) {
                      profileController.toggleProfileEditable();
                    },
                  ),
                ),
                const SizedBox(height: 10),
                if (profileController.isProfileEditable.value)
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.grey,
                        child: IconButton(
                          icon: Icon(Icons.camera_alt, size: 40),
                          onPressed: () {
                            // Functionality to update profile picture
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Enter Your Name...',
                            labelStyle: const TextStyle(color: Colors.green),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 1, color: Colors.green),
                                borderRadius: BorderRadius.circular(15)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Enter Your Bio...',
                            labelStyle: const TextStyle(color: Colors.green),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 1, color: Colors.blue),
                                borderRadius: BorderRadius.circular(15)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                          ),
                        ),
                      ),
                      const SizedBox(height: 7),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              // Add save functionality
                            },
                            child: Text('SAVE',
                                style: TextStyle(color: Colors.blue)),
                          ),
                          TextButton(
                            onPressed: () {
                              // Add clear functionality
                            },
                            child: Text('CLEAR',
                                style: TextStyle(color: Colors.blue)),
                          ),
                        ],
                      ),
                    ],
                  ),
                const Divider(thickness: 1),
                // Theme section
                ListTile(
                  leading: Icon(Icons.brightness_6),
                  title: Text('Theme'),
                  subtitle: Text('Change Theme'),
                  trailing: Switch(
                    value: profileController.isDarkTheme.value,
                    onChanged: (value) {
                      profileController.toggleTheme();
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
