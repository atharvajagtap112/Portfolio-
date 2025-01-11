import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/Providers/theme_provider.dart';
import 'package:portfolio/const/data.dart';
import 'package:portfolio/widgets/frosted_container.dart';
import 'package:provider/provider.dart';

class QuotesWidget extends StatelessWidget {
  const QuotesWidget({super.key});
 
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
  
   ThemeProvider theme = Provider.of<ThemeProvider>(context, listen: false);
    theme.size = MediaQuery.of(context).size;
    theme.widthRatio = theme.size.width / baseWidth;
    theme.heightRatio = theme.size.height / baseHeight;
      
    return    Transform(
                              transform: Matrix4.identity()
                                ..setEntry(3, 2, 0.00999)
                                ..rotateY(0.06),
                              alignment: Alignment.topCenter,
                              child: Container(
                                margin:
                                    const EdgeInsets.only(top: 0, bottom: 10),
                                child: FrostedContainer (
                                  height: 175.5 * theme.heightRatio,
                                  width: 245 * theme.widthRatio,
                                  child: Center(
                                    child: Container(
                                      margin: const EdgeInsets.all(10),
                                      padding:
                                          EdgeInsets.all(10 * theme.widthRatio),
                                      child: Center(
                                          child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          AutoSizeText(
                                            '"Don\'t run after success run after perfection success will follow."',
                                            style: GoogleFonts.inter(
                                                // fontSize: 30,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w400),
                                            maxFontSize: 25,
                                            minFontSize: 10,
                                            maxLines: 3,
                                          ),
                                          Align(
                                              alignment: Alignment.bottomRight,
                                              child: AutoSizeText(
                                                '-Baba Ranchhoddas',
                                                style: GoogleFonts.inter(
                                                    // fontSize: 12,
                                                    color: Colors.white
                                                        .withOpacity(0.6),
                                                    fontWeight:
                                                        FontWeight.w400),
                                                maxFontSize: 12,
                                                minFontSize: 6,
                                                maxLines: 1,
                                              )),
                                        ],
                                      )),
                                    ),
                                  ).animate().fadeIn(
                                      delay: 1.seconds, duration: .7.seconds),
                                ),
                              ),
                            );
                       
  }
}