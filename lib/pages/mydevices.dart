import 'package:design/utils/app_colors.dart';
import 'package:design/utils/routes.dart';
import 'package:flutter/material.dart';

class MyDevices extends StatelessWidget {
  const MyDevices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: AppColors.background,
          elevation: 0,
          toolbarHeight: 60,
          leading: IconButton(
            color: Colors.black,
            onPressed: () {
              Navigator.pushNamed(context, MyRoutes.homeRoute);
            },
            icon: const Icon(Icons.arrow_back),
          ),
          title: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 85),
            child: Text(
              'My Devices',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.only(
                  top: 30, bottom: 90, left: 30, right: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                      //border: Border.all(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 4),
                            color: Colors.grey.shade300,
                            blurRadius: 3)
                      ],
                    ),
                    child: SizedBox(
                      height: 150,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20, left: 20),
                        child: Column(
                          children: [
                            const Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: Text(
                                    'Device 1',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                                SizedBox(
                                  width: 200,
                                ),
                                Icon(Icons.menu_rounded)
                              ],
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 235),
                              child: Text(
                                'Device location:',
                                style: TextStyle(
                                    color: Colors.grey.shade500, fontSize: 12),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 187),
                              child: Text(
                                'Device Installation date:',
                                style: TextStyle(
                                    color: Colors.grey.shade500, fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      //border: Border.all(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 4),
                            color: Colors.grey.shade300,
                            blurRadius: 3)
                      ],
                    ),
                    child: SizedBox(
                      height: 150,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20, left: 20),
                        child: Column(
                          children: [
                            const Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: Text(
                                    'Device 1',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                                SizedBox(
                                  width: 200,
                                ),
                                Icon(Icons.menu_rounded)
                              ],
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 235),
                              child: Text(
                                'Device location:',
                                style: TextStyle(
                                    color: Colors.grey.shade500, fontSize: 12),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 187),
                              child: Text(
                                'Device Installation date:',
                                style: TextStyle(
                                    color: Colors.grey.shade500, fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      //border: Border.all(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 4),
                            color: Colors.grey.shade300,
                            blurRadius: 3)
                      ],
                    ),
                    child: SizedBox(
                      height: 150,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20, left: 20),
                        child: Column(
                          children: [
                            const Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: Text(
                                    'Device 1',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                                SizedBox(
                                  width: 200,
                                ),
                                Icon(Icons.menu_rounded)
                              ],
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 235),
                              child: Text(
                                'Device location:',
                                style: TextStyle(
                                    color: Colors.grey.shade500, fontSize: 12),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 187),
                              child: Text(
                                'Device Installation date:',
                                style: TextStyle(
                                    color: Colors.grey.shade500, fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      //border: Border.all(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 4),
                            color: Colors.grey.shade300,
                            blurRadius: 3)
                      ],
                    ),
                    child: SizedBox(
                      height: 150,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20, left: 20),
                        child: Column(
                          children: [
                            const Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: Text(
                                    'Device 1',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                                SizedBox(
                                  width: 200,
                                ),
                                Icon(Icons.menu_rounded)
                              ],
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 235),
                              child: Text(
                                'Device location:',
                                style: TextStyle(
                                    color: Colors.grey.shade500, fontSize: 12),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 187),
                              child: Text(
                                'Device Installation date:',
                                style: TextStyle(
                                    color: Colors.grey.shade500, fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      //border: Border.all(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 4),
                            color: Colors.grey.shade300,
                            blurRadius: 3)
                      ],
                    ),
                    child: SizedBox(
                      height: 150,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20, left: 20),
                        child: Column(
                          children: [
                            const Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: Text(
                                    'Device 1',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                                SizedBox(
                                  width: 200,
                                ),
                                Icon(Icons.menu_rounded)
                              ],
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 235),
                              child: Text(
                                'Device location:',
                                style: TextStyle(
                                    color: Colors.grey.shade500, fontSize: 12),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 187),
                              child: Text(
                                'Device Installation date:',
                                style: TextStyle(
                                    color: Colors.grey.shade500, fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, MyRoutes.adddevRoute);
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(60, 60),
                    backgroundColor: AppColors.darkgreen,
                    shape: const CircleBorder(),
                  ),
                  child: const Icon(Icons.add, size: 30),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*gradient: const LinearGradient(
                                colors: [Colors.green, Colors.lime],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight) */
