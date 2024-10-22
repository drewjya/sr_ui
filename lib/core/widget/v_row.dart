// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:sr_ui/core/core.dart';

class VRow extends StatelessWidget {
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;
  final List<Widget> children;
  final MainAxisSize mainAxisSize;
  final TextDirection? textDirection;
  final VerticalDirection verticalDirection;
  final TextBaseline? textBaseline;
  final Widget? gap;

  const VRow({
    Key? key,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.children = const [],
    this.mainAxisSize = MainAxisSize.max,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    this.textBaseline,
    this.gap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> _children = [];
    if (gap != null) {
      if (children.isNotEmpty) {
        _children = children
            .mapIndexed(
              (index, element) {
                return [element, if (index != children.length - 1) gap!];
              },
            )
            .expand(
              (element) => element,
            )
            .toList();
      }
    } else {
      _children = children;
    }

    return Row(
      children: _children,
      mainAxisSize: mainAxisSize,
      textBaseline: textBaseline,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      crossAxisAlignment: crossAxisAlignment,
      mainAxisAlignment: mainAxisAlignment,
    );
  }
}


class VColumn extends StatelessWidget {
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;
  final List<Widget> children;
  final MainAxisSize mainAxisSize;
  final TextDirection? textDirection;
  final VerticalDirection verticalDirection;
  final TextBaseline? textBaseline;
  final Widget? gap;

  const VColumn({
    Key? key,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.children = const [],
    this.mainAxisSize = MainAxisSize.max,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    this.textBaseline,
    this.gap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> _children = [];
    if (gap != null) {
      if (children.isNotEmpty) {
        _children = children
            .mapIndexed(
              (index, element) {
                return [element, if (index != children.length - 1) gap!];
              },
            )
            .expand(
              (element) => element,
            )
            .toList();
      }
    } else {
      _children = children;
    }

    return Column(
      children: _children,
      mainAxisSize: mainAxisSize,
      textBaseline: textBaseline,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      crossAxisAlignment: crossAxisAlignment,
      mainAxisAlignment: mainAxisAlignment,
    );
  }
}
