//all the data of the projects I made
import '../models/project.dart';

final List<Project> projects = [
  //--------------------HCMS
  Project(
    title: 'Health care management system',
    description:
        'A modular Flutter mobile application for a healthcare system, built with Clean Architecture. It supports multiple user roles (Patient, Doctor, Admin) and communicates with a .NET backend API for business logic and data operations.',
    slogan: 'Fiend the suitable doctor for you.',
    technologies: ['Flutter', 'Dart', '.Net', 'RESTFUL API', "bloc"],
    githubUrl: 'https://github.com/Abdalrahman1723/Health-care-management-app',
    imageURL: 'lib/core/assets/hcms.png',
    screenShots: [
      "assets/health/1.png",
      "assets/health/2.png",
      "assets/health/3.png",
      "assets/health/4.png",
      "assets/health/5.png",
      "assets/health/6.png",
    ],
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
    screenShots: [
      "assets/chat/1.png",
      "assets/chat/2.png",
      "assets/chat/3.png",
    ],
  ),

  //--------------------Portfolio
  Project(
    title: 'Personal portfolio',
    slogan: "Nice to meet you",
    description: 'A personal portfolio using flutter web',
    technologies: [
      'Flutter',
      'Dart',
      'web'
          "UI design",
    ],
    githubUrl: 'https://github.com/Abdalrahman1723/my-portfolio',
    imageURL: 'lib/core/assets/portfolio.png',
    screenShots: [],
  ),

  //--------------------tic tac
  Project(
    title: 'Tic Tac Toe game',
    slogan: "Can you beat it",
    description: 'A simple, cross-platform Tic Tac Toe game built with Flutter',
    technologies: ['Flutter', 'Dart'],
    githubUrl: 'https://github.com/Abdalrahman1723/tic-tac-game',
    imageURL: 'lib/core/assets/xo.jpg',
    screenShots: [],
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
    screenShots: [],
  ),
  //--------------------meals app
  Project(
    title: 'Meals app',
    slogan: "What are you cooking today",
    description:
        "A simple Flutter app that showcases a variety of recipes across multiple categories. Users can browse, view details, and apply dietary filters such as gluten-free, lactose-free, vegetarian, and vegan meals.",
    technologies: ['Flutter', 'Dart', "Riverpod"],
    githubUrl: 'https://github.com/Abdalrahman1723/meals-app',
    imageURL: 'lib/core/assets/meals.jpg',
    screenShots: [],
  ),
  //--------------------BMI app
  Project(
    title: 'BMI app',
    slogan: "Know your Body Mass Index",
    description:
        "A simple and modern BMI (Body Mass Index) calculator built using Flutter. The app allows users to input their height and weight to quickly calculate their BMI and get health-related feedback.",
    technologies: ['Flutter', 'Dart'],
    githubUrl: 'https://github.com/Abdalrahman1723/BMI-app',
    imageURL: 'lib/core/assets/bmi.jpg',
    screenShots: [],
  ),
  // Add more projects here
];
