import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:custom_button_builder/custom_button_builder.dart';
import 'package:portfolio/Providers/current_state.dart';
import 'package:portfolio/const/data.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class PhoneHomeScreen extends StatelessWidget {
  const PhoneHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CurrentState currentState=Provider.of <CurrentState>( context,listen: false); // these listen: false tells us that whenever there is change in app you dont need to rebuild the entire app
   
    return Container(
                              padding: const EdgeInsets.only(
                                top: 70, left: 20, right: 20
                              ),
                            
                               
                                child:Wrap( 
                                
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  alignment: WrapAlignment.start,
                                  children: [ 
                                    ...List.generate(apps.length, (index) => 
                                     Container(
                                      margin:const EdgeInsets.only( 
                                          right: 10,
                                          left: 10, 
                                          top: 10,
                                          bottom: 20
                                
                                      ),
                                       child: 
                                       Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                        Consumer<CurrentState>(
                                          builder: (context,_,__ ) {
                                            return CustomButton(
                                              onPressed: (){   
                                                if(apps[index].link!=null) {
                                                  apps[index].title=="Gmail"? sendEmail():
                                                  //currentState.launchInBrowser(apps[index].link!);
                                                  _launchUrl(apps[index].link!);
                                                }else{
                                                  currentState.title=apps[index].title;
                                                  currentState.appbarColor(apps[index].color);
                                                  currentState.changeScreen(apps[index].screen!, false);
                                                }
                                              }, 
                                            borderRadius: currentState.currentDevice==Devices.ios.iPhone13? 8: 100,
                                            backgroundColor: Colors.white,
                                            margin: const EdgeInsets.only(bottom: 5),
                                            width: 45,
                                            height: 45,
                                            child: Center(
                                              child: apps[index].assetPath!=null? 
                                              SvgPicture.asset(apps[index].assetPath!, height: 32, width: 32 )  :  Icon(apps[index].icon,
                                              size: 26, 
                                              color: Colors.black,
                                              )
                                              
                                              ),
                                            );
                                          }
                                        ),
                                
                                         SizedBox(width: 60, 
                                         child:Center(
                                           child: Text(apps[index].title ,
                                            style: GoogleFonts.openSans(
                                            fontSize: 10,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold
                                            ),
                                             ),
                                         ) ,)
                                
                                       ],),
                                     )
                                    )
                                  ],
                                ),
                            );
  }
}


Future<void> _launchUrl(String url) async {
  
final Uri _url = Uri.parse(url);
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}

Future<void> sendEmail() async {
      const gmail="atharvacjagtap2005@gmail.com";
   final Uri emailUri = Uri(
    scheme: 'mailto',
    path: gmail,
    
  );
    if (!await launchUrl(emailUri)) {
      throw 'Could not launch $emailUri';
    } 
    }