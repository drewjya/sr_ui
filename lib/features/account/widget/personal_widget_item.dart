// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:sr_ui/core/core.dart';

class PersonalWidgetItem extends StatelessWidget {
  final String title;
  final String value;
  const PersonalWidgetItem({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: VText(
            title,
            style: context.text.subtitle.copyWith(
              fontSize: 12.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        VText(
          value,
          style: context.text.title.copyWith(
            fontSize: 15.sp,
            fontWeight: FontWeight.w400,
          ),
        )
      ],
    );
  }
}
