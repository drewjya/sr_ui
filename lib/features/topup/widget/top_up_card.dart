import 'package:sr_ui/core/core.dart';

class TopUpCard extends StatelessWidget {
  const TopUpCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: context.color.card,
      ),
      width: double.infinity,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff576265).withOpacity(0.4),
              Color(0xff757a7b).withOpacity(0.4),
              Color(0xff576265).withOpacity(0.4),
              Color(0xff576265).withOpacity(0.4),
              Color(0xff848b8a).withOpacity(0.4),
              Color(0xff9ea1a1).withOpacity(0.4),
              Color(0xff576265).withOpacity(0.4),
            ],
            begin: Alignment.bottomLeft,
            end: Alignment(1, -0.8),
            stops: [0.0, 0.1, 0.19, 0.46, 0.52, 0.85, 1.0],
            transform: GradientRotation(72),
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white.withOpacity(0.2),
                Colors.white.withOpacity(0)
              ],
              stops: [0, 1],
              transform: GradientRotation(-65),
              begin: Alignment.bottomRight,
              end: Alignment.center,
            ),
          ),
          child: Container(
            color: context.color.primary.withOpacity(0.3),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  VText(
                    "Trading Balance",
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: context.color.grey,
                  ),
                  Gap(4.sp),
                  VText(
                    "Rp " + "${69000}".currency,
                    fontSize: 32.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
