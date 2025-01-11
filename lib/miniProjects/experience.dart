import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/animation_widgets.dart/background_grid_motion.dart';
import 'package:portfolio/const/data.dart';
import 'package:portfolio/models/experience_model.dart';
import 'package:portfolio/widgets/AestheticExpansionTile.dart';
import 'package:portfolio/widgets/background_orbital_star.dart';
import 'package:rive/rive.dart';

class Experience extends StatefulWidget {
  const Experience({super.key});

  @override
  State<Experience> createState() => _ExperienceState();
}

class _ExperienceState extends State<Experience> {
  // Key to force rebuild the Rive widget
  // Key _riveKey = UniqueKey();
  // Timer? _timer;

  // @override
  // void initState() {
  //   super.initState();
  //   // Set up timer to reload every 5 seconds
  //   _timer = Timer.periodic(Duration(seconds: 5), (timer) {
  //     setState(() {
  //       _riveKey = UniqueKey(); // Create new key to force rebuild
  //     });
  //   });
  // }

  // @override
  // void dispose() {
  //   _timer?.cancel(); // Cancel timer when widget is disposed
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

           CosmicBackground(),
            
          SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: jobExperiences.length,
                  itemBuilder: (context, index) {
                    JobExperience experience1 = jobExperiences[index];
                    return TechAestheticExpansionTile(experience: experience1,);

                  }
                ),
              ],
            ),
          ),
        ]
      )
    );
  }
}