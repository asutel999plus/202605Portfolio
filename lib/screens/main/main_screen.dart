import 'package:admin/controllers/menu_app_controller.dart';
import 'package:admin/responsive.dart';
import 'package:admin/screens/content/content_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import 'components/side_menu.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<MenuAppController>();
    return Scaffold(
      key: controller.scaffoldKey,
      drawer: SideMenu(),
      body: SafeArea(
        child: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // We want this side menu only for large screen
                if (Responsive.isDesktop(context))
                  Expanded(
                    // default flex = 1
                    // and it takes 1/6 part of the screen
                    child: SideMenu(),
                  ),
                Expanded(
                  // It takes 5/6 part of the screen
                  flex: 5,
                  child: ContentScreen(),
                ),
              ],
            ),
            if (!Responsive.isDesktop(context))
              Positioned(
                top: defaultPadding / 2,
                left: defaultPadding / 2,
                child: IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: controller.controlMenu,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
