import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class RiveLoadingScreen extends StatefulWidget {
  final Widget child;
  final String riveAssetPath;
  
  const RiveLoadingScreen({
    Key? key,
    required this.child,
    required this.riveAssetPath,
  }) : super(key: key);

  @override
  State<RiveLoadingScreen> createState() => _RiveLoadingScreenState();
}

class _RiveLoadingScreenState extends State<RiveLoadingScreen> {
  SimpleAnimation? _pullAnimation;
  bool _isLoading = true;
  bool _showContent = false;

  void _onRiveInit(Artboard artboard) {
    // Create a SimpleAnimation controller for the "Pull" animation
    _pullAnimation = SimpleAnimation('Pull');
    artboard.addController(_pullAnimation!);
    
    // Start loading sequence
    _startLoadingSequence();
  }

  void _startLoadingSequence() async {
    // Simulate loading process
    await Future.delayed(const Duration(seconds: 2));
    
    if (mounted) {
      setState(() {
        _isLoading = false;
      });
      
      await Future.delayed(const Duration(milliseconds: 500));
      if (mounted) {
        setState(() {
          _showContent = true;
        });
      }
    }
  }

  @override
  void dispose() {
    _pullAnimation?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Main content
        AnimatedOpacity(
          opacity: _showContent ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 800),
          child: widget.child,
        ),

        // Loading animation
        AnimatedOpacity(
          opacity: _isLoading ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 500),
          child: _isLoading ? Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Center(
              child: SizedBox(
                width: 200,
                height: 200,
                child: RiveAnimation.asset(
                  widget.riveAssetPath,
                  onInit: _onRiveInit,
                  // Remove stateMachines parameter since we're using simple animation
                ),
              ),
            ),
          ) : const SizedBox.shrink(),
        ),
      ],
    );
  }
}