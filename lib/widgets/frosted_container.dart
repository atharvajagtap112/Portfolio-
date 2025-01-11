import 'dart:ui';

import 'package:flutter/material.dart';

class FrostedContainer extends StatelessWidget {
  const FrostedContainer({super.key, required this.height,required this.width, this.child,  this.onTap});
final height;
final width;
 final child;
 final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: onTap,
      child: ClipRect( // these will prevent the blur to apply to full screen
        child: Stack(children: [
               BackdropFilter(filter: 
               ImageFilter.blur(sigmaX: 7, sigmaY: 7),
               child: SizedBox(height:height ,width:  width ),
               ),
               Container(
                
        
                height: height,
                width: width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                   gradient: LinearGradient(colors: [
                    Colors.white.withOpacity(0.5) , 
                    Colors.white.withOpacity(0.2)])
                ),
                child: child,
               )
        ],),
      ),
    );
  }
}