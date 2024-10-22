// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:sr_ui/core/core.dart';

class ItemListTile extends StatelessWidget {
  final String? image;
  final String stockCode;
  final String companyName;
  final double price;
  final double priceChange;
  final double percentChange;
  final VoidCallback? onTap;

  const ItemListTile({
    Key? key,
    this.image,
    required this.stockCode,
    required this.companyName,
    required this.price,
    required this.priceChange,
    required this.percentChange,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Material(
    //   color: Colors.transparent,
    //   child: InkWell(
    //     onTap: onTap,
    //     splashColor: AppColor.backgroundRipple,
    //     child: Ink(
    //       color: context.color.backgroundCard,
    //       padding: EdgeInsets.symmetric(
    //         vertical: 10.sp,
    //         horizontal: 20.sp,
    //       ),
    //       child: Row(
    //         children: [
    //           CircleAvatar(
    //             radius: 25.r,
    //             child: Image.network(
    //               networkImage,
    //             ),
    //           ),
    //           Gap(8.sp),
    //           Expanded(
    //               child: Column(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: [
    //               Row(
    //                 children: [
    //                   Expanded(
    //                     child: VText(
    //                       stockCode,
    //                       fontWeight: FontWeight.bold,
    //                       fontSize: 16.sp,
    //                     ),
    //                   ),
    //                   VText(
    //                     "$price".currency,
    //                     fontWeight: FontWeight.bold,
    //                     fontSize: 16.sp,
    //                   )
    //                 ],
    //               ),
    //               Gap(4.sp),
    //               Row(
    //                 children: [
    //                   Expanded(
    //                     child: VText(
    //                       companyName,
    //                       fontWeight: FontWeight.w500,
    //                       fontSize: 12.sp,
    //                       color: context.color.grey,
    //                     ),
    //                   ),
    // VPriceChange(
    //   price: priceChange,
    //   percentage: percentChange,
    // ),
    //                 ],
    //               ),
    //             ],
    //           )),
    //         ],
    //       ),
    //     ),
    //   ),
    // );

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
          VPriceChange(
            price: priceChange,
            percentage: percentChange,
          ),
        ],
      ),
    );
  }
}
