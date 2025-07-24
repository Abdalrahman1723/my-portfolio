class Project {
  final String title;
  final String description;
  final String slogan;
  final List<String>? technologies;
  final String? githubUrl;
  final String imageURL;
  final List<String>? screenShots;

  Project({
    required this.title,
    required this.description,
    required this.slogan,
    this.technologies,
    this.githubUrl,
    this.screenShots,
    required this.imageURL,
  });
}
