import 'package:flutter/material.dart';
import 'package:my_portfolio/core/helper/url_launcher.dart';
import 'package:my_portfolio/core/responsive/screen_type.dart';
import 'package:my_portfolio/models/project.dart';

class ProjectDetailsScreen extends StatefulWidget {
  final Project project;
  const ProjectDetailsScreen({super.key, required this.project});

  @override
  State<ProjectDetailsScreen> createState() => _ProjectDetailsScreenState();
}

class _ProjectDetailsScreenState extends State<ProjectDetailsScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  int get totalPages => widget.project.screenShots!.length;

  void _goToPage(int delta) {
    final nextPage = _currentPage + delta;
    if (nextPage >= 0 && nextPage < totalPages) {
      _pageController.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      setState(() {
        _currentPage = nextPage;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isMobile = ScreenType(context: context).isMobile;

    final imageHeight = screenHeight * 0.5;
    final imageWidth = screenWidth * 0.8;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.teal,
        title: Text(widget.project.title, style: TextStyle(fontSize: 18)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.project.description,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: SizedBox(
                    height: imageHeight,
                    width: imageWidth,
                    child:
                        widget.project.title.toLowerCase() ==
                            "personal portfolio"
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.sentiment_very_satisfied,
                                  size: 80,
                                  color: Colors.orange[400],
                                ),
                                const SizedBox(height: 24),
                                Text(
                                  "Dah, you are already here! 😄",
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.teal[700],
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  "No need to look for a screenshot of this portfolio,\n"
                                  "you're literally inside it!",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey[700],
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          )
                        : widget.project.screenShots!.isEmpty
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.image_not_supported,
                                  size: 64,
                                  color: Colors.grey[400],
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  "No UI screenshots available yet.",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.grey[600],
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  "Stay tuned for future updates!",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[500],
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          )
                        : Stack(
                            children: [
                              PageView.builder(
                                scrollDirection:
                                    ScreenType(context: context).isMobile
                                    ? Axis.vertical
                                    : Axis.horizontal,
                                controller: _pageController,
                                itemCount: totalPages,
                                onPageChanged: (index) =>
                                    setState(() => _currentPage = index),
                                itemBuilder: (context, index) {
                                  final imagePath =
                                      widget.project.screenShots![index];
                                  return Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: Image.asset(
                                        imagePath,
                                        fit: BoxFit.contain,
                                        errorBuilder:
                                            (context, error, stackTrace) =>
                                                Container(
                                                  color: const Color(
                                                    0xFF222222,
                                                  ),
                                                  child: const Center(
                                                    child: Icon(
                                                      Icons.broken_image,
                                                      size: 48,
                                                    ),
                                                  ),
                                                ),
                                      ),
                                    ),
                                  );
                                },
                              ),

                              // Vertical (Mobile) Navigation Buttons
                              if (isMobile) ...[
                                if (_currentPage > 0)
                                  Positioned(
                                    top: 8,
                                    left: 0,
                                    right: 0,
                                    child: Center(
                                      child: InkWell(
                                        onTap: () => _goToPage(-1),
                                        borderRadius: BorderRadius.circular(24),
                                        highlightColor: Colors.teal.withOpacity(
                                          0.2,
                                        ),
                                        splashColor: Colors.teal.withOpacity(
                                          0.3,
                                        ),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white.withOpacity(
                                              0.7,
                                            ),
                                            shape: BoxShape.circle,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black.withOpacity(
                                                  0.2,
                                                ),
                                                blurRadius: 4,
                                                offset: const Offset(0, 2),
                                              ),
                                            ],
                                          ),
                                          padding: const EdgeInsets.all(4),
                                          child: const Icon(
                                            Icons.keyboard_arrow_up,
                                            color: Colors.teal,
                                            size: 32,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                if (_currentPage < totalPages - 1)
                                  Positioned(
                                    bottom: 8,
                                    left: 0,
                                    right: 0,
                                    child: Center(
                                      child: InkWell(
                                        onTap: () => _goToPage(1),
                                        borderRadius: BorderRadius.circular(24),
                                        highlightColor: Colors.teal.withOpacity(
                                          0.2,
                                        ),
                                        splashColor: Colors.teal.withOpacity(
                                          0.3,
                                        ),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white.withOpacity(
                                              0.7,
                                            ),
                                            shape: BoxShape.circle,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black.withOpacity(
                                                  0.2,
                                                ),
                                                blurRadius: 4,
                                                offset: const Offset(0, 2),
                                              ),
                                            ],
                                          ),
                                          padding: const EdgeInsets.all(4),
                                          child: const Icon(
                                            Icons.keyboard_arrow_down,
                                            color: Colors.teal,
                                            size: 32,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                              ]
                              // Horizontal (Desktop/Tablet) Navigation Buttons
                              else ...[
                                if (_currentPage > 0)
                                  Positioned(
                                    left: 8,
                                    top: 0,
                                    bottom: 0,
                                    child: Center(
                                      child: InkWell(
                                        onTap: () => _goToPage(-1),
                                        borderRadius: BorderRadius.circular(24),
                                        highlightColor: Colors.teal.withOpacity(
                                          0.2,
                                        ),
                                        splashColor: Colors.teal.withOpacity(
                                          0.3,
                                        ),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white.withOpacity(
                                              0.7,
                                            ),
                                            shape: BoxShape.circle,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black.withOpacity(
                                                  0.2,
                                                ),
                                                blurRadius: 4,
                                                offset: const Offset(0, 2),
                                              ),
                                            ],
                                          ),
                                          padding: const EdgeInsets.all(4),
                                          child: const Icon(
                                            Icons.arrow_back_ios,
                                            color: Colors.teal,
                                            size: 32,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                if (_currentPage < totalPages - 1)
                                  Positioned(
                                    right: 8,
                                    top: 0,
                                    bottom: 0,
                                    child: Center(
                                      child: InkWell(
                                        onTap: () => _goToPage(1),
                                        borderRadius: BorderRadius.circular(24),
                                        highlightColor: Colors.teal.withOpacity(
                                          0.2,
                                        ),
                                        splashColor: Colors.teal.withOpacity(
                                          0.3,
                                        ),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white.withOpacity(
                                              0.7,
                                            ),
                                            shape: BoxShape.circle,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black.withOpacity(
                                                  0.2,
                                                ),
                                                blurRadius: 4,
                                                offset: const Offset(0, 2),
                                              ),
                                            ],
                                          ),
                                          padding: const EdgeInsets.all(4),
                                          child: const Icon(
                                            Icons.arrow_forward_ios,
                                            color: Colors.teal,
                                            size: 32,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ],
                          ),
                  ),
                ),

                // ---------view on github
                const SizedBox(height: 34),
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 14,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 6,
                      shadowColor: Colors.teal.withOpacity(0.3),
                    ),
                    icon: const Icon(Icons.code, color: Colors.white),
                    label: const Text(
                      'View on GitHub',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        letterSpacing: 1.1,
                      ),
                    ),
                    onPressed: () {
                      final githubUrl = widget.project.githubUrl;
                      if (githubUrl != null && githubUrl.isNotEmpty) {
                        launchUrlGlobal(githubUrl);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'GitHub link not available for this project.',
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
