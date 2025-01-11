import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/const/data.dart';
import 'package:rive/rive.dart';
import 'dart:io';

class Skills extends StatelessWidget {
  const Skills({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A1930),
      body: SingleChildScrollView(
        child: Stack(
          
          children: [
            const Positioned(
              top: -30,
              left: -10,
              child: SizedBox(
                height: 180, 
                width: 180,
                child: RiveAnimation.asset("assets/rive/robot.riv", )),
            ),
            Column(children: [  
             const SizedBox(height: 85,),
            // Technical Skills Section
            Center(
              child: Container(
                margin: const EdgeInsets.only(bottom: 40),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 15,
                  runSpacing: 15,
                  children: List.generate(
                    skills.length,
                    (index) => SkillCard(
                      skill: skills[index],
                      index: index,
                    ),
                  ),
                ),
              ),
            ),
        
            // Languages Section
            Container(
              margin: const EdgeInsets.symmetric(vertical: 30),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: Colors.blue.withOpacity(0.3),
                      ),
                    ),
                    child: Text(
                      "Languages I Speak",
                      style: GoogleFonts.firaCode(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ).animate().fadeIn(
                    duration: const Duration(milliseconds: 600),
                    delay: const Duration(milliseconds: 400),
                  ),
                  const SizedBox(height: 30),
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 15,
                    runSpacing: 15,
                    children: List.generate(
                      languages.length,
                      (index) => LanguageCard(
                        language: languages[index],
                        index: index,
                      ),
                    ),
                  ),
                ],
              ),
            )],)
            // Title Section
          ,
          ],
        ),
      ),
    );
  }
}

class SkillCard extends StatefulWidget {
  final dynamic skill;
  final int index;

  const SkillCard({
    super.key,
    required this.skill,
    required this.index,
  });

  @override
  State<SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<SkillCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
          color: isHovered 
              ? widget.skill.colorS.withOpacity(0.2) 
              : Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: widget.skill.colorS.withOpacity(isHovered ? 0.8 : 0.3),
            width: isHovered ? 2 : 1,
          ),
          boxShadow: isHovered
              ? [
                  BoxShadow(
                    color: widget.skill.colorS.withOpacity(0.3),
                    blurRadius: 12,
                    spreadRadius: 2,
                  )
                ]
              : [],
        ),
        child: Container(
          constraints: const BoxConstraints(minWidth: 100),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.skill.iconPath != null) ...[
                Icon(
                  Icons.code,
                  color: widget.skill.colorS,
                  size: 20,
                ),
                const SizedBox(width: 10),
              ],
              Text(
                widget.skill.skillName,
                style: GoogleFonts.firaCode(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ).animate().scale(
        duration: const Duration(milliseconds: 600),
        delay: Duration(milliseconds: 100 * widget.index),
        curve: Curves.easeOut,
      ),
    );
  }
}

class LanguageCard extends StatefulWidget {
  final dynamic language;
  final int index;

  const LanguageCard({
    super.key,
    required this.language,
    required this.index,
  });

  @override
  State<LanguageCard> createState() => _LanguageCardState();
}

class _LanguageCardState extends State<LanguageCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
          color: isHovered 
              ? widget.language.colorS.withOpacity(0.2) 
              : Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: widget.language.colorS.withOpacity(isHovered ? 0.8 : 0.3),
            width: isHovered ? 2 : 1,
          ),
          boxShadow: isHovered
              ? [
                  BoxShadow(
                    color: widget.language.colorS.withOpacity(0.3),
                    blurRadius: 12,
                    spreadRadius: 2,
                  )
                ]
              : [],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.language.iconPath != null) ...[
              Icon(
                Icons.language,
                color: widget.language.colorS,
                size: 20,
              ),
              const SizedBox(width: 10),
            ],
            Text(
              widget.language.skillName,
              style: GoogleFonts.firaCode(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ).animate().scale(
        duration: const Duration(milliseconds: 600),
        delay: Duration(milliseconds: 100 * widget.index),
        curve: Curves.easeOut,
      ),
    );
  }
}