import 'package:auto_size_text/auto_size_text.dart';
import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/Providers/current_state.dart';
import 'package:portfolio/Providers/theme_provider.dart';
import 'package:portfolio/Screen/phone_screen_wrapper.dart';
import 'package:portfolio/const/data.dart';
import 'package:custom_button_builder/custom_button_builder.dart';
import 'package:portfolio/widgets/frosted_container.dart';
import 'package:portfolio/widgets/rain_cloud.dart';
import 'package:provider/provider.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    final devices=Data.deviceModellist;
    final colorPalette=Data.colorPalette;
       ThemeProvider theme = Provider.of<ThemeProvider>(context, listen: false);
    
    theme.size = MediaQuery.of(context).size;
    theme.widthRatio = theme.size.width / baseWidth;
    theme.heightRatio = theme.size.height / baseHeight;
    CurrentState currentState=Provider.of <CurrentState>( context,listen: false); // these listen: false tells us that whenever there is change in app you dont need to rebuild the entire app
     bool phone = false;
    if (size.width < 800) {
      phone = true;
    }
    return Scaffold(
      body: Stack(
        children: [
    
       
        Consumer<CurrentState>(  // different bet consumer and selecter is that when the listNotifier is called 
                                 // the consume rebuild again and again and selector check if the variable  
                                 // which we are looking changes the value then it rebuild 
          builder: (context,_,__) {
            return Container(
              decoration:  BoxDecoration(
                gradient: currentState.defaultColorModel.gradient
              ),
            );
          }
        ),
           

          //SVG Image
           const Rain(top: 260.0, opposite: true,),
          phone ? Container():
          Consumer<CurrentState>(
            builder: (context,_,__) {
              return SvgPicture.asset(currentState.defaultColorModel.svgPath,
              fit: BoxFit.cover,
              height:size.height ,
              );
            }
          ),
       const Rain(top: 10.0, opposite: false,),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [ 
                  phone
                      ? Container()
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Transform(
                              transform: Matrix4.identity()
                                ..setEntry(3, 2, 0.01)
                                ..rotateY(-0.06),
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                margin: EdgeInsets.only(
                                    top: 0, bottom: 10 * theme.heightRatio),
                                child: FrostedContainer(
                                  height: 395 * theme.heightRatio,
                                  width: 247.5 * theme.widthRatio,
                                  child:  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Transform(
                                      transform: Matrix4.identity()
                                        ..setEntry(3, 2, 0.01)
                                        ..rotateY(-0.06),
                                      alignment: FractionalOffset.center,
                                      child: Row(
                                        children: [
                                          Flexible(
                                            child: Center(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                child: AutoSizeText(
                                                  'Hi,i am\nAtharva',
                                                  style: GoogleFonts.exo(
                                                      fontSize: 35,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  maxFontSize: 35,
                                                  minFontSize: 15,
                                                  maxLines: 2,
                                                ).animate().fadeIn(
                                                    delay: .8.seconds,
                                                    duration: .7.seconds),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Transform(
                              transform: Matrix4.identity()
                                ..setEntry(3, 2, 0.009999)
                                ..rotateY(-0.07),
                              alignment: Alignment.topCenter,
                              child: FrostedContainer(
                                onTap: () {
                                  currentState.launchInBrowser("https://www.linkedin.com/in/atharva-jagtap112/");
                                },
                                height: 175.5 * theme.heightRatio,
                                width: 245 * theme.widthRatio,
                                child: Center(
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          "assets/icons/topMate.png",
                                          width: 50 *
                                              theme.widthRatio *
                                              theme.heightRatio,
                                          height: 50 *
                                              theme.widthRatio *
                                              theme.heightRatio,
                                        ),
                                        SizedBox(
                                          height: 10 * theme.heightRatio,
                                        ),
                                        Flexible(
                                            child: AutoSizeText(
                                          "Let's connect!",
                                          style: GoogleFonts.exo(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 28 *
                                                theme.widthRatio *
                                                theme.heightRatio,
                                          ),
                                          textAlign: TextAlign.center,
                                          maxFontSize: 28,
                                          minFontSize: 15,
                                        )),
                                      ],
                                    ).animate().fadeIn(
                                        delay: 1.seconds, duration: .7.seconds),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

               
                  //Device--------------------------------------------------------------------------------------------
                  SizedBox(
                    height: size.height-100,
                    child: Consumer<CurrentState>(
                      builder: (context, _,__) {
                        return DeviceFrame(
                            device: currentState.currentDevice, 
                            isFrameVisible: true,
                            
                            orientation: Orientation.portrait,
                            screen: Container(
                                decoration: BoxDecoration(
                                gradient: currentState.defaultColorModel.gradient
                              ),
                              child:ScreenWrapper(childG: currentState.currentScreen))
                        );
                      }
                    ),
                  ),
                     
//-------------------------------------------------------------------------------------------------------------------------------------------------

                     phone
                      ? Container()
                      : 
                   Column(
                  children: [  
                    //Colors Theme
                    Transform(
                       transform: Matrix4.identity()
                                
                             
                                ..setEntry(3, 2, 0.01)
                                ..rotateY(0.06),
                              alignment: Alignment.bottomCenter,
                      child: FrostedContainer( 
                         height: 395 * theme.heightRatio,
                                  width: 247.5 * theme.widthRatio,
                      child: Consumer<CurrentState>(
                        builder: (context,_,__) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Wrap(
                                children: [
                                  ...List.generate(colorPalette.length , 
                                  (index) => CustomButton(
                                    margin: const EdgeInsets.all(10),
                                  onPressed: (){ currentState.changeTheme(colorPalette[index]); },
                                  animate: true,
                                  borderRadius: 100, 
                                  pressed: currentState.defaultColorModel.color==colorPalette[index].color? Pressed.pressed: Pressed.notPressed,
                                   width: 50 * theme.widthRatio,
                                  height: 50 * theme.widthRatio,
                                  isThreeD: true,
                                  shadowColor: Colors.white,
                                  
                                  backgroundColor: colorPalette[index].color,
                                  ),)
                                ],
                              ),
                            ],
                          );
                        }
                      ),),
                    ),
                  const SizedBox(height: 10,),
                Transform(
                              transform: Matrix4.identity()
                                ..setEntry(3, 2, 0.00999)
                                ..rotateY(0.06),
                              alignment: Alignment.topCenter,
                              child: Container(
                                margin:
                                    const EdgeInsets.only(top: 0, bottom: 10),
                                child: FrostedContainer(
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
                            ),
                  ],
                 )
                ],
              ),

             const SizedBox(height: 10,),
                    

               //Bottom      
                Row( 
                  
                  mainAxisAlignment: MainAxisAlignment.center,
                  
                  children: [  
                     ...List.generate(devices.length, (index) => Consumer<CurrentState>(
                    builder: (context,_,__) {
                       if(phone&&Devices.ios.iPad==devices[index].deviceInfo) return Container();
                      return  CustomButton(
                        margin: EdgeInsets.symmetric(horizontal: 50),
                        height: 38, 
                        width: 38, 
                       onPressed: (){  
                      currentState.changeSelectedDevices(devices[index].deviceInfo);
                                      },
                                      backgroundColor: Colors.black,
                                      borderRadius: 38,
                      animate: true,
                                      isThreeD: true,
                                      shadowColor: Colors.white,
                                      pressed: (currentState.currentDevice==devices[index].deviceInfo)?  Pressed.pressed : Pressed.notPressed,
                                      child: Icon(devices[index].icon,  color: Colors.white, ) ,
                      
                                      );
                    }
                  )
                                                             
              ,)],
                )

           

            ],
          )
        
        
        ],
      ),
    );
  }
}