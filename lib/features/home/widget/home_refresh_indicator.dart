import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:sr_ui/core/core.dart';

class HomeRefreshIndicator {
  static Widget buildRefreshIndicator(
    BuildContext context,
    RefreshIndicatorMode refreshState,
    double pulledExtent,
    double refreshTriggerPullDistance,
    double refreshIndicatorExtent,
  ) {
    final double percentageComplete =
        clampDouble(pulledExtent / refreshTriggerPullDistance, 0.0, 1.0);

    // Place the indicator at the top of the sliver that opens up. We're using a
    // Stack/Positioned widget because the CupertinoActivityIndicator does some
    // internal translations based on the current size (which grows as the user drags)
    // that makes Padding calculations difficult. Rather than be reliant on the
    // internal implementation of the activity indicator, the Positioned widget allows
    // us to be explicit where the widget gets placed. The indicator should appear
    // over the top of the dragged widget, hence the use of Clip.none.
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          _buildIndicatorForRefreshState(refreshState, 14, percentageComplete),
        ],
      ),
    );
  }

  static Widget _buildIndicatorForRefreshState(
      RefreshIndicatorMode refreshState,
      double radius,
      double percentageComplete) {
    log("Refresh stat ${refreshState.name}");
    switch (refreshState) {
      case RefreshIndicatorMode.drag:
        // While we're dragging, we draw individual ticks of the spinner while simultaneously
        // easing the opacity in. The opacity curve values here were derived using
        // Xcode through inspecting a native app running on iOS 13.5.
        const Curve opacityCurve = Interval(0.0, 0.35, curve: Curves.easeInOut);
        return Positioned(
          top: 10,
          left: 0.0,
          right: 0.0,
          child: Opacity(
            opacity: opacityCurve.transform(percentageComplete),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      case RefreshIndicatorMode.armed:
      case RefreshIndicatorMode.refresh:
      case RefreshIndicatorMode.done:
        // Once we're armed or performing the refresh, we just show the normal spinner.
        return Positioned(
          top: 2,
          left: 0.0,
          right: 0.0,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );

      case RefreshIndicatorMode.inactive:
        // Anything else doesn't show anything.
        return const SizedBox.shrink();
    }
  }
}
