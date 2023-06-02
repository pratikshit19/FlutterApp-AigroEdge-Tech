import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: <Widget>[
        /*
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'AigroEdge',
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(fontWeight: FontWeight.bold),
          ),*/

        Categories(),
      ],
    );
  }
}

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = [
    "Dashboard",
    "Analytics",
    "History",
  ];

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) => buildCategory(index),
      ),
    );
  }

  Widget buildCategory(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Text(
        categories[index],
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.normal,
          color: Colors.white,
        ),
      ),
    );
  }
}
