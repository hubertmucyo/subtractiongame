import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';
import 'dart:html' as html;

void main() {
  runApp(const SubtractionGame());
}

class SubtractionGame extends StatelessWidget {
  const SubtractionGame({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dora Subtraction Adventure',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'ComicNeue',
      ),
      home: const WelcomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// Welcome Screen
class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool _showWelcomeDialog = true;

  void _openWebsite() {
    html.window.open('https://hubertmucyo.github.io/gamify', '_blank');
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isMobile = screenSize.width < 768;
    final isTablet = screenSize.width >= 768 && screenSize.width < 1024;
    final isDesktop = screenSize.width >= 1024;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF4A90E2), // Dora's shirt blue
              Color(0xFFF8E71C), // Dora's hair yellow
              Color(0xFF7ED321), // Green from backpack
            ],
          ),
        ),
        child: Stack(
          children: [
            // Background Characters
            if (!isMobile) ...[
              Positioned(
                top: 50,
                left: 50,
                child: _buildCharacterBadge('assets/dora_smiling.jpg', 100),
              ),
              Positioned(
                bottom: 100,
                right: 50,
                child: _buildCharacterBadge('assets/boots.jpg', 80),
              ),
              Positioned(
                top: 200,
                right: 100,
                child: _buildCharacterBadge('assets/backpack.jpg', 70),
              ),
              Positioned(
                bottom: 200,
                left: 100,
                child: _buildCharacterBadge('assets/map.jpg', 60),
              ),
            ],

            Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(isMobile ? 16 : 30),
                child: Container(
                  width: isDesktop ? 900 : isTablet ? 700 : screenSize.width * 0.95,
                  padding: EdgeInsets.all(isMobile ? 20 : 40),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.95),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.orange.withOpacity(0.4),
                        blurRadius: 30,
                        spreadRadius: 5,
                      ),
                    ],
                    border: Border.all(
                      color: const Color(0xFF4A90E2),
                      width: 4,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Title with Dora Style
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: isMobile ? 20 : 40,
                              vertical: isMobile ? 15 : 20,
                            ),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xFF4A90E2),
                                  Color(0xFFF8E71C),
                                  Color(0xFF7ED321),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(50),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.orange.withOpacity(0.5),
                                  blurRadius: 20,
                                  spreadRadius: 5,
                                ),
                              ],
                            ),
                            child: Text(
                              'DORA SUBTRACTION ADVENTURE',
                              style: TextStyle(
                                fontSize: isDesktop ? 42 : isTablet ? 36 : 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontFamily: 'ComicNeue',
                                letterSpacing: 1.5,
                                shadows: [
                                  const Shadow(
                                    blurRadius: 10,
                                    color: Colors.black,
                                    offset: Offset(2, 2),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: isMobile ? 20 : 40),

                      // Main Dora Image
                      Container(
                        width: isDesktop ? 350 : isTablet ? 280 : 220,
                        height: isDesktop ? 350 : isTablet ? 280 : 220,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                            color: const Color(0xFF4A90E2),
                            width: 4,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.orange.withOpacity(0.3),
                              blurRadius: 15,
                              spreadRadius: 3,
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            'assets/dora_main.jpg',
                            fit: BoxFit.cover,
                            errorBuilder: (ctx, err, st) => Container(
                              color: const Color(0xFFE8F4FF),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.explore, 
                                      size: isMobile ? 60 : 100, 
                                      color: const Color(0xFF4A90E2)),
                                  SizedBox(height: isMobile ? 10 : 20),
                                  Text(
                                    'Dora the Explorer\n350x350px',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: isMobile ? 14 : 18,
                                      color: const Color(0xFF4A90E2),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: isMobile ? 20 : 40),

                      // Adventure Info
                      Container(
                        padding: EdgeInsets.all(isMobile ? 16 : 24),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFFE8F4FF), Color(0xFFF0FFE8)],
                          ),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: const Color(0xFF7ED321), width: 3),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.emoji_events, color: Color(0xFFF8E71C), size: 30),
                                SizedBox(width: 10),
                                Text(
                                  'ADVENTURE GUIDE',
                                  style: TextStyle(
                                    fontSize: isMobile ? 20 : 24,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF4A90E2),
                                    fontFamily: 'ComicNeue',
                                  ),
                                ),
                                SizedBox(width: 10),
                                Icon(Icons.emoji_events, color: Color(0xFFF8E71C), size: 30),
                              ],
                            ),
                            SizedBox(height: 15),
                            Text(
                              '🎒 Solve 10 subtraction problems per level\n'
                              '⏰ Beat the timer to advance\n'
                              '🏆 Get 7+ correct to unlock next grade\n'
                              '🌟 30 grades to master subtraction!\n'
                              '📚 No negative numbers - always positive!',
                              style: TextStyle(
                                fontSize: isMobile ? 16 : 18,
                                color: Color(0xFF4A90E2),
                                fontFamily: 'ComicNeue',
                                height: 1.6,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: isMobile ? 20 : 40),

                      // Start Adventure Button
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF7ED321).withOpacity(0.5),
                              blurRadius: 20,
                              spreadRadius: 5,
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => GradeSelectionScreen()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF7ED321),
                            padding: EdgeInsets.symmetric(
                              horizontal: isMobile ? 40 : 60,
                              vertical: isMobile ? 16 : 20,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            elevation: 10,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.play_arrow, 
                                  size: isMobile ? 24 : 30, 
                                  color: Colors.white),
                              SizedBox(width: isMobile ? 10 : 15),
                              Text(
                                'START ADVENTURE',
                                style: TextStyle(
                                  fontSize: isMobile ? 16 : 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontFamily: 'ComicNeue',
                                  letterSpacing: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: isMobile ? 15 : 20),

                      // Exit Button
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              blurRadius: 10,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: ElevatedButton.icon(
                          onPressed: _openWebsite,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF4A90E2),
                            padding: EdgeInsets.symmetric(
                              horizontal: isMobile ? 20 : 30,
                              vertical: isMobile ? 12 : 15,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          icon: Icon(Icons.exit_to_app, 
                              size: isMobile ? 18 : 24, 
                              color: Colors.white),
                          label: Text(
                            'RETURN TO GAMIFY',
                            style: TextStyle(
                              fontSize: isMobile ? 14 : 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: 'ComicNeue',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Welcome Dialog
            if (_showWelcomeDialog)
              _buildWelcomeDialog(isMobile, isTablet, isDesktop),
          ],
        ),
      ),
    );
  }

  Widget _buildCharacterBadge(String assetPath, double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withOpacity(0.2),
        border: Border.all(color: Colors.white.withOpacity(0.4), width: 3),
        boxShadow: [
          BoxShadow(
            color: Colors.orange.withOpacity(0.3),
            blurRadius: 15,
            spreadRadius: 2,
          ),
        ],
      ),
      child: ClipOval(
        child: Image.asset(
          assetPath,
          fit: BoxFit.cover,
          errorBuilder: (ctx, err, st) => Icon(
            Icons.face,
            size: size * 0.6,
            color: Colors.white.withOpacity(0.7),
          ),
        ),
      ),
    );
  }

  Widget _buildWelcomeDialog(bool isMobile, bool isTablet, bool isDesktop) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: SingleChildScrollView(
        child: Container(
          width: isDesktop ? 600 : isTablet ? 500 : 350,
          padding: EdgeInsets.all(isMobile ? 20 : 30),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFFE8F4FF),
                Color(0xFFF0FFE8),
              ],
            ),
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: const Color(0xFF4A90E2), width: 4),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Dora Image
              Container(
                width: isDesktop ? 120 : isTablet ? 100 : 80,
                height: isDesktop ? 120 : isTablet ? 100 : 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFF4A90E2), width: 4),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.orange.withOpacity(0.4),
                      blurRadius: 15,
                      spreadRadius: 3,
                    ),
                  ],
                ),
                child: ClipOval(
                  child: Image.asset(
                    'assets/dora_waving.jpg',
                    fit: BoxFit.cover,
                    errorBuilder: (ctx, err, st) => Container(
                      color: const Color(0xFFE8F4FF),
                      child: Icon(Icons.face, 
                          size: isDesktop ? 60 : isTablet ? 50 : 40, 
                          color: const Color(0xFF4A90E2)),
                    ),
                  ),
                ),
              ),
              
              SizedBox(height: isMobile ? 15 : 20),
              
              Text(
                '¡Hola! I\'m Dora!',
                style: TextStyle(
                  fontSize: isDesktop ? 28 : isTablet ? 24 : 20,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF4A90E2),
                  fontFamily: 'ComicNeue',
                ),
                textAlign: TextAlign.center,
              ),
              
              SizedBox(height: isMobile ? 15 : 20),
              
              Container(
                padding: EdgeInsets.all(isMobile ? 15 : 20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: const Color(0xFF7ED321), width: 2),
                ),
                child: Text(
                  'Let\'s go on a subtraction adventure! Can you help me solve these math problems?\n\n'
                  'We\'ll start with easy numbers and work our way up to bigger challenges!\n\n'
                  'Remember: No negative numbers - we only subtract smaller numbers from bigger ones!\n\n'
                  '¡Vámonos! Let\'s go!',
                  style: TextStyle(
                    fontSize: isMobile ? 14 : 16,
                    color: const Color(0xFF4A90E2),
                    fontFamily: 'ComicNeue',
                    height: 1.6,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              
              SizedBox(height: isMobile ? 20 : 25),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Backpack Icon
                  Icon(Icons.backpack, size: 40, color: Color(0xFF8B4513)),
                  
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _showWelcomeDialog = false;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF7ED321),
                      padding: EdgeInsets.symmetric(
                        horizontal: isMobile ? 30 : 40,
                        vertical: isMobile ? 12 : 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      '¡Vámonos!',
                      style: TextStyle(
                        fontSize: isMobile ? 16 : 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'ComicNeue',
                      ),
                    ),
                  ),
                  
                  // Map Icon
                  Icon(Icons.map, size: 40, color: Color(0xFFF8E71C)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Grade Selection Screen
class GradeSelectionScreen extends StatefulWidget {
  const GradeSelectionScreen({super.key});

  @override
  State<GradeSelectionScreen> createState() => _GradeSelectionScreenState();
}

class _GradeSelectionScreenState extends State<GradeSelectionScreen> {
  List<bool> unlockedGrades = List.generate(31, (index) => index <= 1); // Grade 1 always unlocked

  void _openWebsite() {
    html.window.open('https://hubertmucyo.github.io/gamify', '_blank');
  }

  void _updateUnlockedGrades(int grade, bool passed) {
    setState(() {
      if (passed && grade < 30) {
        unlockedGrades[grade + 1] = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isMobile = screenSize.width < 768;
    final isTablet = screenSize.width >= 768 && screenSize.width < 1024;
    final isDesktop = screenSize.width >= 1024;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF4A90E2),
              Color(0xFFF8E71C),
              Color(0xFF7ED321),
            ],
          ),
        ),
        child: Column(
          children: [
            // Header
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                vertical: isMobile ? 15 : 20,
                horizontal: isMobile ? 20 : 30,
              ),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF4A90E2),
                    Color(0xFF7ED321),
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.orange.withOpacity(0.4),
                    blurRadius: 15,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: isMobile 
                  ? _buildMobileHeader(isMobile, context)
                  : _buildDesktopHeader(isDesktop, isTablet, context),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(isMobile ? 16 : 30),
                child: Center(
                  child: SizedBox(
                    width: isDesktop ? 1200 : isTablet ? 800 : screenSize.width * 0.95,
                    child: Column(
                      children: [
                        Text(
                          'Choose Your Adventure Level!',
                          style: TextStyle(
                            fontSize: isDesktop ? 32 : isTablet ? 28 : 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: 'ComicNeue',
                            shadows: [
                              const Shadow(
                                blurRadius: 8,
                                color: Colors.black,
                                offset: Offset(2, 2),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),

                        SizedBox(height: isMobile ? 20 : 30),

                        // Grade Selection Grid
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: isDesktop ? 6 : isTablet ? 5 : 4,
                            crossAxisSpacing: isMobile ? 10 : 15,
                            mainAxisSpacing: isMobile ? 10 : 15,
                            childAspectRatio: 0.9,
                          ),
                          itemCount: 30,
                          itemBuilder: (context, index) {
                            final grade = index + 1;
                            final isUnlocked = unlockedGrades[grade];
                            final difficultyColor = _getDifficultyColor(grade);
                            
                            return _buildGradeCard(
                              grade,
                              difficultyColor,
                              isUnlocked,
                              context,
                              isMobile,
                              isTablet,
                              isDesktop,
                            );
                          },
                        ),

                        SizedBox(height: isMobile ? 20 : 40),

                        // Boots Character
                        Container(
                          width: isDesktop ? 100 : isTablet ? 80 : 60,
                          height: isDesktop ? 100 : isTablet ? 80 : 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 3),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.orange.withOpacity(0.4),
                                blurRadius: 15,
                                spreadRadius: 3,
                              ),
                            ],
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              'assets/boots.jpg',
                              fit: BoxFit.cover,
                              errorBuilder: (ctx, err, st) => Container(
                                color: const Color(0xFF8B4513),
                                child: Icon(Icons.pets, 
                                    size: isDesktop ? 40 : isTablet ? 30 : 20, 
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 10),

                        Text(
                          'Boots is ready to help you learn!',
                          style: TextStyle(
                            fontSize: isMobile ? 14 : 16,
                            color: Colors.white,
                            fontFamily: 'ComicNeue',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileHeader(bool isMobile, BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Backpack Icon
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF8B4513),
                border: Border.all(color: Colors.white, width: 2),
                boxShadow: [
                  BoxShadow(
                    color: Colors.orange.withOpacity(0.3),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: const Icon(Icons.backpack, color: Colors.white, size: 30),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                children: [
                  Text(
                    'SUBTRACTION ADVENTURE',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'ComicNeue',
                      letterSpacing: 1,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Choose Your Grade',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontFamily: 'ComicNeue',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Main Menu Button
            Container(
              margin: const EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF4A90E2).withOpacity(0.3),
                    blurRadius: 8,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const WelcomeScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4A90E2),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                icon: const Icon(Icons.home, color: Colors.white, size: 14),
                label: const Text(
                  'MENU',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'ComicNeue',
                  ),
                ),
              ),
            ),
            // Exit Button
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 8,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: ElevatedButton.icon(
                onPressed: _openWebsite,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4A90E2),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                icon: const Icon(Icons.exit_to_app, color: Colors.white, size: 14),
                label: const Text(
                  'EXIT',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'ComicNeue',
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDesktopHeader(bool isDesktop, bool isTablet, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Backpack Icon
        Container(
          width: isDesktop ? 70 : 60,
          height: isDesktop ? 70 : 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color(0xFF8B4513),
            border: Border.all(color: Colors.white, width: 3),
            boxShadow: [
              BoxShadow(
                color: Colors.orange.withOpacity(0.3),
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Icon(Icons.backpack, 
              size: isDesktop ? 40 : 30, 
              color: Colors.white),
        ),

        Column(
          children: [
            Text(
              'DORA SUBTRACTION ADVENTURE',
              style: TextStyle(
                fontSize: isDesktop ? 32 : 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'ComicNeue',
                letterSpacing: 1.5,
              ),
            ),
            Text(
              'Choose Your Grade Level',
              style: TextStyle(
                fontSize: isDesktop ? 18 : 14,
                color: Colors.white,
                fontFamily: 'ComicNeue',
              ),
            ),
          ],
        ),

        // Main Menu and Exit Buttons
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Main Menu Button
            Container(
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF4A90E2).withOpacity(0.3),
                    blurRadius: 8,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const WelcomeScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4A90E2),
                  padding: EdgeInsets.symmetric(
                    horizontal: isDesktop ? 16 : 12,
                    vertical: isDesktop ? 10 : 8,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                icon: Icon(Icons.home, 
                    color: Colors.white, 
                    size: isDesktop ? 18 : 14),
                label: Text(
                  'MENU',
                  style: TextStyle(
                    fontSize: isDesktop ? 12 : 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'ComicNeue',
                  ),
                ),
              ),
            ),

            // Exit Button
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: ElevatedButton.icon(
                onPressed: _openWebsite,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4A90E2),
                  padding: EdgeInsets.symmetric(
                    horizontal: isDesktop ? 20 : 16,
                    vertical: isDesktop ? 12 : 10,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                icon: Icon(Icons.exit_to_app, 
                    color: Colors.white, 
                    size: isDesktop ? 20 : 16),
                label: Text(
                  'EXIT',
                  style: TextStyle(
                    fontSize: isDesktop ? 14 : 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'ComicNeue',
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  Color _getDifficultyColor(int grade) {
    if (grade <= 10) return const Color(0xFF7ED321); // Easy - Green
    if (grade <= 20) return const Color(0xFFF8E71C); // Medium - Yellow
    return const Color(0xFF4A90E2); // Hard - Blue
  }

  Widget _buildGradeCard(int grade, Color difficultyColor, bool isUnlocked, 
                         BuildContext context, bool isMobile, bool isTablet, bool isDesktop) {
    return GestureDetector(
      onTap: isUnlocked ? () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => SubtractionGamePage(
            startingGrade: grade,
            onLevelComplete: _updateUnlockedGrades,
          )),
        );
      } : null,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: isUnlocked
                ? [
                    difficultyColor.withOpacity(0.8),
                    difficultyColor.withOpacity(0.4),
                  ]
                : [
                    Colors.grey.withOpacity(0.6),
                    Colors.grey.withOpacity(0.3),
                  ],
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: (isUnlocked ? difficultyColor : Colors.grey).withOpacity(0.5),
              blurRadius: 15,
              spreadRadius: 3,
            ),
          ],
          border: Border.all(
            color: isUnlocked ? Colors.white : Colors.grey,
            width: 2,
          ),
        ),
        child: Stack(
          children: [
            if (!isUnlocked)
              Positioned(
                top: 8,
                right: 8,
                child: Icon(
                  Icons.lock,
                  color: Colors.white,
                  size: isDesktop ? 20 : isTablet ? 18 : 16,
                ),
              ),

            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'GRADE',
                    style: TextStyle(
                      fontSize: isDesktop ? 12 : isTablet ? 11 : 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'ComicNeue',
                      letterSpacing: 1,
                    ),
                  ),
                  Text(
                    '$grade',
                    style: TextStyle(
                      fontSize: isDesktop ? 28 : isTablet ? 24 : 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'ComicNeue',
                      shadows: [
                        const Shadow(
                          blurRadius: 8,
                          color: Colors.black,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    _getDifficultyText(grade),
                    style: TextStyle(
                      fontSize: isDesktop ? 10 : isTablet ? 9 : 8,
                      color: Colors.white,
                      fontFamily: 'ComicNeue',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getDifficultyText(int grade) {
    if (grade <= 10) return 'EASY';
    if (grade <= 20) return 'MEDIUM';
    return 'HARD';
  }
}

// Subtraction Game Page
class SubtractionGamePage extends StatefulWidget {
  final int startingGrade;
  final Function(int, bool) onLevelComplete;

  const SubtractionGamePage({
    super.key,
    required this.startingGrade,
    required this.onLevelComplete,
  });

  @override
  State<SubtractionGamePage> createState() => _SubtractionGamePageState();
}

class _SubtractionGamePageState extends State<SubtractionGamePage> with SingleTickerProviderStateMixin {
  final Random _random = Random();
  int num1 = 1;
  int num2 = 1;
  int grade = 1;
  int questionCount = 0;
  int correctCount = 0;
  int wrongCount = 0;
  final TextEditingController _answerController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  String feedback = "";
  String doraMessage = "";

  int timeLeft = 15;
  Timer? _timer;
  bool isTimeUp = false;

  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;

  void _openWebsite() {
    html.window.open('https://hubertmucyo.github.io/gamify', '_blank');
  }

  @override
  void initState() {
    super.initState();
    grade = widget.startingGrade;
    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    )..repeat(reverse: true);
    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
    _generateQuestion();
    _setDoraMessage();
  }

  void _setDoraMessage() {
    final messages = [
      "Can you help me solve this?",
      "Let's figure this out together!",
      "You can do it!",
      "¡Excelente! Keep going!",
      "Math is fun with friends!",
      "Use your thinking skills!",
    ];
    setState(() {
      doraMessage = messages[_random.nextInt(messages.length)];
    });
  }

  void _generateQuestion() {
    int maxDigits = _getMaxDigitsForGrade();
    
    // Ensure num1 is always bigger than num2 to avoid negative results
    if (maxDigits == 1) {
      // Single digit subtraction
      num1 = _random.nextInt(9) + 2; // 2-10 to ensure positive result
      num2 = _random.nextInt(num1 - 1) + 1; // 1 to (num1-1)
    } else {
      // Multi-digit subtraction with proper bounds
      int minValue = pow(10, maxDigits - 1).toInt();
      int maxValue = pow(10, maxDigits).toInt() - 1;
      
      num1 = minValue + _random.nextInt(maxValue - minValue);
      
      // Ensure num2 is smaller but still appropriate for the grade
      int maxNum2 = num1 - 1;
      int minNum2 = pow(10, maxDigits - 1).toInt();
      if (minNum2 >= maxNum2) {
        minNum2 = 1;
      }
      num2 = minNum2 + _random.nextInt(maxNum2 - minNum2 + 1);
    }

    _answerController.clear();
    timeLeft = _getTimeLimit();
    Future.delayed(const Duration(milliseconds: 100), () {
      if (mounted) _focusNode.requestFocus();
    });
    _startTimer();
    _setDoraMessage();
  }

  int _getMaxDigitsForGrade() {
    if (grade <= 5) return 1;      // Grades 1-5: Single digit
    if (grade <= 10) return 2;     // Grades 6-10: Two digits  
    if (grade <= 20) return 3;     // Grades 11-20: Three digits
    return 4;                      // Grades 21-30: Four digits
  }

  int _getTimeLimit() {
    return _getMaxDigitsForGrade() >= 3 ? 30 : 15;
  }

  void _checkAnswer() {
    if (_answerController.text.isEmpty || isTimeUp) return;
    _timer?.cancel();
    int userAnswer = int.tryParse(_answerController.text) ?? 0;
    int correctAnswer = num1 - num2;

    setState(() {
      questionCount++;
      if (userAnswer == correctAnswer) {
        correctCount++;
        feedback = "✅ ¡Excelente! Correct!";
      } else {
        wrongCount++;
        feedback = "❌ Almost! Answer: $correctAnswer";
      }

      if (questionCount == 10) {
        Future.delayed(const Duration(milliseconds: 700), () {
          if (mounted) _showLevelResult();
        });
      } else {
        Future.delayed(const Duration(milliseconds: 1200), () {
          if (mounted) {
            setState(() => feedback = "");
            _generateQuestion();
          }
        });
      }
    });
  }

  void _showLevelResult() async {
    bool passed = correctCount >= 7;
    bool relegated = correctCount < 3 && grade > 1;

    String resultMsg;
    String resultEmoji;
    Color resultColor;
    String doraImage;

    // Store the current grade before any changes
    int currentGrade = grade;

    if (passed && grade < 30) {
      resultMsg = "¡Fantástico! You advance to Grade ${grade + 1}!";
      resultEmoji = "🎉";
      resultColor = const Color(0xFF7ED321);
      doraImage = 'assets/dora_happy.jpg';
      // Update the grade for the next level
      grade++;
      widget.onLevelComplete(currentGrade, true);
    } else if (relegated) {
      resultMsg = "Keep practicing! You return to Grade ${grade - 1}.";
      resultEmoji = "💪";
      resultColor = const Color(0xFFF8E71C);
      doraImage = 'assets/dora_encouraging.jpg';
      grade--;
      widget.onLevelComplete(currentGrade, false);
    } else if (grade == 30 && passed) {
      resultMsg = "¡Increíble! You've mastered all subtraction grades!";
      resultEmoji = "🏆";
      resultColor = const Color(0xFF4A90E2);
      doraImage = 'assets/dora_celebrating.jpg';
      widget.onLevelComplete(currentGrade, true);
    } else {
      resultMsg = "Good effort! You stay at Grade $grade.";
      resultEmoji = "⭐";
      resultColor = const Color(0xFF4A90E2);
      doraImage = 'assets/dora_smiling.jpg';
      widget.onLevelComplete(currentGrade, false);
    }

    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        child: Container(
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.white, resultColor.withOpacity(0.2)],
            ),
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: resultColor, width: 4),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Dora Result Image
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: resultColor, width: 4),
                  boxShadow: [
                    BoxShadow(
                      color: resultColor.withOpacity(0.4),
                      blurRadius: 15,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: ClipOval(
                  child: Image.asset(
                    doraImage,
                    fit: BoxFit.cover,
                    errorBuilder: (ctx, err, st) => Icon(
                      passed ? Icons.celebration : Icons.face,
                      size: 60,
                      color: resultColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Text(
                resultEmoji,
                style: const TextStyle(fontSize: 40),
              ),
              const SizedBox(height: 10),
              Text(
                "ADVENTURE COMPLETE!",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: resultColor,
                  fontFamily: 'ComicNeue',
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: const Color(0xFF4A90E2), width: 2),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildStatItem("✅ Correct", correctCount, Colors.green),
                        _buildStatItem("❌ Wrong", wrongCount, Colors.red),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                resultMsg,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade800,
                  fontFamily: 'ComicNeue',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Main Menu Button
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const WelcomeScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4A90E2),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    icon: const Icon(Icons.home, size: 16, color: Colors.white),
                    label: const Text(
                      'MENU',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'ComicNeue',
                      ),
                    ),
                  ),

                  // Continue Button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      setState(() {
                        questionCount = 0;
                        correctCount = 0;
                        wrongCount = 0;
                        feedback = "";
                        _generateQuestion();
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF7ED321),
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Text(
                      'CONTINUE',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'ComicNeue',
                      ),
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

  Widget _buildStatItem(String label, int value, Color color) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey.shade700,
            fontFamily: 'ComicNeue',
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          '$value',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            fontFamily: 'ComicNeue',
            color: color,
          ),
        ),
      ],
    );
  }

  void _resetGame() {
    _timer?.cancel();
    setState(() {
      grade = widget.startingGrade;
      questionCount = 0;
      correctCount = 0;
      wrongCount = 0;
      feedback = "";
      _generateQuestion();
    });
  }

  void _startTimer() {
    _timer?.cancel();
    timeLeft = _getTimeLimit();
    isTimeUp = false;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timeLeft > 0) {
        setState(() {
          timeLeft--;
        });
      } else {
        timer.cancel();
        setState(() {
          isTimeUp = true;
          wrongCount++;
          feedback = "⏰ Time's up! Answer: ${num1 - num2}";
          questionCount++;
        });
        Future.delayed(const Duration(milliseconds: 1200), () {
          if (mounted) {
            setState(() => feedback = "");
            if (questionCount == 10) {
              _showLevelResult();
            } else {
              _generateQuestion();
            }
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pulseController.dispose();
    _answerController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isMobile = screenSize.width < 768;
    final isTablet = screenSize.width >= 768 && screenSize.width < 1024;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF4A90E2),
              Color(0xFFF8E71C),
              Color(0xFF7ED321),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  vertical: isMobile ? 12 : 15,
                  horizontal: isMobile ? 16 : 20,
                ),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF4A90E2),
                      Color(0xFF7ED321),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.orange.withOpacity(0.4),
                      blurRadius: 10,
                      spreadRadius: 3,
                    ),
                  ],
                ),
                child: isMobile 
                    ? _buildGameMobileHeader(isMobile)
                    : _buildGameDesktopHeader(isTablet),
              ),

              // Dora Message
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                color: Colors.white.withOpacity(0.2),
                child: Text(
                  doraMessage,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'ComicNeue',
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              // Info Bar
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  vertical: isMobile ? 8 : 12,
                  horizontal: 12,
                ),
                color: const Color(0xFF4A90E2).withOpacity(0.3),
                child: Wrap(
                  alignment: WrapAlignment.spaceEvenly,
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    _buildInfoChip('GRADE', '$grade', const Color(0xFF7ED321), isMobile),
                    _buildInfoChip('Q', '${questionCount + 1}/10', const Color(0xFFF8E71C), isMobile),
                    _buildInfoChip('✅', '$correctCount', Colors.green, isMobile),
                    _buildInfoChip('❌', '$wrongCount', Colors.red, isMobile),
                  ],
                ),
              ),

              // Main Game Content
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom + 16,
                  ),
                  child: Center(
                    child: Container(
                      width: isMobile ? screenSize.width * 0.95 : 600,
                      margin: const EdgeInsets.all(16),
                      padding: EdgeInsets.all(isMobile ? 20 : 30),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFFF8E71C).withOpacity(0.4),
                            blurRadius: 20,
                            spreadRadius: 5,
                          ),
                        ],
                        border: Border.all(color: const Color(0xFFF8E71C), width: 4),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Timer
                          ScaleTransition(
                            scale: timeLeft <= 5
                                ? _pulseAnimation
                                : const AlwaysStoppedAnimation(1.0),
                            child: Container(
                              padding: EdgeInsets.all(isMobile ? 12 : 18),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: RadialGradient(
                                  colors: timeLeft <= 5
                                      ? [Colors.red, Colors.red.shade900]
                                      : [Color(0xFF4A90E2), Color(0xFF7ED321)],
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: (timeLeft <= 5 ? Colors.red : Color(0xFF4A90E2))
                                        .withOpacity(0.6),
                                    blurRadius: 20,
                                    spreadRadius: 5,
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.timer,
                                    color: Colors.white,
                                    size: isMobile ? 30 : 40,
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    '$timeLeft',
                                    style: TextStyle(
                                      fontSize: isMobile ? 28 : 36,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontFamily: 'ComicNeue',
                                    ),
                                  ),
                                  Text(
                                    'sec',
                                    style: TextStyle(
                                      fontSize: isMobile ? 10 : 14,
                                      color: Colors.white,
                                      fontFamily: 'ComicNeue',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          SizedBox(height: isMobile ? 20 : 30),

                          // Question
                          Container(
                            padding: EdgeInsets.all(isMobile ? 16 : 20),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color(0xFFF8E71C), Color(0xFF7ED321)],
                              ),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: const Color(0xFF4A90E2), width: 3),
                            ),
                            child: Text(
                              '$num1 - $num2 = ?',
                              style: TextStyle(
                                fontSize: isMobile ? 36 : 48,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontFamily: 'ComicNeue',
                              ),
                            ),
                          ),

                          SizedBox(height: isMobile ? 20 : 30),

                          // Feedback
                          if (feedback.isNotEmpty)
                            Container(
                              padding: EdgeInsets.all(isMobile ? 12 : 16),
                              margin: EdgeInsets.only(bottom: isMobile ? 10 : 15),
                              decoration: BoxDecoration(
                                color: feedback.contains("Correct") 
                                    ? Colors.green.shade100 
                                    : Colors.red.shade100,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: feedback.contains("Correct") 
                                      ? Colors.green 
                                      : Colors.red,
                                  width: 2,
                                ),
                              ),
                              child: Text(
                                feedback,
                                style: TextStyle(
                                  fontSize: isMobile ? 16 : 20,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'ComicNeue',
                                  color: feedback.contains("Correct") 
                                      ? Colors.green.shade800 
                                      : Colors.red.shade800,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),

                          // Answer Input
                          Container(
                            width: isMobile ? 180 : 220,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0xFFF8E71C).withOpacity(0.3),
                                  blurRadius: 10,
                                  spreadRadius: 2,
                                ),
                              ],
                            ),
                            child: TextField(
                              key: const Key('answerField'),
                              controller: _answerController,
                              focusNode: _focusNode,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: isMobile ? 24 : 32,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'ComicNeue',
                              ),
                              decoration: InputDecoration(
                                labelText: "Your Answer",
                                labelStyle: const TextStyle(
                                  color: Color(0xFF4A90E2),
                                  fontFamily: 'ComicNeue',
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(color: Color(0xFFF8E71C), width: 3),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(color: Color(0xFFF8E71C), width: 3),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(color: Color(0xFF7ED321), width: 3),
                                ),
                              ),
                              onSubmitted: (_) => _checkAnswer(),
                            ),
                          ),

                          SizedBox(height: isMobile ? 20 : 30),

                          // Submit Button
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0xFF7ED321).withOpacity(0.4),
                                  blurRadius: 15,
                                  spreadRadius: 2,
                                ),
                              ],
                            ),
                            child: ElevatedButton(
                              onPressed: _checkAnswer,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF7ED321),
                                padding: EdgeInsets.symmetric(
                                  horizontal: isMobile ? 40 : 60,
                                  vertical: isMobile ? 16 : 20,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                elevation: 8,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.check_circle,
                                    size: isMobile ? 24 : 30,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: isMobile ? 8 : 12),
                                  Text(
                                    'CHECK ANSWER',
                                    style: TextStyle(
                                      fontSize: isMobile ? 16 : 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontFamily: 'ComicNeue',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          SizedBox(height: isMobile ? 10 : 15),

                          // Reset, Main Menu and Exit Buttons
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: _resetGame,
                                child: Text(
                                  'Reset Game',
                                  style: TextStyle(
                                    fontSize: isMobile ? 14 : 16,
                                    color: const Color(0xFF4A90E2),
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'ComicNeue',
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(builder: (context) => const WelcomeScreen()),
                                  );
                                },
                                child: Text(
                                  'Main Menu',
                                  style: TextStyle(
                                    fontSize: isMobile ? 14 : 16,
                                    color: const Color(0xFF4A90E2),
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'ComicNeue',
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              TextButton(
                                onPressed: _openWebsite,
                                child: Text(
                                  'Exit to Gamify',
                                  style: TextStyle(
                                    fontSize: isMobile ? 14 : 16,
                                    color: const Color(0xFF4A90E2),
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'ComicNeue',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGameMobileHeader(bool isMobile) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Main Menu Button
        IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const WelcomeScreen()),
            );
          },
          icon: const Icon(Icons.home, color: Colors.white, size: 20),
        ),
        
        // Title
        Expanded(
          child: Column(
            children: [
              Text(
                'DORA MATH',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'ComicNeue',
                ),
              ),
              Text(
                'Grade $grade • Subtraction',
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontFamily: 'ComicNeue',
                ),
              ),
            ],
          ),
        ),
        
        // Exit button
        IconButton(
          onPressed: _openWebsite,
          icon: const Icon(Icons.exit_to_app, color: Colors.white, size: 20),
        ),
      ],
    );
  }
  
  Widget _buildGameDesktopHeader(bool isTablet) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Main Menu Button
        ElevatedButton.icon(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const WelcomeScreen()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF4A90E2),
          ),
          icon: const Icon(Icons.home, size: 16, color: Colors.white),
          label: const Text(
            'MENU',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'ComicNeue',
            ),
          ),
        ),
        
        // Title
        Column(
          children: [
            Text(
              'DORA SUBTRACTION ADVENTURE',
              style: TextStyle(
                fontSize: isTablet ? 20 : 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'ComicNeue',
              ),
            ),
            Text(
              'Grade $grade • ${_getDifficultyText(grade)}',
              style: TextStyle(
                fontSize: isTablet ? 14 : 16,
                color: Colors.white,
                fontFamily: 'ComicNeue',
              ),
            ),
          ],
        ),
        
        // Exit button
        ElevatedButton.icon(
          onPressed: _openWebsite,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF4A90E2),
          ),
          icon: const Icon(Icons.exit_to_app, size: 16, color: Colors.white),
          label: const Text(
            'EXIT',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'ComicNeue',
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoChip(String label, String value, Color color, bool isMobile) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 12 : 16, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color, width: 2),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: isMobile ? 12 : 14,
              fontWeight: FontWeight.bold,
              color: color,
              fontFamily: 'ComicNeue',
            ),
          ),
          const SizedBox(width: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: isMobile ? 14 : 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade800,
              fontFamily: 'ComicNeue',
            ),
          ),
        ],
      ),
    );
  }

  String _getDifficultyText(int grade) {
    if (grade <= 10) return 'EASY';
    if (grade <= 20) return 'MEDIUM';
    return 'HARD';
  }
}