import 'package:sr_ui/core/core.dart';

class PortfolioTab extends StatelessWidget {
  const PortfolioTab({super.key});

  @override
  Widget build(BuildContext context) {
    final emptyWidget = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BackgroundIconSvg(
          size: 120.sp,
          asset: Assets.icon.portfolioEmpty,
          padding: 20.sp,
          colors: [
            context.color.primary.withOpacity(0.3),
            context.color.primary.withOpacity(0.0),
          ],
        ),
        Gap(20.sp),
        VText(
          "You're currently not holding any shares",
          textStyle: context.text.title.copyWith(
            fontSize: 16.sp,
          ),
          textAlign: TextAlign.center,
        ),
        VText(
          "You have not yet acquired or purchased any\nshares in their account or portfolio.",
          textStyle: context.text.subtitle,
          textAlign: TextAlign.center,
        ),
      ],
    );
    return SliverFillRemaining(
      hasScrollBody: false,
      child: emptyWidget,
      // child: Column(
      //   children: List.generate(
      //     100,
      //     (index) => Container(
      //       child: Center(child: Text("Return")),
      //     ),
      //   ),
      // ),
    );
  }
}
