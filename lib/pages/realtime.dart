import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:design/utils/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../utils/routes.dart';

class RealtimeDashboard extends StatefulWidget {
  @override
  _RealtimeDashboardState createState() => _RealtimeDashboardState();
}

class _RealtimeDashboardState extends State<RealtimeDashboard> {
  late String fullName = '';
  late String email = '';
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(28.54744274365559, 77.3326009898075),
    zoom: 15,
  );
  final databaseReference = FirebaseDatabase.instance
      .refFromURL('https://sigfox-4a13d-default-rtdb.firebaseio.com');
  final User? user = FirebaseAuth.instance.currentUser;

  //for epoch time
  final DatabaseReference _databaseReference = FirebaseDatabase.instance
      .refFromURL('https://sigfox-4a13d-default-rtdb.firebaseio.com')
      .child('WiFi_Devices')
      .child('AE01')
      .child('Last Update');

  List<String> dropdownItems = [];
  String selectedDropdownItem = '';
  Map<String, dynamic> filteredData = {};
  late bool isLoading;

  @override
  void initState() {
    isLoading = true;
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
    fetchDataFromDatabase();
    // Fetch initial device list from the database
    fetchDeviceListFromDatabase();
  }

  Future<void> signIn() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: 'user@example.com', // Replace with the user's email
        password: 'password', // Replace with the user's password
      );
      print('User signed in successfully');
      // Call fetchUserData() here to fetch the data after the user is signed in
    } catch (e) {
      print('Error signing in: $e');
    }
  }

  Future<void> fetchUserData() async {
    try {
      final User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        print('User is signed in'); // Add this line

        final QuerySnapshot userSnapshot = await FirebaseFirestore.instance
            .collection('User')
            .where('Full Name', isEqualTo: user.displayName)
            .where('Email', isEqualTo: user.email)
            .get();

        if (userSnapshot.docs.isNotEmpty) {
          final DocumentSnapshot document = userSnapshot.docs.first;
          final data = document.data() as Map<String, dynamic>;

          setState(() {
            fullName = data['Full Name'];
            email = data['Email'];
          });
        } else {
          print('User document not found');
        }
      } else {
        print('User is not signed in'); // Add this line
      }
    } catch (e) {
      print('Error retrieving user data: $e');
    }
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
      backgroundColor: AppColors.background,
      drawer: Drawer(
        width: 250,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.darkgreen, AppColors.textfields],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                //color: AppColors.textfields.withOpacity(0.3),
              ),
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  final double screenWidth = constraints.maxWidth;
                  final bool isSmallScreen = screenWidth < 600;
                  return Row(
                    children: [
                      SizedBox(
                        height: isSmallScreen ? 80 : 100,
                        width: isSmallScreen ? 80 : 100,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 2),
                                shape: BoxShape.circle,
                                color: Colors.grey.withOpacity(0.3),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 50),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, top: 50),
                        child: Column(
                          children: [
                            Text(
                              fullName,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.white),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              email,
                              style: const TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 10,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            ListTile(
              title: const Text(
                'My Farm',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.pushNamed(context, MyRoutes.myfarmRoute);
              },
            ),
            ListTile(
              title: const Text(
                'My Devices',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.pushNamed(context, MyRoutes.mydevicesRoute);
              },
            ),
            ListTile(
              title: const Text(
                'History',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.pushNamed(context, MyRoutes.historyRoute);
              },
            ),
            ListTile(
              title: const Text(
                'Settings',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                // Add your logic for handling item 1 tap
              },
            ),
            const SizedBox(
              height: 230,
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  SizedBox(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                          'assets/images/aigro_logo.png',
                          height: 35,
                          width: 35,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 100),
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 5,
                    ),
                    child: Column(
                      children: [
                        Text(
                          'AigroEdge Technologies',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 9,
                              color: Colors.black),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'aigroedgetech@gmail.com',
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 7,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        toolbarHeight: 60,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              color: Colors.black,
              onPressed: () {
                Scaffold.of(context).openDrawer(); // Open the drawer
              },
              icon: const Icon(Icons.menu),
            );
          },
        ),
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 75),
          child: Text(
            'AigroEdge',
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        actions: [
          IconButton(
            color: Colors.black,
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: isLoading
            ? const NewSkeleton()
            : Expanded(
                child: Column(
                  children: [
                    //map
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        // color: AppColors.textfields.withOpacity(0.3),
                      ),
                      width: double.infinity,
                      height: 140,
                      child: Expanded(
                        child: GoogleMap(
                          mapType: MapType.terrain,
                          initialCameraPosition: _kGooglePlex,
                          onMapCreated: (GoogleMapController controller) {
                            _controller.complete(controller);
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    //select device dropdown
                    Padding(
                      padding: const EdgeInsets.only(left: 7, right: 7),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [AppColors.darkgreen, AppColors.textfields],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.darkgreen,
                        ),
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
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
                              const SizedBox(
                                width: 100,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 0, right: 20),
                        child: StreamBuilder(
                          stream: _databaseReference.onValue,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              final data = snapshot.data!.snapshot.value;
                              final epochTime = data != null &&
                                      (data as Map<dynamic, dynamic>)['DT'] !=
                                          null
                                  ? int.parse((data)['DT'].toString())
                                  : null;

                              String formattedDateTime = '';
                              if (epochTime != null) {
                                final dateTime =
                                    DateTime.fromMillisecondsSinceEpoch(
                                        epochTime);
                                formattedDateTime = dateTime.toString();
                              }

                              return Padding(
                                padding: const EdgeInsets.only(right: 125),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(right: 45),
                                      child: Text(
                                        "Device Updates",
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 2),
                                      child: Text(
                                        'Last updated on: $formattedDateTime',
                                        style: TextStyle(
                                          fontSize: 11,
                                          color: Colors.grey.shade500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            } else if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            } else {
                              return const Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 180),
                                    child: Column(
                                      children: [
                                        Skeleton(
                                          width: 200,
                                          height: 30,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 120),
                                    child: Skeleton(
                                      width: 250,
                                    ),
                                  ),
                                ],
                              );
                            }
                          },
                        )),

                    SizedBox(
                      height: 380,
                      width: 380,
                      child: SingleChildScrollView(
                        child: Column(
                          //crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 10),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 165,
                                        width: 165,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: AppColors.textfields
                                              .withOpacity(0.3),
                                        ),
                                        padding: const EdgeInsets.all(16.0),
                                        child: Column(
                                          children: [
                                            const Text(
                                              'Soil Temperature',
                                              style: TextStyle(fontSize: 20),
                                            ),
                                            Text(
                                              filteredData['ST']?.toString() ??
                                                  'N/A',
                                              style:
                                                  const TextStyle(fontSize: 40),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: 20),
                                      Container(
                                        height: 165,
                                        width: 165,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: AppColors.textfields
                                              .withOpacity(0.3),
                                        ),
                                        padding: const EdgeInsets.all(16.0),
                                        child: Column(
                                          children: [
                                            const Text(
                                              'Humidity',
                                              style: TextStyle(fontSize: 20),
                                            ),
                                            Text(
                                              filteredData['H']?.toString() ??
                                                  'N/A',
                                              style:
                                                  const TextStyle(fontSize: 40),
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
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: AppColors.textfields
                                              .withOpacity(0.3),
                                        ),
                                        padding: const EdgeInsets.all(16.0),
                                        child: Column(
                                          children: [
                                            const Text(
                                              'Battery',
                                              style: TextStyle(fontSize: 20),
                                            ),
                                            Text(
                                              filteredData['BT']?.toString() ??
                                                  'N/A',
                                              style:
                                                  const TextStyle(fontSize: 40),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: 20),
                                      Container(
                                        height: 165,
                                        width: 165,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: AppColors.textfields
                                              .withOpacity(0.3),
                                        ),
                                        padding: const EdgeInsets.all(16.0),
                                        child: Column(
                                          children: [
                                            const Text(
                                              'Soil pH',
                                              style: TextStyle(fontSize: 20),
                                            ),
                                            Text(
                                              filteredData['PH']?.toString() ??
                                                  'N/A',
                                              style:
                                                  const TextStyle(fontSize: 40),
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
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: AppColors.textfields
                                              .withOpacity(0.3),
                                        ),
                                        padding: const EdgeInsets.all(16.0),
                                        child: Column(
                                          children: [
                                            const Text(
                                              'Soil Moisture',
                                              style: TextStyle(fontSize: 20),
                                            ),
                                            Text(
                                              filteredData['SM']?.toString() ??
                                                  'N/A',
                                              style:
                                                  const TextStyle(fontSize: 40),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: 20),
                                      Container(
                                        height: 165,
                                        width: 165,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: AppColors.textfields
                                              .withOpacity(0.3),
                                        ),
                                        padding: const EdgeInsets.all(16.0),
                                        child: Column(
                                          children: [
                                            const Text(
                                              'Lite Intensity',
                                              style: TextStyle(fontSize: 20),
                                            ),
                                            Text(
                                              filteredData['LI']?.toString() ??
                                                  'N/A',
                                              style:
                                                  const TextStyle(fontSize: 40),
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
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: AppColors.textfields
                                              .withOpacity(0.3),
                                        ),
                                        padding: const EdgeInsets.all(16.0),
                                        child: Column(
                                          children: [
                                            const Text(
                                              'Temperature',
                                              style: TextStyle(fontSize: 20),
                                            ),
                                            Text(
                                              filteredData['T']?.toString() ??
                                                  'N/A',
                                              style:
                                                  const TextStyle(fontSize: 40),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: 20),
                                      Container(
                                        height: 165,
                                        width: 165,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: AppColors.textfields
                                              .withOpacity(0.3),
                                        ),
                                        padding: const EdgeInsets.all(16.0),
                                        child: Column(
                                          children: [
                                            const Text(
                                              'Electrical Conductivity',
                                              style: TextStyle(fontSize: 20),
                                            ),
                                            Text(
                                              filteredData['EC']?.toString() ??
                                                  'N/A',
                                              style:
                                                  const TextStyle(fontSize: 40),
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
                  ],
                ),
              ),
      ),
    );
  }
}

class NewSkeleton extends StatelessWidget {
  const NewSkeleton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          Skeleton(
            height: 140,
            width: double.infinity,
          ),
          SizedBox(
            height: 10,
          ),
          Skeleton(
            width: double.infinity,
            height: 50,
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: EdgeInsets.only(right: 180),
            child: Column(
              children: [
                Skeleton(
                  width: 200,
                  height: 30,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: EdgeInsets.only(right: 120),
            child: Skeleton(
              width: 250,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: EdgeInsets.only(left: 5),
            child: Row(
              children: [
                Skeleton(
                  height: 165,
                  width: 165,
                ),
                SizedBox(
                  width: 15,
                ),
                Skeleton(
                  height: 165,
                  width: 165,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: EdgeInsets.only(left: 5),
            child: Row(
              children: [
                Skeleton(
                  height: 165,
                  width: 165,
                ),
                SizedBox(
                  width: 15,
                ),
                Skeleton(
                  height: 165,
                  width: 165,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Skeleton extends StatelessWidget {
  const Skeleton({
    super.key,
    this.height,
    this.width,
  });
  final double? height, width;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.04),
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
