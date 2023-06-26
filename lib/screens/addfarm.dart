// ignore: file_names
import 'package:design/utils/app_colors.dart';
import 'package:design/utils/routes.dart';
import 'package:flutter/material.dart';

class AddFarmScreen extends StatefulWidget {
  const AddFarmScreen({super.key});

  @override
  State<AddFarmScreen> createState() => _AddFarmScreenState();
}

class _AddFarmScreenState extends State<AddFarmScreen> {
  String? selectedValue;

  List<String> listItem = ['Device 1', 'Device 2', 'Device 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 60,
        leading: IconButton(
          color: Colors.black,
          onPressed: () {
            Navigator.pushNamed(context, MyRoutes.homeRoute); // Open the drawer
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 85),
          child: Text(
            'Add Farm',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 235),
                child: Text(
                  'Add Location',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // ignore: avoid_unnecessary_containers
              Container(
                child: Table(
                  border: TableBorder.all(
                    color: Colors.grey
                        .shade400, // Set the desired border color for the table cells
                    width:
                        1.0, // Set the desired border width for the table cells
                  ),
                  columnWidths: const {
                    0: FractionColumnWidth(
                        1 / 3), // Set the left column width to 1/3 of the table
                    1: FlexColumnWidth(), // Set the right column to occupy the remaining width
                  },
                  children: const [
                    TableRow(
                      children: [
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.only(top: 15),
                            child: Center(
                              child: Text(
                                'State',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Enter your State',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.only(top: 15),
                            child: Center(
                              child: Text(
                                'District',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Enter your District',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.only(top: 15),
                            child: Center(
                              child: Text(
                                'Village',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Enter your Village',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Add more rows as needed
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [AppColors.darkgreen, AppColors.textfields],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.darkgreen,
                ),
                height: 40,
                width: double.infinity,
                child: const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Text(
                        "GeoTag your Farm",
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                      SizedBox(
                        width: 170,
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.only(right: 218),
                child: Text(
                  'Total Land Area',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Table(
                border: TableBorder.all(
                  color: Colors.grey
                      .shade400, // Set the desired border color for the table cells
                  width:
                      1.0, // Set the desired border width for the table cells
                ),
                columnWidths: const {
                  0: FractionColumnWidth(
                      1 / 3), // Set the left column width to 1/3 of the table
                  1: FlexColumnWidth(), // Set the right column to occupy the remaining width
                },
                defaultColumnWidth: const IntrinsicColumnWidth(),
                children: [
                  TableRow(
                    children: [
                      TableCell(
                        child: Center(
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              dropdownColor: Colors.white,
                              value: selectedValue,
                              hint: const Text(
                                'Acres',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 14),
                              ), // Optional: Text to display when no option is selected
                              onChanged: (newValue) {
                                setState(() {
                                  selectedValue = newValue;
                                });
                              },
                              icon: const Icon(
                                Icons.arrow_drop_down,
                                color: Colors.black,
                              ),
                              items: listItem.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value,
                                      style:
                                          const TextStyle(color: Colors.black)),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                      const TableCell(
                        child: Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Enter your Land Area',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 50),
                child: Row(
                  children: [
                    Text(
                      'Crop Name',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 100,
                    ),
                    Text(
                      'Crop Variety',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      constraints: BoxConstraints(maxHeight: 50, maxWidth: 170),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      constraints: BoxConstraints(maxHeight: 50, maxWidth: 170),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.only(right: 197),
                child: Text(
                  'Crop Sowing Date',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Table(
                border: TableBorder.all(
                  color: Colors
                      .grey, // Set the desired border color for the table cells
                  width:
                      1.0, // Set the desired border width for the table cells
                ),
                columnWidths: const {
                  0: FractionColumnWidth(
                      1 / 3), // Set the left column width to 1/3 of the table
                  1: FlexColumnWidth(), // Set the right column to occupy the remaining width
                },
                defaultColumnWidth: const IntrinsicColumnWidth(),
                children: [
                  TableRow(
                    children: [
                      TableCell(
                        child: Center(
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              dropdownColor: Colors.white,
                              value: selectedValue,
                              hint: const Icon(Icons.calendar_month_rounded),
                              onChanged: (newValue) {
                                setState(() {
                                  selectedValue = newValue;
                                });
                              },
                              icon: const Icon(
                                Icons.arrow_drop_down,
                                color: Colors.black,
                              ),
                              items: listItem.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value,
                                      style:
                                          const TextStyle(color: Colors.black)),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                      const TableCell(
                        child: Padding(
                          padding: EdgeInsets.only(left: 0),
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: 'DD/MM/YY',
                                fillColor: Colors.white,
                                filled: true),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 55),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  backgroundColor: AppColors.darkgreen,
                ),
                onPressed: () {},
                child: const Text(
                  'Save',
                  style: TextStyle(fontSize: 17),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
