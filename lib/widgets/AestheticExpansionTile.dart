import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/models/experience_model.dart';

class TechAestheticExpansionTile extends StatefulWidget {
  final JobExperience experience;
  
  const TechAestheticExpansionTile({
    super.key,
    required this.experience,
  });

  @override
  State<TechAestheticExpansionTile> createState() => _TechAestheticExpansionTileState();
}

class _TechAestheticExpansionTileState extends State<TechAestheticExpansionTile> 
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _heightFactor;
  bool _isExpanded = false;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _heightFactor = _controller.drive(CurveTween(curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF1A1A2E),
              Color(0xFF16213E),
            ],
          ),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: widget.experience.color.withOpacity(_isHovered ? 0.5 : 0.2),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: widget.experience.color.withOpacity(0.1),
              blurRadius: _isHovered ? 30 : 20,
              spreadRadius: _isHovered ? 2 : 0,
              offset: const Offset(0, 10),
            ),
            if (_isHovered)
              BoxShadow(
                color: widget.experience.color.withOpacity(0.15),
                blurRadius: 50,
                spreadRadius: -5,
                offset: const Offset(0, -5),
              ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: _handleTap,
              splashColor: widget.experience.color.withOpacity(0.1),
              highlightColor: widget.experience.color.withOpacity(0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header Section with tech aesthetic
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      children: [
                        // Animated glowing line
                        Stack(
                          children: [
                            // Glow effect
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              width: 7,
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3.5),
                                boxShadow: [
                                  BoxShadow(
                                    color: widget.experience.color.withOpacity(_isHovered ? 0.4 : 0.2),
                                    blurRadius: 15,
                                    spreadRadius: 1,
                                  ),
                                ],
                              ),
                            ),
                            // Main line
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              width: 3,
                              height: 80,
                              margin: const EdgeInsets.symmetric(horizontal: 2),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    widget.experience.color,
                                    widget.experience.color.withOpacity(0.3),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(1.5),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      widget.experience.title,
                                      style: TextStyle(
                                        fontFamily: "MinecraftSevenV2",
                                        fontSize: 20,
                                        
                                        color: Colors.white.withOpacity(0.9),
                                         letterSpacing: 0.5,
                                      ),
                                      // style: GoogleFonts.spaceMono(
                                      //   fontSize: 20,
                                      //   fontWeight: FontWeight.bold,
                                      //   color: Colors.white.withOpacity(0.9),
                                      //   letterSpacing: 0.5,
                                      // ),
                                    ),
                                  ),
                                  AnimatedRotation(
                                    duration: const Duration(milliseconds: 300),
                                    turns: _isExpanded ? 0.25 : 0,
                                    child: Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        color: widget.experience.color.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Icon(
                                        Icons.chevron_right,
                                        color: widget.experience.color,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(
                                widget.experience.company,
                                style: GoogleFonts.robotoMono(
                                  fontSize: 16,
                                  color: widget.experience.color.withOpacity(0.8),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Container(
                                width: 500,
                                padding: const EdgeInsets.symmetric(vertical: 6,horizontal: 2),
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: widget.experience.color.withOpacity(0.2),
                                    width: 1,
                                  ),
                                ),

                                //Job date and Place
                                child: Row(
                                 
                                  children: [
                                    Icon(
                                      Icons.calendar_today,
                                      size: 14,
                                      color: widget.experience.color.withOpacity(0.7),
                                    ),
                                    const SizedBox(width: 6),
                                    Text(
                                      '${widget.experience.startDate} - ${widget.experience.endDate}',
                                      style: GoogleFonts.robotoMono(
                                        fontSize: 14,
                                        color: Colors.white.withOpacity(0.7),
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Icon(
                                      Icons.location_on,
                                      size: 14,
                                      color: widget.experience.color.withOpacity(0.7),
                                    ),
                                    const SizedBox(width: 6),
                                    Text(
                                      widget.experience.location,
                                      style: GoogleFonts.robotoMono(
                                        fontSize: 14,
                                        color: Colors.white.withOpacity(0.7),
                                      ),
                                      overflow: TextOverflow.fade,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Animated Content Section
                  ClipRect(
                    child: AnimatedBuilder(
                      animation: _heightFactor,
                      builder: (context, child) {
                        return SizeTransition(
                          sizeFactor: _heightFactor,
                          child: child,
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.only(
                          left: 43,
                          right: 20,
                          bottom: 20,
                        ),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              widget.experience.color.withOpacity(0.03),
                            ],
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: widget.experience.bulletPoints.map((point) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(top: 8),
                                    width: 6,
                                    height: 6,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: widget.experience.color.withOpacity(0.7),
                                      boxShadow: [
                                        BoxShadow(
                                          color: widget.experience.color.withOpacity(0.3),
                                          blurRadius: 8,
                                          spreadRadius: 1,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Text(
                                      point,
                                      style: GoogleFonts.robotoMono(
                                        fontSize: 15,
                                        height: 1.5,
                                        color: Colors.white.withOpacity(0.7),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}