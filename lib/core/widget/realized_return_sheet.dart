// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:sr_ui/core/core.dart';

class RealizedReturnSheet extends HookWidget {
  const RealizedReturnSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selected = useState(0);
    return Container(
      color: context.color.backgroundCard,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15.sp, horizontal: 20.sp),
            child: VText(
              "Select period",
              fontWeight: FontWeight.w800,
              fontSize: 20.sp,
            ),
          ),
          VListTile(
            title: VText(
              "This Week",
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
            subtitle: SizedBox.shrink(),
            onTap: () {
              selected.value = 0;
            },
            trailing: AnimatedSwitcher(
              duration: Durations.short4,
              child: selected.value == 0
                  ? Icon(
                      Icons.radio_button_checked_outlined,
                    )
                  : Icon(
                      Icons.radio_button_off,
                    ),
            ),
          ),
          VListTile(
            padding: 0.all,
            title: Button.card(
              onTap: () {
                selected.value = 1;
              },
              borderRadius: BorderRadius.circular(0),
              padding: EdgeInsets.symmetric(
                vertical: 10.sp,
                horizontal: 20.sp,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: VText(
                      "Daily",
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  AnimatedSwitcher(
                    duration: Durations.short4,
                    child: selected.value == 1
                        ? Icon(
                            Icons.radio_button_checked_outlined,
                          )
                        : Icon(
                            Icons.radio_button_off,
                          ),
                  ),
                ],
              ),
            ),
            subtitle: VSwitcherAnimated(
              expanded: selected.value == 1,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 10.sp,
                  horizontal: 20.sp,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: VText(
                        "Daily",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Expanded(
                      child: VText(
                        "Daily",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          VListTile(
            padding: 0.all,
            title: Button.card(
              onTap: () {
                selected.value = 2;
              },
              borderRadius: BorderRadius.circular(0),
              padding: EdgeInsets.symmetric(
                vertical: 10.sp,
                horizontal: 20.sp,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: VText(
                      "Monthly",
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  AnimatedSwitcher(
                    duration: Durations.short4,
                    child: selected.value == 2
                        ? Icon(
                            Icons.radio_button_checked_outlined,
                          )
                        : Icon(
                            Icons.radio_button_off,
                          ),
                  ),
                ],
              ),
            ),
            subtitle: VSwitcherAnimated(
              expanded: selected.value == 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 10.sp,
                  horizontal: 20.sp,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: VText(
                        "Monthly",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Expanded(
                      child: VText(
                        "Monthly",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            color: context.color.backgroundCard,
            padding: EdgeInsets.symmetric(
              horizontal: 15.sp,
              vertical: 15.sp,
            ),
            width: double.infinity,
            child: VColumn(
              gap: Gap(10.sp),
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Center(
                    child: Text("SAVE"),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
