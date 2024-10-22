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
          style: context.text.title.copyWith(
            fontSize: 16.sp,
          ),
          textAlign: TextAlign.center,
        ),
        VText(
          "You have not had a Realized Return this year.\nMake a transaction to gain profit from stocks.",
          style: context.text.subtitle,
          textAlign: TextAlign.center,
        ),
      ],
    );
    // return SliverFillRemaining(
    //   hasScrollBody: false,
    //   child: emptyWidget,
    // );

    return SliverList.builder(
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.sp,
            vertical: 15.sp,
          ),
          child: Row(
            children: [
              VText("Sep $index"),
              Expanded(child: Center(child: VText("+Rp$index"))),
              VText("+$index"),
            ],
          ),
        );
      },
    );
  }
}
