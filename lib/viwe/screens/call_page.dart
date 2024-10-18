import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/paltform_controller.dart';
import '../../controller/profile_controller.dart';

class CallScreen extends StatelessWidget {
  const CallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var homeController = Get.put(HomeController());
    var profileController = Get.put(ProfileController());
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Obx(() {
        if (homeController.data.isEmpty) {
          return const Center(child: Text('No any chat '));
        }
        return Padding(
          padding: const EdgeInsets.all(10),
          child: ListView.builder(
            itemCount: homeController.data.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: FileImage(
                        File(homeController.data[index]['img']),
                      ),
                    ),
                    title: Text(homeController.data[index]['name']),
                    subtitle: Text(homeController.data[index]['chat']),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.call,
                          color: Colors.lightGreen,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                            onTap: () {
                              homeController.removeData(
                                int.parse(
                                  homeController.data[index]['id'].toString(),
                                ),
                              );
                            },
                            child: const Icon(
                              Icons.delete_outline,
                              color: Colors.red,
                            )),
                      ],
                    )),
              );
            },
          ),
        );
      }),
    );
  }
}
