import 'package:flutter/material.dart';
import '../../../widgets/_pageswipe.dart';
import 'numbers_page.dart';
import 'shapes_page.dart';
import 'letters_page.dart';
import 'colors_page.dart';

class LearnScreen extends StatefulWidget {
  @override
  _LearnScreenState createState() => _LearnScreenState();
}

class _LearnScreenState extends State<LearnScreen> with SingleTickerProviderStateMixin {
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _fadeAnimation = CurvedAnimation(parent: _fadeController, curve: Curves.easeIn);
    _fadeController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Background image
            Positioned.fill(
              child: Image.asset(
                'assets/backgrounds/chalkboard.gif',
                fit: BoxFit.cover,
              ),
            ),
            // Semi-transparent overlay
            Positioned.fill(
              child: Container(
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            FadeTransition(
              opacity: _fadeAnimation,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Categories Section
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Categories',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),

                      // Category Cards with new design (Lion button style)
                      CategoryCard(
                        color: Colors.orangeAccent,
                        title: 'Colors',
                        subtitle: 'Learn the different colors.',
                        iconPath: 'assets/icons/colors_icon.png', // Placeholder for lion image path
                      ),
                      CategoryCard(
                        color: Colors.lightBlueAccent,
                        title: 'Numbers',
                        subtitle: 'Learn to count with numbers!',
                        iconPath: 'assets/icons/numbers_icon.png',
                      ),
                      CategoryCard(
                        color: Colors.greenAccent,
                        title: 'Shapes',
                        subtitle: 'Discover different shapes!',
                        iconPath: 'assets/icons/shapes_icon.png',
                      ),
                      CategoryCard(
                        color: Colors.pinkAccent,
                        title: 'Letters',
                        subtitle: 'Learn the alphabet!',
                        iconPath: 'assets/icons/letters_icon.png',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryCard extends StatefulWidget {
  final Color? color;
  final String title;
  final String subtitle;
  final String iconPath;

  CategoryCard({
    required this.color,
    required this.title,
    required this.subtitle,
    required this.iconPath,
  });

  @override
  _CategoryCardState createState() => _CategoryCardState();
}
class _CategoryCardState extends State<CategoryCard> with SingleTickerProviderStateMixin {
  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _scaleController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200), // Duration of the tap animation
      lowerBound: 0.95, // Slightly scale down when tapped
      upperBound: 1.0,
    );
    _scaleAnimation = CurvedAnimation(parent: _scaleController, curve: Curves.easeOut);
  }

  @override
  void dispose() {
    _scaleController.dispose();
    super.dispose();
  }

  // Navigate to SwipePageView and set initial page index based on category
  void navigateToPage(BuildContext context) {
    int initialPageIndex = 0; // Default to Numbers
    if (widget.title == 'Shapes') {
      initialPageIndex = 1;
    } else if (widget.title == 'Letters') {
      initialPageIndex = 2;
    } else if (widget.title == 'Colors') {
      initialPageIndex = 3;
    }

    // Navigate to the SwipePageView with the initialPageIndex
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SwipePageView(initialPageIndex: initialPageIndex)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _scaleController.reverse(), // Start animation on tap down
      onTapUp: (_) => _scaleController.forward(), // End animation on tap up
      onTapCancel: () => _scaleController.forward(), // Handle cancel events
      onTap: () {
        navigateToPage(context); // Navigate to the respective swipe page
      },
      child: ScaleTransition(
        scale: _scaleAnimation, // Apply the scale animation
        child: Container(
          margin: EdgeInsets.only(bottom: 20),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: widget.color ?? Colors.white, // Background color based on the category
            borderRadius: BorderRadius.circular(20), // Rounded corners like in the button layout
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: Offset(0, 5), // Slight shadow for depth
              ),
            ],
          ),
          child: Row(
            children: [
              // Icon Image (Left) with no background color
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  widget.iconPath,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(width: 20),

              // Text (Right)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black, // Text color as black
                    ),
                  ),
                  Text(
                    widget.subtitle, // Display the subtitle
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
