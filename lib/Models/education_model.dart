import 'dart:ui';

class EducationModel {
  final String title;
  final String company;
  final String startDate;
  final String endDate;
  final List<String> bulletPoints;
  final String location;
  final Color color;
  final String logoPath;      // For institution logo
  final String grade;         // For academic performance
  final String degree;        // For degree type
  final List<String> skills;  // For skills learned
  final bool isCurrently;     // To show if currently studying

  EducationModel({
    required this.title,
    required this.company,
    required this.startDate,
    required this.endDate,
    required this.bulletPoints,
    required this.location,
    required this.color,
    this.logoPath = '',
    this.grade = '',
    this.degree = '',
    this.skills = const [],
    this.isCurrently = false,
  });
}