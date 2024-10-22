// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:sr_ui/core/core.dart';

class VChoiceChips extends StatelessWidget {
  final List<String> items;
  final String? selected;
  final void Function(String value)? onSelected;

  const VChoiceChips({
    Key? key,
    required this.items,
    this.selected,
    this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log("Selected $selected");
    return VRow(
      gap: Gap(8.sp),
      children: items
          .map(
            (e) => GestureDetector(
              onTap: () => onSelected?.call(e),
              child: AnimatedContainer(
                duration: Durations.short3,
                padding:
                    EdgeInsets.symmetric(horizontal: 15.sp, vertical: 6.sp),
                decoration: BoxDecoration(
                  color: selected == e
                      ? context.color.primary.withOpacity(0.2)
                      : context.color.background,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: selected == e
                        ? context.color.primary
                        : context.color.background,
                    width: 1.sp,
                  ),
                ),
                child: AnimatedDefaultTextStyle(
                  duration: Durations.short3,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight:
                        selected == e ? FontWeight.bold : FontWeight.w500,
                    fontSize: 14.sp,
                    fontFamily: "Manrope",
                  ),
                  child: Text(
                    e,
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
