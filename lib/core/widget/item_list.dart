import 'package:sr_ui/core/core.dart';

class ItemList extends StatelessWidget {
  final String title;

  const ItemList({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 4.0.sp),
          child: RotationTransition(
            turns: AlwaysStoppedAnimation(45 / 360),
            child: Container(
              height: (12 / sqrt(2)).sp,
              width: (12 / sqrt(2)).sp,
              color: AppColor.listItem,
            ),
          ),
        ),
        Gap(6.sp),
        Expanded(
          child: VText(
            title,
            fontSize: 12.sp,
            color: AppColor.hintTitle,
            fontWeight: FontWeight.w500,
            maxLines: 3,
          ),
        ),
      ],
    );
  }
}
