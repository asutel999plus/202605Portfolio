import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../responsive.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: defaultPadding * 4),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/ヒーローエリア.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          vertical: defaultPadding,
          horizontal: defaultPadding,
        ),
        color: Colors.white.withValues(alpha: 0.75),
        child: Responsive.isMobile(context)
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _ProfileArea(),
                  SizedBox(height: defaultPadding * 2),
                  _PortfolioTitle(),
                ],
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(flex: 3, child: _ProfileArea()),
                  Expanded(
                    flex: 2,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: _PortfolioTitle(),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

class _ProfileArea extends StatelessWidget {
  const _ProfileArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 48,
          backgroundImage: AssetImage("assets/images/似顔絵.png"),
          backgroundColor: iceBlue,
        ),
        SizedBox(height: defaultPadding),
        Text(
          "ホーム",
          style: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(color: textColor),
        ),
        SizedBox(height: defaultPadding / 2),
        Text(
          "設計から検証まで、一本の線を引く。",
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(color: subTextColor),
        ),
      ],
    );
  }
}

class _PortfolioTitle extends StatelessWidget {
  const _PortfolioTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          "PORTFOLIO",
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: deepBlue,
            letterSpacing: 4,
          ),
        ),
        SizedBox(height: defaultPadding / 4),
        Text(
          "My Works & Profile",
          style: TextStyle(
            color: skyBlue,
            fontWeight: FontWeight.w600,
            letterSpacing: 1,
          ),
        ),
      ],
    );
  }
}
