library debug_gate;

import 'package:flutter/material.dart';

/// This widget shows the your original screen when the screen is hit repeatedly.
class DebugGate extends StatefulWidget {
  final int tapCount;
  final bool enable;
  final Duration tapInterval;
  final Widget child;
  final Widget Function(BuildContext) debugMenuBuilder;

  /// This widget shows the screen [debugMenuBuilder] builds when the user taps the screen [tapCount] in [tapInterval].
  ///
  /// This widget shows the specified menu on debug mode (debug build) except [enable] is specified.
  const DebugGate(
      {@required this.tapCount,
      @required this.tapInterval,
      @required this.child,
      @required this.debugMenuBuilder,
      this.enable,
      Key key})
      : super(key: key);

  @override
  _DebugGateState createState() => _DebugGateState();
}

class _DebugGateState extends State<DebugGate> {
  int _count;

  @override
  void initState() {
    super.initState();
    _count = 0;
  }

  void _handleTap() {
    _count++;
    Future.delayed(widget.tapInterval, () {
      if (_count > 0) {
        _count--;
      }
    });

    if (_shouldShow) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: widget.debugMenuBuilder,
            fullscreenDialog: true,
          ));
    }
  }

  bool get _shouldShow => _enable && _enoughCount;

  bool get _enoughCount => _count % widget.tapCount == (widget.tapCount - 1);

  bool get _enable {
    bool debugBuild = false;
    assert(() {
      debugBuild = true;
      return true;
    }());
    return widget.enable ?? debugBuild;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: widget.child,
    );
  }
}
