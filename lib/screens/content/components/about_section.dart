import 'package:admin/controllers/menu_app_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({Key? key}) : super(key: key);

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
              "自己紹介",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(color: textColor),
            ),
          ],
        ),
        SizedBox(height: defaultPadding),
        _AboutBlock(
          key: controller.aboutItemKey("プロフィール"),
          title: "プロフィール",
          body: "ここにプロフィール文が入ります。",
        ),
        SizedBox(height: defaultPadding),
        _AboutBlock(
          key: controller.aboutItemKey("スキル"),
          title: "スキル",
          body: "ここに得意な技術・言語・フレームワークが入ります。",
        ),
        SizedBox(height: defaultPadding),
        _AboutBlock(
          key: controller.aboutItemKey("経歴"),
          title: "経歴",
          body: "ここに経歴・実績が入ります。",
        ),
      ],
    );
  }
}

class _AboutBlock extends StatelessWidget {
  const _AboutBlock({
    Key? key,
    required this.title,
    required this.body,
  }) : super(key: key);

  final String title, body;

  @override
  Widget build(BuildContext context) {
    return Container(
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
            title,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: deepBlue),
          ),
          SizedBox(height: defaultPadding / 2),
          Text(body, style: TextStyle(color: subTextColor)),
        ],
      ),
    );
  }
}
