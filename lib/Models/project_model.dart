
class ProjectModel {
  final String title;
  final List<String> techStack;
  final String gitHubRepo;
  final String description;
  final String videoLink;
  final String imageUrl;
  final String duration;

  ProjectModel({
    required this.title,
    required this.techStack,
    required this.gitHubRepo,
    required this.description,
    required this.videoLink,
    required this.imageUrl,
    required this.duration,
  });
}