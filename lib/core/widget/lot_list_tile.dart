import 'package:sr_ui/core/core.dart';

class LotListTile extends StatelessWidget {
  final String? image;
  final String stockCode;
  final String companyName;
  final double price;
  final double lot;
  final VoidCallback? onTap;

  const LotListTile({
    Key? key,
    this.image,
    required this.stockCode,
    required this.companyName,
    required this.price,
    required this.lot,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VListTile(
      onTap: onTap,
      leading: Padding(
        padding: EdgeInsets.only(right: 8.0.sp),
        child: CircleAvatar(
          radius: 25.r,
          child: Image.network(
            networkImage,
          ),
        ),
      ),
      title: Row(
        children: [
          Expanded(
            child: VText(
              stockCode,
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
            ),
          ),
          VText(
            "$price".currency,
            fontWeight: FontWeight.bold,
            fontSize: 16.sp,
          )
        ],
      ),
      subtitle: Row(
        children: [
          Expanded(
            child: VText(
              companyName,
              fontWeight: FontWeight.w500,
              fontSize: 12.sp,
              color: context.color.grey,
            ),
          ),
          VText(
            "$lot".currency,
            fontWeight: FontWeight.w500,
            fontSize: 12.sp,
            color: AppColor.success,
          )
        ],
      ),
    );
  }
}
