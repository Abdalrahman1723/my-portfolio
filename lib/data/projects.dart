//all the data of the projects I made
import '../models/project.dart';

final List<Project> projects = [
  Project(
    title: 'Health care management system',
    description:
        'A modular Flutter mobile application for a healthcare system, built with Clean Architecture. It supports multiple user roles (Patient, Doctor, Admin) and communicates with a .NET backend API for business logic and data operations.',
    slogan: 'Fiend the suitable doctor for you.',
    technologies: ['Flutter', 'Dart', '.Net', 'RESTFUL API'],
    githubUrl: 'https://github.com/Abdalrahman1723/Health-care-management-app',
    imageURL: 'lib/core/assets/hcms_assets/hcms.png',
  ),
  Project(
    title: 'Online chatting app',
    slogan: "Let's chat together",
    description:
        'A cross-platform chat application built with Flutter and firebase.',
    technologies: ['Flutter', 'Dart', 'Firebase'],
    githubUrl: 'https://github.com/Abdalrahman1723/chat-app',
    imageURL: 'lib/core/assets/chatting_assets/chatting.jpg',
  ),
  Project(
    title: 'Online chatting app',
    slogan: "Let's chat together",
    description:
        'A cross-platform chat application built with Flutter and firebase.',
    technologies: ['Flutter', 'Dart', 'Firebase'],
    githubUrl: 'https://github.com/Abdalrahman1723/chat-app',
    imageURL: 'lib/core/assets/chatting_assets/chatting.jpg',
  ),
  // Add more projects here
];
