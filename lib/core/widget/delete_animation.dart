// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:sr_ui/core/core.dart';

class BackgroundIconSvg extends StatelessWidget {
  const BackgroundIconSvg({
    Key? key,
    required this.size,
    this.padding,
    required this.asset,
    this.colors,
  }) : super(key: key);
  final double size;
  final double? padding;
  final SvgGenImage asset;
  final List<Color>? colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      padding: EdgeInsets.all(padding ?? 8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: colors ??
              [
                Color.fromRGBO(49, 91, 240, 0.3), // rgba(49, 91, 240, 0.6)
                Color.fromRGBO(49, 91, 240, 0), // rgba(49, 91, 240, 0)
              ],
          stops: [0.0, 1.0],
        ),
      ),
      child: asset.svg(),
    );
  }
}

class DeleteAnimation extends StatefulWidget {
  final double size;
  const DeleteAnimation({
    Key? key,
    this.size = 50,
  }) : super(key: key);

  @override
  State<DeleteAnimation> createState() => _DeleteAnimationState();
}

class _DeleteAnimationState extends State<DeleteAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    // Animation controller that controls the speed of the rotation
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5), // Adjust this for speed of rotation
    )..repeat(); // Repeats indefinitely
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: Stack(
        children: [
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Transform.rotate(
                angle:
                    _controller.value * 2.0 * 3.14159, // Rotates continuously
                child: Container(
                  width: widget.size,
                  height: widget.size,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromRGBO(
                            49, 91, 240, 0.6), // rgba(49, 91, 240, 0.6)
                        Color.fromRGBO(49, 91, 240, 0), // rgba(49, 91, 240, 0)
                      ],
                      stops: [0.0, 1.0],
                    ),
                  ),
                ),
              );
            },
          ),
          Padding(
            padding: EdgeInsets.all(18),
            child: Assets.icon.delete.svg(),
          )
        ],
      ),
    );
  }
}
