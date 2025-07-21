class Project {
  final String title;
  final String description;
  final String slogan;
  final List<String>? technologies;
  final String? githubUrl;
  final String imageURL;

  Project({
    required this.title,
    required this.description,
    required this.slogan,
    this.technologies,
    this.githubUrl,
    required this.imageURL,
  });
}
