
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/Providers/current_state.dart';
import 'package:portfolio/Screen/phone_home_screen.dart';
import 'package:provider/provider.dart';



class ScreenWrapper extends StatelessWidget {
  final Widget childG;
  const ScreenWrapper({super.key, required this.childG});
  
  @override
  Widget build(BuildContext context) {
    // Remove the listen: false provider here since we want to listen to all changes
    return Consumer<CurrentState>(
      builder: (context, currentState, _) => Column(
        children: [
          // Appbar section
          if (!currentState.isMainScreen)
            Container(
              width: double.infinity,
              decoration: BoxDecoration(color: currentState.defaultColor),
              padding: const EdgeInsets.only(top: 30),
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      
                      currentState.title ?? "",
                      style: GoogleFonts.inter(fontSize: 18, color: currentState.defaultColor==Colors.white? Colors.black  :  Colors.white),
                    ),
                    IconButton(
                      icon:  Icon(
                        Icons.close,
                        color:  currentState.defaultColor==Colors.white? Colors.black  :  Colors.white,
                      ),
                      onPressed: () {
                        currentState.changeScreen(
                          const PhoneHomeScreen(),
                          true,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          Expanded(
            child: Container(
              child: childG,
            ),
          ),
        ],
      ),
    );
  }
}