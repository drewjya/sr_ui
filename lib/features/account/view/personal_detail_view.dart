import 'package:sr_ui/core/core.dart';

class PersonalDetailView extends StatelessWidget {
  const PersonalDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldBasic(
      titleText: "PERSONAL DETAILS",
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Gap(20),
          Container(
            height: (89.6 + 5.6).sp,
            width: (89.6 + 5.6 + 20).sp,
            child: Stack(
              children: [
                Center(
                  child: CustomPaint(
                    painter: BorderGradientPainer(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.white.withOpacity(0.15),
                          Colors.white.withOpacity(0.6),
                          Colors.white.withOpacity(0.6),
                          Colors.white.withOpacity(0.15),
                        ],
                        stops: [0.0, 0.4, 0.6, 1.0],
                      ),
                      borderRadius: 12,
                      strokeWidth: 2,
                    ),
                    child: Padding(
                      padding: 5.6.all,
                      child: Container(
                        decoration: BoxDecoration(
                          color: context.color.backgroundCard.withBlue(221),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Image.network(
                          networkImage,
                          height: 84.sp,
                          width: 84.sp,
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Button.secondary(
                    padding: EdgeInsets.symmetric(
                      horizontal: 6.67.sp,
                      vertical: 7.5.sp,
                    ),
                    backgroundColor: context.color.primary,
                    borderRadius: BorderRadius.circular(5),
                    onTap: () {},
                    child: Assets.icon.camera.svg(
                      height: 15.sp,
                      width: 17.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
