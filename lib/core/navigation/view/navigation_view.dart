// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:sr_ui/core/config/ui_overlay.dart';
import 'package:sr_ui/core/core.dart';
import 'package:sr_ui/features/profile/view/profile_drawer.dart';

class NavigationView extends StatefulWidget {
  final Widget child;
  const NavigationView({
    super.key,
    required this.child,
  });

  @override
  State<NavigationView> createState() => NavigationViewState();
}

class NavigationViewState extends State<NavigationView> {
  static final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  static void openDrawer() {
    if (_scaffoldKey.currentState == null) {
      return;
    }
    log("${_scaffoldKey.currentState}");
    _scaffoldKey.currentState!.openDrawer();
  }

  static void closeDrawer() {
    if (_scaffoldKey.currentState == null) {
      return;
    }
    _scaffoldKey.currentState!.closeDrawer();
  }

  @override
  Widget build(BuildContext context) {
    uiOverlay();
    return OrientationBuilder(builder: (context, orientation) {
      if (orientation == Orientation.landscape) {
        return Scaffold(
          key: _scaffoldKey,
          drawer: ProfileDrawer(),
          backgroundColor: context.color.background,
          body: Center(
            child: VText(
              "Mohon ubah jadi landscape",
              fontSize: 24.sp,
            ),
          ),
        );
      }
      return Scaffold(
        key: _scaffoldKey,
        backgroundColor: context.color.background,
        body: widget.child,
        bottomNavigationBar: const BottomNav(),
        floatingActionButtonLocation: const NavFabDocked(),
        floatingActionButton: const SRFab(),
      );
    });
  }
}
