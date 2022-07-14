import 'package:flutter/material.dart';
import 'package:matomo_tracker/matomo_tracker.dart';
import 'package:matomo_tracker/src/tracking_order_item.dart';


/// Register a `trackScreenWithName` on this widget.
@optionalTypeArgs
mixin TraceableClientMixin<T extends StatefulWidget> on State<T> {
  /// Equivalent to an event action. (e.g. `'Created HomePage'`)
  @protected
  String get traceName => 'Created widget ${widget.toStringShort()}';

  /// Equivalent to an event name. (e.g. `'HomePage'`)
  @protected
  String get traceTitle;

  /// A 6 character unique ID. If `null`, a random id will be generated.
  @protected
  String? widgetId;

  /// Path to the widget. (e.g. `'/home'`)
  @protected
  String? path;

  /// Matomo instance used to send events.
  ///
  /// By default it uses the global [MatomoTracker.instance].
  @protected
  MatomoTracker get tracker => MatomoTracker.instance;

  @override
  void initState() {
    super.initState();
    _startTracking();
  }

  void _startTracking() {
    tracker.trackScreenWithName(
      widgetName: traceName,
      eventName: traceTitle,
      currentScreenId: widgetId,
      path: path,
    );
  }
}
