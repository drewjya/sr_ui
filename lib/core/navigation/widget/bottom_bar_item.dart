// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:sr_ui/core/core.dart';

class BottomBarItem extends StatelessWidget {
  final String title;
  final bool active;
  final SvgGenImage image;
  final VoidCallback? onTap;

  const BottomBarItem({
    Key? key,
    required this.title,
    required this.active,
    required this.image,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Tooltip(
        message: title,
        verticalOffset: 35.sp,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Ink(
              color:
                  active ? context.color.background : context.color.background,
              padding: EdgeInsets.symmetric(
                vertical: 10.sp,
              ).copyWith(
                bottom: context.bottom <= 0 ? 10.sp : context.bottom,
              ),
              child: SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    image.svg(
                      height: 22.sp,
                      width: 22.sp,
                    ),
                    VText(
                      title,
                      color: active ? Colors.white : Colors.grey,
                      fontSize: 12.sp,
                      fontWeight: active ? FontWeight.w700 : FontWeight.w400,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
