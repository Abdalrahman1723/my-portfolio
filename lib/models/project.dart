class Project {
  final String title;
  final String description;
  final List<String> technologies;
  final String? githubUrl;
  final String? liveDemoUrl;

  Project({
    required this.title,
    required this.description,
    required this.technologies,
    this.githubUrl,
    this.liveDemoUrl,
  });
}
