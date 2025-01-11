import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class Rain extends StatefulWidget {
  const Rain({super.key, required this.top, required this.opposite});
  final double top;
  final bool opposite;
  @override
  State<Rain> createState() => _RainState();
}

class _RainState extends State<Rain> {
   Artboard? rainArtBoard ;
   SMIInput<bool>? rain;
   SMIInput<bool>? hover; 
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    rootBundle.load("assets/rive/rain.riv").then((value){
       final file=  RiveFile.import(value);
      final artboard=   file.mainArtboard;
         final controller=   StateMachineController.fromArtboard(artboard, 'State Machine 1');   
          if(controller!=null)    {
          artboard.addController(controller);
         

         rain= controller.findInput('isPressed');
         hover= controller.findInput("isHover");

         rain!.value=false;
         hover!.value=false;
          }
        
          setState(() {
              rainArtBoard=artboard;
          });
    }
       );
  }  

  void playRun(){
    rain!.value=rain!.value==true? false:true; 
  }


  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return 
    rainArtBoard==null? Container() : 
    TweenAnimationBuilder(
      duration:const Duration(seconds: 600) ,
      tween: Tween(begin: widget.opposite?size.width-180 : 0, end: widget.opposite?-40: size.width-180 ),
      builder: (context, value, _) {
        return Positioned(
          top: widget.top,
             left: value.toDouble(),
          child: SizedBox(
            height:100,
            width: 228,
            child: MouseRegion(
              onEnter: (_){
                hover?.value= true;
                setState(() {});
            
              } ,
              onExit: (_){
                hover!.value=false;
                setState(() {
                  
                });
              },
              child: GestureDetector(
                onTap:()=> playRun() ,
                child: Rive(
                  useArtboardSize: true,
                  artboard: rainArtBoard!, 
                  fit: BoxFit.cover,
                  ),
              ),
            ),
          ),
        );
      }
    );
  }
}