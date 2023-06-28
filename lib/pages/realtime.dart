import 'dart:async';

import 'package:design/utils/app_colors.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class RealtimeDataScreen extends StatefulWidget {
  @override
  _RealtimeDataScreenState createState() => _RealtimeDataScreenState();
}

class _RealtimeDataScreenState extends State<RealtimeDataScreen> {
  final databaseReference = FirebaseDatabase.instance
      .refFromURL('https://sigfox-4a13d-default-rtdb.firebaseio.com');

  List<String> dropdownItems = [];
  String selectedDropdownItem = '';
  Map<String, dynamic> filteredData = {};

  @override
  void initState() {
    super.initState();

    // Fetch initial device list from the database
    fetchDeviceListFromDatabase();
  }

  void fetchDeviceListFromDatabase() {
    final devicesReference = databaseReference.child('WiFi_Devices');

    devicesReference.onValue.listen((event) {
      final devicesData = event.snapshot.value as Map<dynamic, dynamic>;

      setState(() {
        dropdownItems = devicesData.keys.cast<String>().toList();
        selectedDropdownItem = dropdownItems.first;
      });

      // Fetch initial data for the selected device
      fetchDataFromDatabase();
    }, onError: (error) {
      print('Error fetching device list: $error');
    });
  }

  void fetchDataFromDatabase() {
    final deviceReference = databaseReference
        .child('WiFi_Devices')
        .child(selectedDropdownItem)
        .child('Last Update');

    deviceReference.onValue.listen((event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>;

      if (data != null) {
        setState(() {
          filteredData = data.cast<String, dynamic>();
        });
      } else {
        setState(() {
          filteredData = {}; // Reset data if it's null
        });
      }
    }, onError: (error) {
      print('Error fetching data: $error');
    });
  }

  void updateSelectedDropdownItem(String? newValue) {
    if (newValue != null) {
      setState(() {
        selectedDropdownItem = newValue;
      });

      fetchDataFromDatabase();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Real-time Data'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: DropdownButton<String>(
              value: selectedDropdownItem,
              items: dropdownItems.map((item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
              onChanged: updateSelectedDropdownItem,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SizedBox(
              height: 380,
              width: 380,
              child: SingleChildScrollView(
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 15),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 165,
                                width: 165,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: AppColors.textfields.withOpacity(0.3),
                                ),
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  children: [
                                    const Text(
                                      'Soil Temperature',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    Text(
                                      filteredData['ST']?.toString() ?? 'N/A',
                                      style: const TextStyle(fontSize: 40),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 20),
                              Container(
                                height: 165,
                                width: 165,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: AppColors.textfields.withOpacity(0.3),
                                ),
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  children: [
                                    const Text(
                                      'Humidity',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    Text(
                                      filteredData['H']?.toString() ?? 'N/A',
                                      style: const TextStyle(fontSize: 40),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Container(
                                height: 165,
                                width: 165,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: AppColors.textfields.withOpacity(0.3),
                                ),
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  children: [
                                    const Text(
                                      'Battery',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    Text(
                                      filteredData['BT']?.toString() ?? 'N/A',
                                      style: const TextStyle(fontSize: 40),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 20),
                              Container(
                                height: 165,
                                width: 165,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: AppColors.textfields.withOpacity(0.3),
                                ),
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  children: [
                                    const Text(
                                      'Soil pH',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    Text(
                                      filteredData['PH']?.toString() ?? 'N/A',
                                      style: const TextStyle(fontSize: 40),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Container(
                                height: 165,
                                width: 165,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: AppColors.textfields.withOpacity(0.3),
                                ),
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  children: [
                                    const Text(
                                      'Soil Moisture',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    Text(
                                      filteredData['SM']?.toString() ?? 'N/A',
                                      style: const TextStyle(fontSize: 40),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 20),
                              Container(
                                height: 165,
                                width: 165,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: AppColors.textfields.withOpacity(0.3),
                                ),
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  children: [
                                    const Text(
                                      'Lite Intensity',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    Text(
                                      filteredData['LI']?.toString() ?? 'N/A',
                                      style: const TextStyle(fontSize: 40),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Container(
                                height: 165,
                                width: 165,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: AppColors.textfields.withOpacity(0.3),
                                ),
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  children: [
                                    const Text(
                                      'Temperature',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    Text(
                                      filteredData['T']?.toString() ?? 'N/A',
                                      style: const TextStyle(fontSize: 40),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 20),
                              Container(
                                height: 165,
                                width: 165,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: AppColors.textfields.withOpacity(0.3),
                                ),
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  children: [
                                    const Text(
                                      'Electrical Conductivity',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    Text(
                                      filteredData['EC']?.toString() ?? 'N/A',
                                      style: const TextStyle(fontSize: 40),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
