import 'package:admin/controllers/menu_app_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import 'components/about_section.dart';
import 'components/home_section.dart';
import 'components/works_section.dart';

class ContentScreen extends StatelessWidget {
  const ContentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<MenuAppController>();
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeSection(key: controller.homeKey),
            SizedBox(height: defaultPadding * 2),
            WorksSection(key: controller.worksKey),
            SizedBox(height: defaultPadding * 2),
            AboutSection(key: controller.aboutKey),
          ],
        ),
      ),
    );
  }
}
