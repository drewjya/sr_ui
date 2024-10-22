// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:sr_ui/core/core.dart';

class PersistentHeader extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double maxExtend;
  final double minExtend;
  const PersistentHeader({
    required this.child,
    required this.maxExtend,
    required this.minExtend,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => maxExtend;

  @override
  double get minExtent => minExtend;
  // 72 + 20 + 40

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return child != oldDelegate;
  }
}
