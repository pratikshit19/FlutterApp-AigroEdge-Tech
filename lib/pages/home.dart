import 'package:design/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appbar,
        elevation: 0,
        leading: const Text('AigroEdge'),
        actions: <Widget>[
          IconButton(
              onPressed: () {},
              icon:
                  SvgPicture.asset("assets/icons/search-interface-symbol.png"))
        ],
      ),
    );
  }
}
