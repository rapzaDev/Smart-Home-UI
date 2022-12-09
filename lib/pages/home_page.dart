// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_home_ui/utils/components/smart_device_box.dart';
import 'package:smart_home_ui/utils/devices/smart_devices.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    //padding constants
    const double horizontalPadding = 40;
    const double verticalPadding = 25;
    ScrollController _scrollController = ScrollController();

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _scrollController,
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //custom app bar
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: horizontalPadding,
                    vertical: verticalPadding,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'lib/utils/icons/menu.png',
                        height: 45,
                        color: Colors.grey[800],
                      ),

                      //account icon
                      Icon(
                        Icons.person,
                        size: 45,
                        color: Colors.grey[800],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                //welcome home rafael perez
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: horizontalPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome Home,",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey[700],
                        ),
                      ),
                      Text(
                        "RAFAEL PÉREZ",
                        style: GoogleFonts.bebasNeue(fontSize: 50),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: horizontalPadding),
                  child: Divider(
                    color: Colors.grey[400],
                    thickness: 1,
                  ),
                ),

                const SizedBox(height: 25),

                //smart devices grid
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: horizontalPadding),
                  child: Text(
                    "Smart Devices",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.grey[800],
                    ),
                  ),
                ),

                Expanded(
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: smartDevices.length,
                    padding: const EdgeInsets.all(15),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1 / 1.3,
                    ),
                    itemBuilder: (context, index) {
                      return SmartDeviceBox(
                        smartDeviceName: smartDevices[index][0],
                        iconPath: smartDevices[index][1],
                        powerOn: smartDevices[index][2],
                        onChanged: (value) => powerSwitchChanged(value, index),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void powerSwitchChanged(bool value, int index) {
    setState(() {
      smartDevices[index][2] = value;
    });
  }
}
