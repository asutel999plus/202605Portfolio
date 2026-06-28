import 'package:admin/constants.dart';
import 'package:admin/controllers/menu_app_controller.dart';
import 'package:admin/models/project.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<MenuAppController>();
    return Drawer(
      backgroundColor: deepBlue,
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset("assets/images/五.png"),
          ),
          MenuTile(
            title: "ホーム",
            icon: Icons.home_outlined,
            onTap: () => controller.selectSection(
              MenuSection.home,
              scrollTarget: controller.homeKey,
            ),
          ),
          AccordionMenuTile(
            title: "作品紹介",
            icon: Icons.work_outline,
            isExpanded: controller.expandedSection == MenuSection.works,
            onHeaderTap: () => controller.selectSection(
              MenuSection.works,
              scrollTarget: controller.worksKey,
              closeDrawer: false,
            ),
            children: [
              for (final project in demoProjects)
                MenuSubTile(
                  title: project.title,
                  onTap: () => controller.selectSubItem(
                    MenuSection.works,
                    controller.projectKey(project.id),
                  ),
                ),
            ],
          ),
          AccordionMenuTile(
            title: "自己紹介",
            icon: Icons.person_outline,
            isExpanded: controller.expandedSection == MenuSection.about,
            onHeaderTap: () => controller.selectSection(
              MenuSection.about,
              scrollTarget: controller.aboutKey,
              closeDrawer: false,
            ),
            children: [
              for (final title in aboutItemTitles)
                MenuSubTile(
                  title: title,
                  onTap: () => controller.selectSubItem(
                    MenuSection.about,
                    controller.aboutItemKey(title),
                  ),
                ),
            ],
          ),
          AccordionMenuTile(
            title: "お問い合わせ",
            icon: Icons.mail_outline,
            isExpanded: controller.expandedSection == MenuSection.contact,
            onHeaderTap: () => controller.selectSection(
              MenuSection.contact,
              closeDrawer: false,
            ),
            children: const [
              MenuSubTile(
                title: "お問い合わせはこちら",
                onTap: null,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MenuTile extends StatelessWidget {
  const MenuTile({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      horizontalTitleGap: 0.0,
      leading: Icon(icon, color: Colors.white, size: 18),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}

class AccordionMenuTile extends StatelessWidget {
  const AccordionMenuTile({
    Key? key,
    required this.title,
    required this.icon,
    required this.isExpanded,
    required this.onHeaderTap,
    required this.children,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final bool isExpanded;
  final VoidCallback onHeaderTap;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final Color activeColor = isExpanded ? skyBlue : Colors.white;
    return Column(
      children: [
        ListTile(
          onTap: onHeaderTap,
          horizontalTitleGap: 0.0,
          leading: Icon(icon, color: activeColor, size: 18),
          title: Text(
            title,
            style: TextStyle(
              color: activeColor,
              fontWeight: isExpanded ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
          trailing: Icon(
            isExpanded ? Icons.expand_less : Icons.expand_more,
            color: activeColor,
          ),
        ),
        if (isExpanded) ...children,
      ],
    );
  }
}

class MenuSubTile extends StatelessWidget {
  const MenuSubTile({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 32.0),
      child: ListTile(
        onTap: onTap,
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}
