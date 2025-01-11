import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/animation_widgets.dart/book_animation.dart';
import 'package:portfolio/const/data.dart';


class Education extends StatelessWidget {
  const Education({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFF8F9FA),
                  Color(0xFFE9ECEF),
                ],
              ),
            ),
          ),
          
          Positioned(
            right: -120,
            bottom: -250,
            child: SizedBox(
              height: 800,
              width: 800,
              child: BookAnimation()
            ),
          ),
           
          ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            shrinkWrap: true,
            itemCount: education.length,
            itemBuilder: (context, index) {
              final experience = education[index];
              return Container(
                margin: EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: experience.color.withOpacity(0.2),
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: experience.color.withOpacity(0.08),
                      blurRadius: 20,
                      spreadRadius: 2,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Theme(
                  data: Theme.of(context).copyWith(
                    dividerColor: Colors.transparent,
                  ),
                  child: ExpansionTile(
                    tilePadding: EdgeInsets.all(10),
                    childrenPadding: EdgeInsets.all(10),
                    leading: Container(
                      width: 4,
                      height: 100,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            experience.color,
                            experience.color.withOpacity(0.3),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(2),
                        boxShadow: [
                          BoxShadow(
                            color: experience.color.withOpacity(0.3),
                            blurRadius: 8,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                    ),
                    title: Text(
                      experience.title,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Color(0xFF2D3436),
                      ),
                    ),
                    subtitle: Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            experience.company,
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              color: experience.color.withOpacity(0.8),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 5),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 6),
                            decoration: BoxDecoration(
                              color: experience.color.withOpacity(0.08),
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                color: experience.color.withOpacity(0.2),
                                width: 1,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.calendar_today,
                                  size: 14,
                                  color: experience.color.withOpacity(0.8),
                                ),
                                SizedBox(width: 6),
                                Text(
                                  '${experience.startDate} - ${experience.endDate}',
                                  style: GoogleFonts.poppins(
                                    fontSize: 13,
                                    color: experience.color.withOpacity(0.8),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Icon(
                                  Icons.location_on,
                                  size: 14,
                                  color: experience.color.withOpacity(0.8),
                                ),
                                SizedBox(width: 2),
                                SizedBox(
                                  width: 42,
                                  child: Text(
                                    experience.location,
                                    style: GoogleFonts.poppins(
                                      fontSize: 13,
                                      color: experience.color.withOpacity(0.8),
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    children: experience.bulletPoints.map((bulletPoint) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 15, left: 15),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 8),
                              width: 6,
                              height: 6,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: experience.color,
                                boxShadow: [
                                  BoxShadow(
                                    color: experience.color.withOpacity(0.3),
                                    blurRadius: 4,
                                    spreadRadius: 1,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 15),
                            Expanded(
                              child: Text(
                                bulletPoint,
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  height: 1.5,
                                  letterSpacing: 0.3,
                                  color: Color(0xFF2D3436).withOpacity(0.9),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              );
            }
          ),
        ],
      ),
    );
  }
}