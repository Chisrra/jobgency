import 'package:flutter/material.dart';

class AnimatedWrench extends StatefulWidget {
  @override
  _AnimatedWrenchState createState() => _AnimatedWrenchState();
}

class _AnimatedWrenchState extends State<AnimatedWrench>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<Offset>? _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(seconds: 10),
      vsync: this,
    );
    _animation = Tween<Offset>(
      begin: Offset(0.5, 0.6),
      end: Offset(-0.5, 0.6),
    ).animate(CurvedAnimation(
      parent: _animationController!,
      curve: Curves.linear,
    ));

    _animationController!.repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SlideTransition(
        position: _animation!,
        child: SizedBox(
            height: 100, child: Image.asset('assets/images/wrench.png')),
      ),
    );
  }
}
