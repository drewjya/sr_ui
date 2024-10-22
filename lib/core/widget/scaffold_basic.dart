// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:sr_ui/core/config/ui_overlay.dart';
import 'package:sr_ui/core/core.dart';

class ScaffoldBasic extends StatelessWidget {
  const ScaffoldBasic({
    Key? key,
    this.titleText,
    this.title,
    required this.body,
    this.onBack,
    this.background,
    this.leading,
    this.actions = const [],
  })  : assert(
            (title != null && titleText == null) ||
                (title == null && titleText != null),
            'Either titleText or title must be provided, but not both, and at least one must be non-null'),
        assert(
            (leading != null && onBack == null) ||
                (leading == null && onBack != null) ||
                (leading == null && onBack == null),
            'Either leading or onBack must be provided, but not both'),
        super(key: key);
  final String? titleText;
  final Widget? title;
  final Widget? background;
  final Widget body;
  final VoidCallback? onBack;
  final Widget? leading;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    uiOverlay();
    return Scaffold(
      backgroundColor: context.color.background,
      body: Container(
        color: context.color.background,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: [
                Container(
                  height: constraints.maxHeight * 0.25,
                  decoration: const BoxDecoration(
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
                if (background != null) background!,
                Padding(
                  padding: EdgeInsets.only(top: context.top),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 8.sp),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0.sp)
                              .copyWith(
                                  left: 15.sp,
                                  right: actions.isNotEmpty ? 15.sp : 20.sp),
                          child: Row(
                            children: [
                              // Icon(Icons.arro),
                              leading ??
                                  Consumer(
                                    builder: (context, ref, child) {
                                      return Material(
                                        color: Colors.transparent,
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        clipBehavior: Clip.antiAlias,
                                        child: InkWell(
                                          onTap: onBack ?? () => ref.pop(),
                                          child: Ink(
                                            padding: EdgeInsets.all(5.sp),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                            ),
                                            child: Assets.icon.arrowLeft.svg(
                                              height: 24.sp,
                                              width: 24.sp,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                              if (title == null) Gap(15),
                              Expanded(
                                child: title ??
                                    VText(
                                      titleText,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w900,
                                    ),
                              ),
                              if (actions.isNotEmpty)
                                Row(
                                  children: actions,
                                )
                            ],
                          ),
                        ),
                      ),
                      Expanded(child: body),
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
