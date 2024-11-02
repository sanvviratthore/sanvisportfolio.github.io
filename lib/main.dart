import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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

class PortfolioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.purple],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 50),
              _buildHeader(), // Header with photo and name
              SizedBox(height: 20),
              _buildAboutSection(),
              SizedBox(height: 20),
              _buildProjectsSection(),
              SizedBox(height: 30),
              _buildConnectSection(),
              SizedBox(height: 30),
              _buildContactMeSection(),
              SizedBox(height: 20),
              _buildContactForm(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ClipOval(
          child: Image.asset(
            'assets/images/profilephoto.jpg', // Replace with your actual image path
            width: 100, // Adjust the size as needed
            height: 100,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: 4), // Space between image and name
        Text(
          'Sanvi Rathore',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildAboutSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('About Me', style: TextStyle(fontSize: 20, color: Colors.white)),
        SizedBox(height: 10),
        Text(
          'Hello There! My name is Sanvi Rathore, and I am a passionate student studying at Indira Gandhi Delhi Technical University for Women. '
          'I am a developer with a keen interest in app development and technology. I enjoy building innovative solutions to real-world problems and contributing to open-source projects. '
          'Currently, I am exploring web3 technology and working on multiple projects, including a beach app that enhances recreational activities.',
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }

  Widget _buildProjectsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Projects', style: TextStyle(fontSize: 20, color: Colors.white)),
        SizedBox(height: 20),
        Container(
          height: 150,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildProjectCard('Project 1', 'Description of Project 1'),
              SizedBox(width: 10),
              _buildProjectCard('Project 2', 'Description of Project 2'),
              SizedBox(width: 10),
              _buildProjectCard('Project 3', 'Description of Project 3'),
              SizedBox(width: 10),
              _buildProjectCard('Project 4', 'Description of Project 4'),
            ],
          ),
        ),
      ],
    );
  }

  
Widget _buildProjectCard(String title, String description) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(10),
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0), // Adjust the blur intensity
      child: Container(
        width: 150,
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.3), // Translucent background
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              description,
              style: TextStyle(color: Colors.white),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    ),
  );
}



  Widget _buildConnectSection() {
    return Column(
      children: [
        Text('Connect with Me:', style: TextStyle(fontSize: 20, color: Colors.white)),
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
        _buildSocialLink('LinkedIn', 'https://www.linkedin.com/in/sanvi-rathore-75611a289'),
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
              colors: [Colors.blueAccent, Colors.purpleAccent],
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
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactMeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Contact Me', style: TextStyle(fontSize: 20, color: Colors.white)),
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
      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0), // Adjust the blur intensity
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.3), // Black translucent background
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Name', labelStyle: TextStyle(color: Colors.white)),
              style: TextStyle(color: Colors.white),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Email', labelStyle: TextStyle(color: Colors.white)),
              style: TextStyle(color: Colors.white),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Message', labelStyle: TextStyle(color: Colors.white)),
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
