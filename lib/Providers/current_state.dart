import 'package:device_frame/device_frame.dart';

import 'package:flutter/material.dart';
import 'package:portfolio/Models/colors_model.dart';
import 'package:portfolio/Screen/phone_home_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class CurrentState  extends ChangeNotifier{
   
   DeviceInfo currentDevice=Devices.ios.iPhone13;

   Widget currentScreen =const PhoneHomeScreen();  
    bool isMainScreen=true;
    Color defaultColor=Colors.white;
    String title="adssdssd";
    ColorModel defaultColorModel =ColorModel(  // we can store index of current list
    svgPath: "assets/images/cloudyBlue.svg",
    color: Colors.blue,
    gradient: const LinearGradient(
      begin: Alignment.topLeft,
      colors: [Colors.blue, Colors.black45],
    ),
  );
    
   void appbarColor(Color color){
    defaultColor=color;
    notifyListeners();
   }


    void changeSelectedDevices(DeviceInfo device){
      currentDevice=device;
       notifyListeners();
    }

    void changeTheme(ColorModel colorModel){
      defaultColorModel=colorModel;
      notifyListeners();
    }

    Future<void> launchInBrowser(String link) async{
         final Uri url=Uri.parse(link); 
      if( await canLaunchUrl(url)){
        await launchUrl(url,);
      }
      else{
         print("something went wrong");
      }
    }
    

   


    void changeScreen(Widget screen, bool isMain){
      currentScreen=screen;
    isMainScreen=isMain;
      notifyListeners();
    }

    Future<void> sendEmail() async {
      const gmail="atharvacjagtap2005@gmail.com";
     final Uri emailUri = Uri.parse('https://mail.google.com/mail/?view=cm&fs=1&to=$gmail');

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      throw 'Could not launch $emailUri';
    }
    }}