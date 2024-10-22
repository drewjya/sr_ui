// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_portofolio_card.dart';

class _Item {
  final SvgGenImage asset;
  final String title;
  final String routeName;
  _Item({
    required this.asset,
    required this.title,
    required this.routeName,
  });
}

class _ThirdItem extends StatelessWidget {
  final SvgGenImage asset;
  final String title;
  final VoidCallback? onTap;
  const _ThirdItem({
    Key? key,
    required this.asset,
    required this.title,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Ink(
          color: context.color.backgroundCard,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              asset.svg(
                height: 20.sp,
                width: 20.sp,
              ),
              Gap(5.sp),
              VText(
                title,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
