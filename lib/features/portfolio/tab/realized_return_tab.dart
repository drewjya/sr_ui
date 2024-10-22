import 'package:sr_ui/core/core.dart';

class RealizedReturnTab extends StatelessWidget {
  const RealizedReturnTab({super.key});

  @override
  Widget build(BuildContext context) {
    final emptyWidget = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BackgroundIconSvg(
          size: 120.sp,
          asset: Assets.icon.realizedReturnEmpty,
          padding: 20.sp,
          colors: [
            context.color.primary.withOpacity(0.3),
            context.color.primary.withOpacity(0.0),
          ],
        ),
        Gap(20.sp),
        VText(
          "No Realized Returns Yet",
          textStyle: context.text.title.copyWith(
            fontSize: 16.sp,
          ),
          textAlign: TextAlign.center,
        ),
        VText(
          "You have not had a Realized Return this year.\nMake a transaction to gain profit from stocks.",
          textStyle: context.text.subtitle,
          textAlign: TextAlign.center,
        ),
      ],
    );
    return SliverFillRemaining(
      hasScrollBody: false,
      child: emptyWidget,
    );
  }
}
