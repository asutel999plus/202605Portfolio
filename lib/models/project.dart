class Project {
  final String id;
  final String title;
  final String description;

  Project({
    required this.id,
    required this.title,
    required this.description,
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
    title: "作品 B",
    description: "作品Bの説明文がここに入ります。",
  ),
  Project(
    id: "C",
    title: "作品 C",
    description: "作品Cの説明文がここに入ります。",
  ),
  Project(
    id: "D",
    title: "作品 D",
    description: "作品Dの説明文がここに入ります。",
  ),
];
