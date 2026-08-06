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
          body:
              "名古屋市在住・弘前大学大学院卒。\n\n"
              "業務系WebアプリのJava保守開発を軸に、設計〜製造〜テストまで一貫して担当してきました。\n\n"
              "強みは「仕様を曖昧にせず、影響範囲と検証観点を整理して品質を担保する」こと。"
              "EC管理サイトは要件ヒアリングから詳細設計・実装・テストデータ作成・検証まで一貫して対応できます。",
        ),
        SizedBox(height: defaultPadding),
        _AboutBlock(
          key: controller.aboutItemKey("スキル"),
          title: "スキル",
          body:
              "【言語】\n"
              "Java（5年）／SQL（5年）／JavaScript・jQuery（1年）／HTML・CSS（1年）／C#\n\n"
              "【DB】\n"
              "Oracle／DB2\n\n"
              "【ツール・環境】\n"
              "Eclipse／Visual Studio／SQL Developer／A5:SQL／TortoiseSVN\n"
              "DataSpider／OutSystems",
        ),
        SizedBox(height: defaultPadding),
        _AboutBlock(
          key: controller.aboutItemKey("経歴"),
          title: "経歴",
          body:
              "■ 2022年10月〜2023年11月（1年2ヶ月）\n"
              "ECサイト／EC管理サイトの設計・開発・運用\n"
              "Java・JavaScript(jQuery)・HTML・CSS・SQL（Oracle）\n"
              "ECサイトでは、改修が必要な案件に対し、仕様や改修概要を有識者に確認し、設計書を作成して改修を実施"
              "EC管理サイトでは、要件ヒアリングからリリースまで一気通貫で担当。CS要望を受けたエラー表示画面の新規作成では、1件あたり30分の工数削減を実現。\n\n"
              "■ 2024年1月〜2025年7月（1年7ヶ月）\n"
              "警視庁健康管理システム開発・車両環境法規システム維持\n"
              "Java・C#・SQL（Oracle、DB2）／DataSpider・OutSystems\n"
              "健康管理システムは設計からリリースまで担当。保守性を重視した命名・共通化を徹底。法規システムは大規模仕様の影響範囲確認・不具合修正・保守運用を担当。\n\n"
              "■ 2025年9月〜2026年4月（8ヶ月）\n"
              "車両無償修理費求償システム開発\n"
              "Java・SQL（Oracle）／Eclipse・SERMO\n"
              "詳細設計・製造・単体テスト・内部結合テストを担当。過去スナップショットを含む大規模データ（ファイル＋DBテーブル合計20〜30）のITaを実施し、条件付き書式で差分を自動可視化。\n\n"
              "■ 2026年5月〜2026年7月（3ヶ月）\n"
              "電力業界向け作業工程管理システム開発支援\n"
              "Java・TypeScript・SQL（Postgres）／VSCode・GitHub Copilot・TortoiseGit・A5sql\n"
              "UI制御ミス点検・製造・単体テスト・結合テストケース作成を担当。"
              "テストデータ不足のためソースコードを調査しながらDBデータを作成し点検環境を構築。"
              "詳細設計相当の資料がない環境で基本設計書・ソースコード・GitHub Copilotを活用して仕様を把握し、TypeScriptによる改修および単体テストを実施。"
              "結合テストではシステム間の処理を考慮したテストケースを作成し、IT1〜IT3向けの試験項目を整備。",
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
