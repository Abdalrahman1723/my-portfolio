import 'package:flutter/material.dart';
import 'package:my_portfolio/core/helper/url_launcher.dart';
import 'package:my_portfolio/core/responsive/screen_type.dart';
import 'package:my_portfolio/screens/project_details_screen.dart';
import 'package:my_portfolio/widgets/glass_hover.dart';

import '../models/project.dart';

class ProjectCard extends StatelessWidget {
  final Project project;
  const ProjectCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenType(context: context).isMobile ? 250 : 270,
      // height: 200,
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 600,
          ), // Adjust maxWidth as needed
          child: Card(
            margin: const EdgeInsets.symmetric(vertical: 12),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(project.title, style: TextStyle(fontSize: 20)),
                  const SizedBox(height: 8),
                  GlassHover(project: project),
                  const SizedBox(height: 8),
                  //technology used
                  Wrap(
                    alignment: WrapAlignment.spaceEvenly,
                    spacing: 8,
                    clipBehavior: Clip.antiAlias,
                    children: project.technologies!
                        .map((tech) => Chip(label: Text(tech)))
                        .toList(),
                  ),
                  const SizedBox(height: 12),
                  ?ScreenType(context: context).isBetweenMobileAndTablet
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // project presentation
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ProjectDetailsScreen(project: project),
                                  ),
                                );
                              },
                              child: Row(
                                children: [
                                  Icon(Icons.info_outline),
                                  const SizedBox(width: 8),
                                  Text("Details"),
                                ],
                              ),
                            ),
                            //view on github
                            ElevatedButton(
                              onPressed: () =>
                                  launchUrlGlobal(project.githubUrl!),
                              child: Row(
                                children: [
                                  Icon(Icons.open_in_new),
                                  const SizedBox(width: 8),
                                  Text("view on github"),
                                ],
                              ),
                            ),
                          ],
                        )
                      : null,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
