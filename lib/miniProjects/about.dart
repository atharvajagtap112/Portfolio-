import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/const/data.dart';

class ParticleModel {
  Offset position;
  Color color;
  double speed;
  double size;
  double angle;

  ParticleModel({
    required this.position,
    required this.color,
    required this.speed,
    required this.size,
    required this.angle,
  });
}

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<ParticleModel> particles = [];
  final Random random = Random();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();

    // Initialize particles
    for (int i = 0; i < 50; i++) {
      particles.add(
        ParticleModel(
          position: Offset(
            random.nextDouble() * 1200,
            random.nextDouble() * 800,
          ),
          color: Colors.blue.withOpacity(0.3),
          speed: 1 + random.nextDouble() * 2,
          size: 2 + random.nextDouble() * 3,
          angle: random.nextDouble() * 2 * pi,
        ),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A1930),
      body: Stack(
        children: [
          // Animated background particles
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              for (var particle in particles) {
                particle.position = Offset(
                  (particle.position.dx + cos(particle.angle) * particle.speed) % 1200,
                  (particle.position.dy + sin(particle.angle) * particle.speed) % 800,
                );
              }
              return CustomPaint(
                painter: ParticlePainter(particles),
                size: const Size(1200, 800),
              );
            },
          ),
          // Main content
          SingleChildScrollView(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 1200),
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Column(
                children: [
                  // Glass morphism card
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.white.withOpacity(0.1),
                          Colors.white.withOpacity(0.05),
                        ],
                      ),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.2),
                        width: 1,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 20,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        // Profile section
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            // Rotating rings
                            ...List.generate(3, (index) {
                              return Container(
                                width: 200 + (index * 40).toDouble(),
                                height: 200 + (index * 40).toDouble(),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.blue.withOpacity(0.1),
                                    width: 2,
                                  ),
                                ),
                              ).animate(
                                onPlay: (controller) => controller.repeat(),
                              ).rotate(
                                duration: Duration(seconds: 10 + (index * 5)),
                                begin: 0,
                                end: 2 * pi,
                              );
                            }),
                            // Profile picture with glow
                            Container(
                              width: 200,
                              height: 200,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.blue.withOpacity(0.3),
                                    blurRadius: 30,
                                    spreadRadius: 10,
                                  ),
                                ],
                              ),
                              child: ClipOval(
                                child: Image.asset(
                                  'assets/images/profile_picture.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 30),
                        // Name with modern tech style
                        Container(
                          width: 300,
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                          decoration: BoxDecoration(
                            color: Colors.blue.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child:const Center(
                            child: Text(
                              "Atharva Jagtap",
                              style:TextStyle(
                                fontFamily: "MinecraftSevenV2",
                                fontSize: 33,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                letterSpacing: 1.2,
                              ),
                            ),
                          ),
                         ).animate().slideX(
                          duration: const Duration(milliseconds: 800),
                          curve: Curves.easeOut,
                          begin: -0.2,
                          end: 0,
                        ).then().slideY(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeOut,
                          begin: -0.1,
                          end: 0,
                        ),
                        const SizedBox(height: 30),
                        // Role/title with typing effect
                        
                    
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                            introduction,
                            style: GoogleFonts.openSans(
                              fontSize: 16,
                              color: Colors.white.withOpacity(0.9),
                              height: 1.8,
                              letterSpacing: 0.5,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ).animate().fadeIn(
                          duration: const Duration(milliseconds: 800),
                          delay: const Duration(milliseconds: 800),
                        ),
                        const SizedBox(height: 40),
                        // Tech stack chips
                      
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ParticlePainter extends CustomPainter {
  final List<ParticleModel> particles;

  ParticlePainter(this.particles);

  @override
  void paint(Canvas canvas, Size size) {
    for (var particle in particles) {
      final paint = Paint()
        ..color = particle.color
        ..style = PaintingStyle.fill;
      
      canvas.drawCircle(particle.position, particle.size, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}