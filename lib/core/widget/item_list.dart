// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:sr_ui/core/core.dart';

class ItemList extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final double? size;
  final double? top;
  final double? gap;
  const ItemList({
    Key? key,
    required this.text,
    this.style,
    this.size,
    this.top,
    this.gap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: top ?? 4.0.sp),
          child: RotationTransition(
            turns: AlwaysStoppedAnimation(45 / 360),
            child: Container(
              height: size ?? (12 / sqrt(2)).sp,
              width: size ?? (12 / sqrt(2)).sp,
              color: AppColor.listItem,
            ),
          ),
        ),
        Gap(gap??6.sp),
        Expanded(
          child: VText(
            text,
            fontSize: 12.sp,
            color: AppColor.hintTitle,
            fontWeight: FontWeight.w500,
            maxLines: 3,
            style: style,
          ),
        ),
      ],
    );
  }
}
