import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:platform_conveter_app/viwe/screens/add_page.dart';
import 'package:platform_conveter_app/viwe/screens/call_page.dart';
import 'package:platform_conveter_app/viwe/screens/chat_page.dart';
import 'package:platform_conveter_app/viwe/screens/setting_page.dart';

import '../controller/conveter_controller.dart';
import '../controller/paltform_controller.dart';
import '../controller/profile_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

ImagePicker imagePicker = ImagePicker();
File? fileImage;

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var homeController = Get.put(HomeController());
    var profileController = Get.put(ProfileController());
    var controller = Get.put(Convertercontroller());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Platform Converter',
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 27),
        ),
        actions: [
          Obx(
            () => Switch(
              value: controller.platformConverter.value,
              onChanged: (value) {
                controller.platformConverter.value = value;
              },
            ),
          ),
        ],
        bottom: TabBar(controller: _tabController, tabs: const [
          Tab(
            icon: Icon(Icons.person_add_alt_1),
          ),
          Tab(
            text: 'Chat',
          ),
          Tab(
            text: 'Call',
          ),
          Tab(
            text: 'Settings',
          ),
        ]),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          AddPeople(),
          ChatScreen(),
          CallScreen(),
          SettingsScreen(),
        ],
      ),
    );
  }
}
