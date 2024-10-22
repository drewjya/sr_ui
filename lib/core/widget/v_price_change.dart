// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:sr_ui/core/core.dart';

class VPriceChange extends StatefulWidget {
  final double price;
  final double percentage;
  final bool hasRp;
  const VPriceChange({
    Key? key,
    required this.price,
    required this.percentage,
    this.hasRp = true,
  }) : super(key: key);

  static loading({
    Color? backgroundColor,
    Color? highlightColor,
    required double width,
  }) {
    return Builder(builder: (context) {
      return Padding(
        padding: EdgeInsets.only(top: 4.0.sp),
        child: VShimmer(
          height: 15.sp,
          width: width,
          backgroundColor: context.color.primary.withOpacity(0.7),
          highlightColor: context.color.primary,
        ),
      );
    });
  }

  @override
  State<VPriceChange> createState() => _VPriceChangeState();
}

class _VPriceChangeState extends State<VPriceChange>
    with SingleTickerProviderStateMixin {
  Color? priceColor;
  double previousPrice = 0;
  Color? changeColor;
  SvgGenImage? image;
  late Animation<Color> colorAnimation;
  late AnimationController animationController;

  void resetColor() {
    previousPrice = widget.price;
    priceColor = Colors.transparent;
    if (widget.price == 0) {
      image = null;
      changeColor = context.color.textPrimary;
    } else if (widget.price > 0) {
      image = Assets.icon.priceIncrease;
      changeColor = AppColor.success;
    } else if (widget.price < 0) {
      image = Assets.icon.priceDecrease;
      changeColor = AppColor.error;
    }
  }

  void checkData() {
    var priceChange = widget.price;

    setState(() {
      if (previousPrice < priceChange) {
        image = Assets.icon.priceDecrease;
        changeColor = AppColor.error;
      } else if (previousPrice > priceChange) {
        image = Assets.icon.priceIncrease;
        changeColor = AppColor.success;
      } else {
        image = null;
        changeColor = context.color.textPrimary;
      }
    });

    Future.delayed(Durations.medium4, () {
      setState(() => resetColor());
    });
  }

  @override
  void didUpdateWidget(covariant VPriceChange oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.price != oldWidget.price) {
      checkData();
    }
  }

  @override
  void initState() {
    previousPrice = widget.price;
    resetColor();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (image != null) ...{image!.svg(height: 10.sp, width: 10.sp)},
        Gap(2.sp),
        VText(
          (widget.hasRp ? "Rp" : "") +
              "${previousPrice}".currency +
              " (${widget.percentage}%)",
          color: changeColor,
          fontWeight: FontWeight.w500,
          fontSize: 12.sp,
        ),
      ],
    );
  }
}
