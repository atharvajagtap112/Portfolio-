import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/Models/app_model.dart';
import 'package:portfolio/Models/colors_model.dart';
import 'package:portfolio/Models/device_model.dart';
import 'package:portfolio/Models/education_model.dart';
import 'package:portfolio/Models/project_model.dart';
import 'package:portfolio/Models/skill_model.dart';
import 'package:portfolio/miniProjects/about.dart';
import 'package:portfolio/miniProjects/education.dart';


import 'package:portfolio/miniProjects/experience.dart';
import 'package:portfolio/miniProjects/project.dart';
import 'package:portfolio/miniProjects/skills.dart';
import 'package:portfolio/models/experience_model.dart';
const double baseHeight = 790;
const double baseWidth = 1440;
class Data {

  static List<ProjectModel> projects = [
    ProjectModel(
      title: 'T Store (ECommerce App)',
      techStack: ['Flutter', 'Firebase', 'Getx', 'Get Storage', ],
      gitHubRepo: 'https://github.com/atharvajagtap112/TStore',
      description: 'T Store is a fully functional e-commerce app built using Flutter, featuring Razorpay integration for secure payments.',
      videoLink: 'https://youtu.be/zS_XR773M0g?si=6yxSOO-HV1xmuRUR',
      imageUrl: 'assets/portfolio_preview.png',
      duration: '2 months',
    ),
     ProjectModel(
      title: 'Meals App',
      techStack: ['Flutter', 'Firebase', 'Riverpod', ],
      gitHubRepo: 'https://github.com/atharvajagtap112/meals_app',
      description: 'Created a Flutter app that provides a list of meal recipes, featuring animations, favorite meal options, and custom filters for personalized meal recommendations',
      videoLink: '',
      imageUrl: 'assets/portfolio_preview.png',
      duration: '2 months',
    ),
     ProjectModel(
      title: 'Chat App',
      techStack: ['Flutter', 'Firebase', ],
      gitHubRepo: 'https://github.com/atharvajagtap112/chat_app',
      description: 'Created a Flutter app that provides a list of meal recipes, featuring animations, favorite meal options, and custom filters for personalized meal recommendations',
      videoLink: '',
      imageUrl: 'assets/portfolio_preview.png',
      duration: '2 months',
    ),
    // Add more projects here
  ];   

  static List<DeviceModel> deviceModellist =[  
    DeviceModel(icon: Icons.android, deviceInfo: Devices.android.onePlus8Pro),
     DeviceModel(icon: Icons.apple ,deviceInfo: Devices.ios.iPhone13),
      DeviceModel(icon: Icons.tablet, deviceInfo: Devices.ios.iPad),
  ];

 static List<ColorModel> colorPalette = [
  ColorModel(
    svgPath: "assets/images/cloudRed.svg",
    color: Colors.yellowAccent,
    gradient: const LinearGradient(
      begin: Alignment.bottomLeft,
      // transform: Grad,
      end: Alignment.topRight,
      colors: [Colors.yellowAccent, Colors.deepOrange],
    ),
  ),
  ColorModel(
    svgPath: "assets/images/cloudyBlue.svg",
    color: Colors.blue,
    gradient: const LinearGradient(
      begin: Alignment.topLeft,
      colors: [Colors.blue, Colors.black45],
    ),
  ),
  ColorModel(
      svgPath: "assets/images/cloudyBlue.svg",
      color: const Color(0xff00d6ca),
      gradient: const LinearGradient(
        colors: [Color(0xff00ebd5), Color(0xff293474)],
        stops: [0, 1],
        begin: Alignment.bottomRight,
        end: Alignment.topLeft,
      )),
  ColorModel(
    svgPath: "assets/images/cloudyBlue.svg",
    color: const Color(0xff123cd1),
    gradient: const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment(-0.31, 0.95),
      colors: [Color(0xFF1042F4), Color(0x00203EA6)],
    ),
  ),
  ColorModel(
    svgPath: "assets/images/cloudyBlue.svg",
    color: Colors.purple,
    gradient: const LinearGradient(
      colors: [Color(0xffc95edb), Colors.black12],
      stops: [0, 1],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  ),
  ColorModel(
    svgPath: "assets/images/cloudyBlue.svg",
    color: const Color(0xfff35a32),
    gradient: const LinearGradient(
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      colors: [Colors.indigo, Colors.deepOrange], // Adjust colors as needed
    ),
  ),
];
}
final List<EducationModel> education = [
  EducationModel(
    color: Colors.red,
    location: "Pune, MAHARASHTRA",
    title: 'Computer Engineering',
    company: 'D.Y. Patil College of Engineering, Akurdi',
    startDate: 'June 2023',
    endDate: 'Present',
    bulletPoints: [
      "Currently pursuing B.Tech in Computer Engineering",
      "Focusing on core subjects like Data Structures, Algorithms, and Object-Oriented Programming",
      "Active member of college's technical community",
    ],
    logoPath: 'assets/images/dyp_logo.png',  // Add your college logo
    grade: '9.2 CGPA',  // Add your actual grade
    degree: 'B.Tech',
    skills: [
      'C++',
      'Java',
      'Data Structures',
      'Algorithms',
      'Object-Oriented Programming',
    ],
    isCurrently: true,
  ),
  EducationModel(
    color: Colors.blue,
    location: "Pune, MAHARASHTRA",
    title: 'Higher Secondary Education (HSC)',
    company: 'Shree Samarth Jr college Pune',
    startDate: 'June 2022',
    endDate: 'June 2023',
    bulletPoints: [
      'Completed HSC with focus on Physics, Chemistry, and Mathematics',
      'Participated in various academic competitions and workshops',
      'Developed strong foundation in science and mathematics',
    ],
    logoPath: 'assets/images/samarth_logo.png',  // Add your college logo
    grade: '85%',  // Add your actual grade
    degree: 'HSC Science',
    skills: [
      'Physics',
      'Chemistry',
      'Mathematics',
      'English',
    ],
    isCurrently: false,
  ),
  EducationModel(
    color: Colors.purple,
    location: "Pune, MAHARASHTRA",
    title: 'Secondary School Education (SSC)',
    company: 'Priyadarshini English Medium School',
    startDate: 'June 2019',
    endDate: 'June 2020',
    bulletPoints: [
      'Completed SSC with distinction',
      'Active participation in school activities and events',
      'Received recognition for academic excellence',
    ],
    logoPath: 'assets/images/priyadarshini_logo.png',  // Add your school logo
    grade: '92%',  // Add your actual grade
    degree: 'SSC',
    skills: [
      'Mathematics',
      'Science',
      'English',
      'Social Studies',
    ],
    isCurrently: false,
  ),
];

final List<JobExperience> jobExperiences = [
  JobExperience(
    color: Colors.blue,
    location: "Pune",
    title: 'Android Coordinator',
    company: 'Google Developer Student Clubs',
    startDate: 'Sept 2024',
    endDate: 'Present',
    bulletPoints: [
      "Assisted in Android development activities, fostering collaboration and guiding peers on tools and frameworks.",
      "Contributed to discussions and knowledge-sharing sessions, enabling efficient project building within the club. ",
      
    ],
  ),
  // Add more job experiences here...
  JobExperience(
    color: Colors.redAccent,
    location: "Pune",
    title: 'Gunner',
    company: 'Competitive Programmingand Mentorship Club.',
    startDate: 'Sept 2023',
    endDate: 'Present',
    bulletPoints: [
      "- Assisting students in developing their problem-solving skills and coding abilities.",
      "- Leet Code, Hacker Rank, Java.",

    ],
  ),
 
];

List<SkillsModel> skills = [
  SkillsModel(skillName: "Flutter", colorS: Colors.blue, iconPath: "random"),
  SkillsModel(
    skillName: "Firebase",
    colorS: Colors.yellow,
  ),
  SkillsModel(
    skillName: "Github",
    colorS: Colors.yellow,
  ),
  SkillsModel(
    skillName: "Dart",
    colorS: Colors.blue,
  ),
  SkillsModel(
    skillName: "Provider",
    colorS: Colors.orange,
  ),
  SkillsModel(
    skillName: "Riverpod",
    colorS: Colors.blue,
  ),
  SkillsModel(
    skillName: "Python",
    colorS: Colors.yellow,
  ),
  SkillsModel(
    skillName: "Java",
    colorS: Colors.orange,
  ),
  SkillsModel(
    skillName: "Firebase",
    colorS: Colors.deepPurple,
  ),
  SkillsModel(
    skillName: "REST API",
    colorS: Colors.yellow,
  ),

   SkillsModel(
    skillName: "C++",
    colorS: Colors.yellow,
  ),
   SkillsModel(
    skillName: "Git",
    colorS: Colors.black,
  ),
    SkillsModel(
    skillName: "Blender",
    colorS: Colors.red,
  ),
   SkillsModel(
    skillName: "Figma",
    colorS: Colors.orange,
  ),
  SkillsModel(
    skillName: "FLutter Flow",
    colorS: Colors.purple,
  ),
  
];


 
 final  List<AppModel> apps = [
  AppModel(
      title: "About",
      color: const Color(0xFF0A1930),
      icon: Icons.person,
      screen: const About()
      ),
  AppModel(
      title: "Skills",
      color: const Color(0xFF0A1930),
      icon: Icons.ac_unit_rounded,
      assetPath: "assets/icons/skill.svg",
    screen: const Skills()
      ),
  AppModel(
    title: "Youtube",
    assetPath: "assets/icons/youtube.svg",
    color: Colors.white,
    link: youtubeChannel,
  ),
  AppModel(
    title: "LinkedIn",
    assetPath: "assets/icons/linkedin.svg",
    color: Colors.white,
    link: linkedIn,
  ),
  AppModel(
    title: "X",
    assetPath: "assets/icons/x.svg",
    color: Colors.white,
    link: twitter,
  ),
 
  AppModel(
      title: "Experience",
      color :const Color(0xFF110B2B),
      icon: FontAwesomeIcons.idBadge,
      screen: const Experience()
      ),
  AppModel(
    title: "Education",
    color: Colors.white,
    icon: FontAwesomeIcons.edge,
   screen: const Education(),
  ),
  AppModel(

    title: "Github",
    assetPath: "assets/icons/github.svg",
    color: Colors.white,
    link: github,
  ),
   AppModel(

    title: "Resume",
    assetPath: "assets/icons/resume.svg",
    color: Colors.white,
    link: resumeLink,
  ),

   AppModel(
   
    title: "Gmail",
    assetPath: "assets/icons/gmail.svg",
    color: Colors.white,
    link: gmail,
  ),
   AppModel(
   
    title: "Projects",
    assetPath: "assets/icons/project.svg",
    color: Colors.white,
    screen: const ProjectsScreen()
  ),
];



List<SkillsModel> languages = [
  SkillsModel(skillName: "Marathi", colorS: Colors.orange),
  SkillsModel(skillName: "Hindi", colorS: Colors.black),
  SkillsModel(skillName: "English", colorS: Colors.blueGrey),
];

 const  String youtubeChannel = "https://www.youtube.com/@DsaWithAJ";
const  String linkedIn = "https://www.linkedin.com/in/atharva-jagtap112/";
const  String github = "https://github.com/atharvajagtap112";
const  String twitter = "https://twitter.com/highcoder__";

const  String resumeLink =
    "https://drive.google.com/drive/folders/1xOotBsa7jgXAPO0yqfTWG1wiozO3zUYy?usp=sharing";
const  String email = "atharvacjagtap2005@gmail.com";
 const   String introduction =
"Hi, I’m Atharva Jagtap, a second-year Computer Science student. My passion for tech began in childhood, driving me to pursue engineering. In my first year, I built a strong foundation in DSA, solving 140+ LeetCode problems. In my second year, I ventured into Android development with Flutter, creating projects like an e-commerce app integrated with Razorpay. Beyond coding, I enjoy drawing, photography, and gaming. For me, tech is more than a career—it's a way to create, solve, and innovate.";





const  String gmail =
    "https://play.google.com/store/apps/developer?id=AppyMonk";


 