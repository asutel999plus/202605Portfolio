class Project {
  final String id;
  final String title;
  final String description;
  final String? downloadUrl;

  Project({
    required this.id,
    required this.title,
    required this.description,
    this.downloadUrl,
  });
}

final List<Project> demoProjects = [
  Project(
    id: "A",
    title: "作品 A",
    description: "作品Aの説明文がここに入ります。",
  ),
  Project(
    id: "B",
    title: "Claude Code セットアップツール",
    description:
        "ダブルクリックひとつで Claude Code を使い始められる Windows 向けセットアップツールです。\n\n"
        "【自動でやること】\n"
        "・Claude Code CLI のインストール\n"
        "・マイク（音声入力）と応答言語を日本語に設定\n"
        "・ファイル削除コマンドの実行前に確認画面を表示する設定\n"
        "・CLAUDE.md（指示ファイル）の作成・追記\n\n"
        "【必要なもの】\n"
        "Visual Studio Code ／ Claude Pro・Max・Team のいずれかのプラン ／ インターネット接続\n\n"
        "ZIP を展開し、中の Setup.bat をダブルクリックするだけで完了します。\n"
        "既にインストール済みの項目はスキップされるため、何度実行しても安全です。",
    downloadUrl:
        "https://github.com/asutel999plus/202606AutoSpec/releases/download/ver0.0.1/ClaudeCodeSetup.zip",
  ),
];
