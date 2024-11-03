import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portfolio App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PortfolioScreen(),
    );
  }
}


class PortfolioScreen extends StatefulWidget {
  @override
  _PortfolioScreenState createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  late ScrollController _expertiseScrollController;
  Timer? _expertiseScrollTimer;
  List<String> _headers = [
    "Tech Enthusiast",
    "Problem Solver",
    "Innovator",
    "Flutter Developer",
    "Community Builder",
    "UI/UX Designer"
  ];
  int _currentHeaderIndex = 0;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _expertiseScrollController = ScrollController();
    _startExpertiseAutoScroll();
    _startHeaderCycling();
  }

  void _startExpertiseAutoScroll() {
    _expertiseScrollTimer = Timer.periodic(Duration(milliseconds: 20), (timer) {
      if (_expertiseScrollController.hasClients) {
        _expertiseScrollController.jumpTo(
          _expertiseScrollController.position.pixels + 1,
        );

        if (_expertiseScrollController.position.pixels >=
            _expertiseScrollController.position.maxScrollExtent) {
          _expertiseScrollController.jumpTo(0);
        }
      }
    });
  }

  void _startHeaderCycling() {
    Timer.periodic(Duration(seconds: 3), (timer) {
      setState(() {
        _currentHeaderIndex = (_currentHeaderIndex + 1) % _headers.length;
      });
    });
  }

  @override
  void dispose() {
    _expertiseScrollController.dispose();
    _expertiseScrollTimer?.cancel();
    super.dispose();
  }

  void _scrollToSection(double offset) {
    _scrollController.animateTo(
      offset,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void _showMenu() {
    showModalBottomSheet(
      context: context,
      isDismissible: true,
      backgroundColor: Colors.transparent, // Make the background transparent
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.black54, // Background color with opacity
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)), // Rounded corners at the top
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: double.infinity, // Full width of the menu
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white.withOpacity(0.1), // Background color for menu items
                ),
                child: ListTile(
                  title: Text(
                    "About",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    _scrollToSection(0); // Scroll to About section
                    Navigator.of(context).pop(); // Close the menu
                  },
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white.withOpacity(0.1),
                ),
                child: ListTile(
                  title: Text(
                    "Projects",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    _scrollToSection(200); // Scroll to Projects section
                    Navigator.of(context).pop(); // Close the menu
                  },
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white.withOpacity(0.1),
                ),
                child: ListTile(
                  title: Text(
                    "Expertise",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    _scrollToSection(400); // Scroll to Expertise section
                    Navigator.of(context).pop(); // Close the menu
                  },
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white.withOpacity(0.1),
                ),
                child: ListTile(
                  title: Text(
                    "Connect",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    _scrollToSection(600); // Scroll to Connect section
                    Navigator.of(context).pop(); // Close the menu
                  },
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white.withOpacity(0.1),
                ),
                child: ListTile(
                  title: Text(
                    "Contact Me",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    _scrollToSection(800); // Scroll to Contact Me section
                    Navigator.of(context).pop(); // Close the menu
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 22, 9, 74),
              const Color.fromARGB(255, 3, 2, 44),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          controller: _scrollController,
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 50),
              _buildHeader(),
              SizedBox(height: 20),
              _buildAboutSection(),
              SizedBox(height: 20),
              _buildProjectsSection(),
              SizedBox(height: 30),
              _buildExpertiseSection(),
              SizedBox(height: 30),
              _buildConnectSection(),
              SizedBox(height: 30),
              _buildContactMeSection(),
              SizedBox(height: 20),
              _buildContactForm(),
              SizedBox(height: 20),
              Text(
                'Made with ❤️ by Sanvi',
                style: TextStyle(color: Colors.white, fontSize: 14),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showMenu, // Show menu on press
        backgroundColor: Colors.blue,
        child: Icon(Icons.menu), // Keep menu icon regardless of menu state
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget _buildHeader() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0.0, end: 250.0),
          duration: Duration(seconds: 2),
          builder: (context, size, child) {
            return ClipOval(
              child: Image.asset(
                'assets/images/profilephoto.jpg', // Replace with your actual image path
                width: size,
                height: size,
                fit: BoxFit.cover,
              ),
            );
          },
        ),
        SizedBox(height: 8),
        Text(
          'Sanvi Rathore',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 145, 88, 203),
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 16),
        TyperAnimatedTextKit(
          text: [_headers[_currentHeaderIndex]],
          textStyle: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
          speed: Duration(milliseconds: 100),
          isRepeatingAnimation: true,
        ),
      ],
    );
  }

  // Expertise Section with horizontal scroll
  Widget _buildExpertiseSection() {
    final List<Map<String, dynamic>> skills = [
      {'name': 'Flutter', 'icon': Icons.flutter_dash},
      {'name': 'Java', 'icon': Icons.code},
      {'name': 'C', 'icon': Icons.code},
      {'name': 'Python', 'icon': Icons.code},
      {'name': 'SQL', 'icon': Icons.storage},
      {'name': 'Figma', 'icon': Icons.design_services},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Expertise:',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.yellow),
        ),
        SizedBox(height: 10),
        Container(
          height: 100, // Set height for the horizontal scroll view
          child: ListView.builder(
            controller: _expertiseScrollController,
            scrollDirection: Axis.horizontal,
            itemCount: 100, // A large number to create a loop effect
            itemBuilder: (context, index) {
              // Create items based on their index
              return _buildExpertiseCard(
                  skills[index % skills.length]); // Cycle through the skills
            },
          ),
        ),
      ],
    );
  }

  Widget _buildExpertiseCard(Map<String, dynamic> skill) {
    return Container(
      width: 120, // Set width for expertise cards
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 107, 157, 207),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center, // Center the row
        children: [
          Icon(skill['icon'], color: Colors.white), // Icon for the tech stack
          SizedBox(width: 8), // Spacing between icon and text
          Text(
            skill['name'],
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    );
  }

  // Widget _buildHeader() {
  //   return Column(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: [
  //       TweenAnimationBuilder<double>(
  //         tween:
  //             Tween<double>(begin: 0.0, end: 250.0), // Final size for the image
  //         duration: Duration(seconds: 2), // Duration of the animation
  //         builder: (context, size, child) {
  //           return ClipOval(
  //             child: Image.asset(
  //               'assets/images/profilephoto.jpg', // Replace with your actual image path
  //               width: size, // Animated size
  //               height: size,
  //               fit: BoxFit.cover,
  //             ),
  //           );
  //         },
  //       ),
  //       SizedBox(height: 8), // Space between image and text
  //       Text(
  //         'Sanvi Rathore', // Static text for your name
  //         style: TextStyle(
  //           fontSize: 28,
  //           fontWeight: FontWeight.bold,
  //           color: const Color.fromARGB(255, 145, 88, 203),
  //         ),
  //         textAlign: TextAlign.center,
  //       ),

  //       SizedBox(height: 16), // Space between name and headers
  //       TyperAnimatedTextKit(
  //         text: [_headers[_currentHeaderIndex]], // Current header text
  //         textStyle: TextStyle(
  //           fontSize: 24,
  //           fontWeight: FontWeight.w500,
  //           color: Colors.white,
  //         ),
  //         speed: Duration(milliseconds: 100), // Typing speed
  //         isRepeatingAnimation: true, // Make it repeat
  //       ),
  //     ],
  //   );
  // }

  Widget _buildAboutSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('About Me',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.yellow)),
        SizedBox(
          height: 10,
        ),
        Text(
          'Hello! I’m Sanvi Rathore, a passionate developer and a curious learner currently pursuing my studies at Indira Gandhi Delhi Technical University for Women. My journey in technology began with a fascination for creating solutions that bridge the gap between ideas and reality.'
          'I specialize in app development, where I enjoy transforming innovative concepts into functional applications that enhance user experiences. My projects reflect my commitment to blending creativity with technology, from interactive platforms to user-friendly interfaces.'
          'Beyond coding, I am an advocate for open-source collaboration, believing in the power of community and shared knowledge to drive innovation. I am currently diving into the exciting realm of web3 technology, exploring its potential to revolutionize the digital landscape.'
          'When I’m not coding, you can find me exploring the latest tech trends, contributing to meaningful projects, or engaging in discussions about sustainability and technology’s role in our future.'
          'I’m always eager to connect with like-minded individuals and collaborate on projects that challenge the status quo. Let’s innovate together!',
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }

  Widget _buildProjectsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Projects',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.yellow)),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 150,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildProjectCard(
                  'Shopping Cart App',
                  'A simple shopping cart app to manage products.',
                  'https://github.com/sanvviratthore/Shopping-cart-app'),
              SizedBox(width: 10),
              _buildProjectCard(
                  'Translator App',
                  'A simple translator app which detects sentiments of the user.',
                  'https://github.com/sanvviratthore/Translator-with-Sentiment-detection'),
              SizedBox(width: 10),
              _buildProjectCard(
                  'Coastal Compass',
                  'An eco-friendly beach app still in making for SIH\'24.',
                  'https://github.com/sanvviratthore/Coastal-Compass'),
              // Add more project cards as needed
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildProjectCard(String title, String description, String url) {
    return GestureDetector(
      onTap: () => _launchURL(url), // Open the URL in the browser when tapped
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            width: 200,
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3), // Translucent background
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  description,
                  style: TextStyle(color: Colors.white),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.link, color: Colors.white, size: 12),
                    SizedBox(width: 5),
                    Text(
                      'View Project',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTechStackCard(String tech, IconData icon) {
    return Container(
      width: 200, // Width of each tech stack card
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3), // Background color
        borderRadius: BorderRadius.circular(10), // Border color
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white),
          SizedBox(width: 8),
          Text(
            tech,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildConnectSection() {
    return Column(
      children: [
        Text('Connect with Me:',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.yellow)),
        SizedBox(height: 20),
        _buildSocialLinks(),
      ],
    );
  }

  Widget _buildSocialLinks() {
    return Column(
      children: [
        _buildSocialLink('GitHub', 'https://github.com/sanvviratthore'),
        SizedBox(height: 10),
        _buildSocialLink(
            'LinkedIn', 'https://www.linkedin.com/in/sanvi-rathore-75611a289'),
        SizedBox(height: 10),
        _buildSocialLink('LeetCode', 'https://leetcode.com/u/sanvviratthore/'),
      ],
    );
  }

  Widget _buildSocialLink(String platform, String url) {
    return GestureDetector(
      onTap: () => _launchURL(url),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color.fromARGB(255, 22, 9, 74),
                const Color.fromARGB(255, 3, 2, 44)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                platform,
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              Icon(Icons.arrow_forward, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactMeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Contact Me:',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.yellow)),
        SizedBox(height: 10),
        Text(
          'Feel free to reach out for collaborations or inquiries!',
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }

  Widget _buildContactForm() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: BackdropFilter(
        filter: ImageFilter.blur(
            sigmaX: 10.0, sigmaY: 10.0), // Adjust the blur intensity
        child: Container(
          decoration: BoxDecoration(
            color:
                Colors.black.withOpacity(0.3), // Black translucent background
            borderRadius: BorderRadius.circular(15),
          ),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                    labelText: 'Name',
                    labelStyle: TextStyle(color: Colors.white)),
                style: TextStyle(color: Colors.white),
              ),
              TextField(
                decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.white)),
                style: TextStyle(color: Colors.white),
              ),
              TextField(
                decoration: InputDecoration(
                    labelText: 'Message',
                    labelStyle: TextStyle(color: Colors.white)),
                maxLines: 3,
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Implement form submission logic here
                },
                child: Text('Send'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }
} 