// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:sr_ui/core/core.dart';

class BankTransferCard extends StatelessWidget {
  const BankTransferCard({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [
            Color(0xff576265),
            Color(0xff757a7b),
            Color(0xff576265),
            Color(0xff576265),
            Color(0xff848b8a),
            Color(0xff9ea1a1),
            Color(0xff576265),
          ],
          begin: Alignment.bottomLeft,
          end: Alignment(1, -0.8),
          stops: [0.0, 0.1, 0.19, 0.46, 0.52, 0.85, 1.0],
          transform: GradientRotation(72),
        ),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Color(0xff315BF0).withOpacity(0.32),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(
              0.05,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          clipBehavior: Clip.antiAlias,
          padding: EdgeInsets.only(top: 27.06.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VText(
                    "STOCK ACCOUNT DETAILS",
                    color: Colors.black,
                    padding: 24.6.horizontal,
                    fontWeight: FontWeight.w500,
                    fontSize: 14.76.sp,
                  ),
                  Gap(23.sp),
                  Padding(
                    padding: 24.6.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Assets.icon.chip.svg(
                          height: 30.75.sp,
                          width: 40.sp,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: 15.horizontal,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        VText(
                          "Account Number",
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp,
                        ),
                        Gap(4.sp),
                        VText(
                          "2243 6652 9435 9982",
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 20.sp,
                        ),
                      ],
                    ),
                  ),
                  Gap(21.sp),
                ],
              ),
              Container(
                padding: 15.horizontal.copyWith(
                      top: 10.sp,
                      bottom: 10.sp,
                    ),
                color: context.color.backgroundCard,
                child: Row(
                  children: [
                    Expanded(
                      child: _ItemTransfer(
                        title: "Owner Name",
                        value: "Sutrisno Batawi",
                      ),
                    ),
                    Expanded(
                      child: _ItemTransfer(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        title: "Owner Name",
                        value: "Sutrisno Batawi",
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ItemTransfer extends StatelessWidget {
  final String title;
  final String value;
  final CrossAxisAlignment crossAxisAlignment;
  const _ItemTransfer({
    Key? key,
    required this.title,
    required this.value,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        VText(
          title,
          fontSize: 12.sp,
          color: AppColor.hintTitle,
          fontWeight: FontWeight.w500,
        ),
        Gap(6.sp),
        VText(
          value,
          fontSize: 12.sp,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ],
    );
  }
}
