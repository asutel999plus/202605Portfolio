import 'package:admin/models/project.dart';
import 'package:flutter/material.dart';

enum MenuSection { home, works, about, contact }

const List<String> aboutItemTitles = ["プロフィール", "スキル", "経歴"];

class MenuAppController extends ChangeNotifier {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final GlobalKey homeKey = GlobalKey();
  final GlobalKey worksKey = GlobalKey();
  final GlobalKey aboutKey = GlobalKey();

  final Map<String, GlobalKey> _projectKeys = {
    for (final project in demoProjects) project.id: GlobalKey(),
  };

  final Map<String, GlobalKey> _aboutItemKeys = {
    for (final title in aboutItemTitles) title: GlobalKey(),
  };

  MenuSection? _expandedSection;

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  MenuSection? get expandedSection => _expandedSection;

  GlobalKey projectKey(String id) => _projectKeys[id]!;

  GlobalKey aboutItemKey(String title) => _aboutItemKeys[title]!;

  void controlMenu() {
    if (!_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.openDrawer();
    }
  }

  void closeDrawerIfOpen() {
    if (_scaffoldKey.currentState?.isDrawerOpen ?? false) {
      _scaffoldKey.currentState!.closeDrawer();
    }
  }

  void selectSection(
    MenuSection section, {
    GlobalKey? scrollTarget,
    bool closeDrawer = true,
  }) {
    _expandedSection = section;
    notifyListeners();
    if (scrollTarget != null) {
      _scrollTo(scrollTarget);
    }
    if (closeDrawer) {
      closeDrawerIfOpen();
    }
  }

  void selectSubItem(MenuSection parent, GlobalKey target) {
    _expandedSection = parent;
    notifyListeners();
    _scrollTo(target);
    closeDrawerIfOpen();
  }

  void _scrollTo(GlobalKey key) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final targetContext = key.currentContext;
      if (targetContext != null) {
        Scrollable.ensureVisible(
          targetContext,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        );
      }
    });
  }
}
