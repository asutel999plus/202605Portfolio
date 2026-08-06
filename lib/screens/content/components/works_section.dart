import 'package:admin/controllers/menu_app_controller.dart';
import 'package:admin/models/project.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../constants.dart';

class WorksSection extends StatelessWidget {
  const WorksSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<MenuAppController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(width: 6, height: 24, color: deepBlue),
            SizedBox(width: defaultPadding / 2),
            Text(
              "作品紹介",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(color: textColor),
            ),
          ],
        ),
        SizedBox(height: defaultPadding),
        for (final project in demoProjects)
          Padding(
            key: controller.projectKey(project.id),
            padding: EdgeInsets.only(bottom: defaultPadding),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(defaultPadding),
              decoration: BoxDecoration(
                color: iceBlue,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: skyBlue.withValues(alpha: 0.3)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    project.title,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: deepBlue),
                  ),
                  SizedBox(height: defaultPadding / 2),
                  Text(
                    project.description,
                    style: TextStyle(color: subTextColor),
                  ),
                  if (project.downloadUrl != null) ...[
                    SizedBox(height: defaultPadding),
                    ElevatedButton.icon(
                      onPressed: () =>
                          launchUrl(Uri.parse(project.downloadUrl!)),
                      icon: Icon(Icons.download, size: 18),
                      label: Text("ダウンロード（ZIP）"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: deepBlue,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
      ],
    );
  }
}
