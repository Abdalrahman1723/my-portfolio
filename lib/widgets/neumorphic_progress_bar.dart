import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart' as vm;

class NeumorphicProgressBar extends StatefulWidget {
  final Icon logo;
  const NeumorphicProgressBar({super.key, required this.logo});

  @override
  State<NeumorphicProgressBar> createState() => _NeumorphicProgressBarState();
}

class _NeumorphicProgressBarState extends State<NeumorphicProgressBar> {
  final bevel = 10.0;
  final blurOffset = const Offset(20.0 / 2, 20.0 / 2);
  Color shadowColor = Colors.black87;
  Color backgroundColor = const Color(0xFF2c3135);
  Color highlightColor = Colors.white.withOpacity(0.05);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Stack(
        alignment: Alignment.center,
        children: [
          NeumorphicCircle(
            shadowColor: shadowColor,
            backgroundColor: backgroundColor,
            highlightColor: highlightColor,
            innerShadow: true,
            outerShadow: false,
          ),
          LayoutBuilder(
            builder: (context, constraints) {
              return SizedBox(
                width: constraints.maxWidth * 0.3,
                height: constraints.maxWidth * 0.3,
                child: NeumorphicCircle(
                  innerShadow: false,
                  outerShadow: true,
                  highlightColor: highlightColor,
                  shadowColor: shadowColor,
                  backgroundColor: backgroundColor,
                  child: SizedBox.expand(
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: widget.logo,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          const ProgressRing(progress: 0.6),
        ],
      ),
    );
  }
}

class ProgressRing extends StatelessWidget {
  final double progress;

  const ProgressRing({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox.expand(
          child: CustomPaint(
            painter: RingPainter(
              strokeWidth: constraints.maxWidth * 0.15,
              progress: progress,
            ),
          ),
        );
      },
    );
  }
}

class RingPainter extends CustomPainter {
  final double strokeWidth;
  final double progress;

  RingPainter({required this.strokeWidth, required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final inset = size.width * 0.18;

    final rect = Rect.fromLTRB(
      inset,
      inset,
      size.width - inset,
      size.height - inset,
    );

    canvas.drawArc(
      rect,
      vm.radians(-90),
      vm.radians(360 * progress),
      false,
      Paint()
        ..shader = const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFf1da95), Color(0xFFfe948a), Color(0xFFb24fce)],
        ).createShader(rect)
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.round,
    );
  }

  @override
  bool shouldRepaint(RingPainter oldDelegate) {
    if (oldDelegate.progress != progress ||
        oldDelegate.strokeWidth != strokeWidth) {
      return true;
    }
    return false;
  }
}

class NeumorphicCircle extends StatelessWidget {
  final bool innerShadow;
  final bool outerShadow;
  final Color highlightColor;
  final Color shadowColor;
  final Color backgroundColor;
  final Widget? child;

  const NeumorphicCircle({
    super.key,
    required this.innerShadow,
    required this.outerShadow,
    required this.highlightColor,
    required this.shadowColor,
    required this.backgroundColor,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            shape: BoxShape.circle,
            boxShadow: (outerShadow)
                ? [
                    BoxShadow(
                      color: highlightColor,
                      offset: const Offset(-10, -10),
                      blurRadius: 20,
                      spreadRadius: 0,
                    ),
                    BoxShadow(
                      color: shadowColor,
                      offset: const Offset(10, 10),
                      blurRadius: 20,
                      spreadRadius: 0,
                    ),
                  ]
                : null,
          ),
        ),
        (innerShadow)
            ? ClipPath(
                clipper: HighlightClipper(),
                child: CircleInnerHighlight(
                  highlightColor: highlightColor,
                  backgroundColor: backgroundColor,
                ),
              )
            : const SizedBox.shrink(),
        (innerShadow)
            ? ClipPath(
                clipper: ShadowClipper(),
                child: CircleInnerShadow(
                  shadowColor: shadowColor,
                  backgroundColor: backgroundColor,
                ),
              )
            : const SizedBox.shrink(),
        (child != null) ? child! : const SizedBox.shrink(),
      ],
    );
  }
}

class CircleInnerShadow extends StatelessWidget {
  final Color shadowColor;
  final Color backgroundColor;

  const CircleInnerShadow({
    super.key,
    required this.shadowColor,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [backgroundColor, shadowColor],
          center: const AlignmentDirectional(0.05, 0.05),
          focal: const AlignmentDirectional(0, 0),
          radius: 0.5,
          focalRadius: 0,
          stops: const [0.75, 1.0],
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: const [0, 0.45],
            colors: [backgroundColor.withOpacity(0), backgroundColor],
          ),
        ),
      ),
    );
  }
}

class CircleInnerHighlight extends StatelessWidget {
  final Color highlightColor;
  final Color backgroundColor;

  const CircleInnerHighlight({
    super.key,
    required this.highlightColor,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [backgroundColor, highlightColor],
          center: const AlignmentDirectional(-0.05, -0.05),
          focal: const AlignmentDirectional(-0.05, -0.05),
          radius: 0.6,
          focalRadius: 0.1,
          stops: const [0.75, 1.0],
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: const [0.55, 1],
            colors: [backgroundColor, backgroundColor.withOpacity(0)],
          ),
        ),
      ),
    );
  }
}

class ShadowClipper extends CustomClipper<Path> {
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }
}

class HighlightClipper extends CustomClipper<Path> {
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(size.width, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.close();
    return path;
  }
}
