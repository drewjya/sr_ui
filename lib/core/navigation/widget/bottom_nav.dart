import 'package:sr_ui/core/core.dart';

class BottomNav extends ConsumerStatefulWidget {
  const BottomNav({super.key});

  @override
  ConsumerState<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends ConsumerState<BottomNav> {
  int getCurrentIndex() {
    final String location = GoRouterState.of(context).uri.toString();

    if (location.contains(Routes.home)) {
      return 0;
    }
    if (location.contains(Routes.market)) {
      return 1;
    }
    if (location.contains(Routes.order)) {
      return 2;
    }
    if (location.contains(Routes.community)) {
      return 3;
    }
    throw UnimplementedError();
  }

  void onTap(String path) {
    // log("Tap ${DateTime.now()}");
    ref.router.go(path);
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: AutomaticNotchedShape(
        RoundedRectangleBorder(),
      ),
      elevation: 0,
      padding: EdgeInsets.all(0),
      height: max(57.5.sp, 60),
      notchMargin: 0,
      color: context.color.backgroundCard,
      child: Container(
        // padding: EdgeInsets.symmetric( horizontal: 16),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: context.color.background,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            BottomBarItem(
              title: "Home",
              active: getCurrentIndex() == 0,
              image: getCurrentIndex() == 0
                  ? Assets.icon.home
                  : Assets.icon.homeInactive,
              onTap: () => onTap(Routes.home),
            ),
            BottomBarItem(
              title: "Market",
              active: getCurrentIndex() == 1,
              image: getCurrentIndex() == 1
                  ? Assets.icon.market
                  : Assets.icon.marketInactive,
              onTap: () => onTap(Routes.market),
            ),
            Spacer(),
            BottomBarItem(
              title: "Order",
              active: getCurrentIndex() == 2,
              image: getCurrentIndex() == 2
                  ? Assets.icon.order
                  : Assets.icon.orderInactive,
              onTap: () => onTap(Routes.order),
            ),
            BottomBarItem(
              title: "Community",
              active: getCurrentIndex() == 3,
              image: getCurrentIndex() == 3
                  ? Assets.icon.community
                  : Assets.icon.communityInactive,
              onTap: () => onTap(Routes.community),
            ),
          ],
        ),
      ),
    );
  }
}
