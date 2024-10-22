import 'package:sr_ui/core/core.dart';

CustomTransitionPage BasicPage({
  required Widget child,
  LocalKey? key,
}) {
  return CustomTransitionPage(
    child: child,
    key: key,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(-1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
