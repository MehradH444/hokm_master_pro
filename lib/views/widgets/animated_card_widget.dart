import 'package:flutter/material.dart';
import '../../models/playing_card.dart';
import 'playing_card_widget.dart';

class AnimatedCardWidget extends StatefulWidget {
  final PlayingCard card;
  final Offset startOffset;
  final Offset targetOffset;
  final VoidCallback? onAnimationComplete;

  const AnimatedCardWidget({
    Key? key,
    required this.card,
    required this.startOffset,
    required this.targetOffset,
    this.onAnimationComplete,
  }) : super(key: key);

  @override
  State<AnimatedCardWidget> createState() => _AnimatedCardWidgetState();
}

class _AnimatedCardWidgetState extends State<AnimatedCardWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _positionAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 350),
      vsync: this,
    );

    _positionAnimation = Tween<Offset>(
      begin: widget.startOffset,
      end: widget.targetOffset,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    ));

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _controller.forward().then((_) {
      if (widget.onAnimationComplete != null) {
        widget.onAnimationComplete!();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Positioned(
          left: _positionAnimation.value.dx,
          top: _positionAnimation.value.dy,
          child: Transform.scale(
            scale: _scaleAnimation.value,
            child: PlayingCardWidget(card: widget.card),
          ),
        );
      },
    );
  }
}
