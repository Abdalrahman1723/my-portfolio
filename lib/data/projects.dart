//all the data of the projects I made
import '../models/project.dart';

final List<Project> projects = [
  //--------------------HCMS
  Project(
    title: 'Health care management system',
    description:
        'A modular Flutter mobile application for a healthcare system, built with Clean Architecture. It supports multiple user roles (Patient, Doctor, Admin) and communicates with a .NET backend API for business logic and data operations.',
    slogan: 'Fiend the suitable doctor for you.',
    technologies: ['Flutter', 'Dart', '.Net', 'RESTFUL API'],
    githubUrl: 'https://github.com/Abdalrahman1723/Health-care-management-app',
    imageURL: 'lib/core/assets/hcms.png',
  ),

  //--------------------Chatting
  Project(
    title: 'Online chatting app',
    slogan: "Let's chat together",
    description:
        'A cross-platform chat application built with Flutter and firebase.',
    technologies: ['Flutter', 'Dart', 'Firebase'],
    githubUrl: 'https://github.com/Abdalrahman1723/chat-app',
    imageURL: 'lib/core/assets/chatting.jpg',
  ),

  //--------------------Portfolio
  Project(
    title: 'Personal portfolio',
    slogan: "Nice to meet you",
    description: 'A personal portfolio using flutter web',
    technologies: ['Flutter', 'Dart', 'web'],
    githubUrl: 'https://github.com/Abdalrahman1723/my-portfolio',
    imageURL: 'lib/core/assets/portfolio.png',
  ),

  //--------------------tic tac
  Project(
    title: 'Tic Tac Toe game',
    slogan: "Can you beat it",
    description: 'A simple, cross-platform Tic Tac Toe game built with Flutter',
    technologies: ['Flutter', 'Dart'],
    githubUrl: 'https://github.com/Abdalrahman1723/tic-tac-game',
    imageURL: 'lib/core/assets/xo.jpg',
  ),

  //--------------------expenses
  Project(
    title: 'Expenses app',
    slogan: "track you money flow easily",
    description:
        'A lightweight and user-friendly Flutter application to track personal expenses. Easily add, view, and manage your transactions with a clean and responsive UI.',
    technologies: ['Flutter', 'Dart'],
    githubUrl: 'https://github.com/Abdalrahman1723/Expenses-app',
    imageURL: 'lib/core/assets/expenses.jpg',
  ),
  // Add more projects here
];
