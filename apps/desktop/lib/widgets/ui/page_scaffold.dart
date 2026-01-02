import 'package:flutter/material.dart' show Scaffold;
import 'package:deftui/deftui.dart';

/// A scaffold that provides a page layout.
///
/// This is a wrapper around [Scaffold] that provides a navigation bar and a
/// child.
class PageScaffold extends StatelessWidget {
  const PageScaffold({
    super.key,
    this.navigationBar,
    this.backgroundColor,
    this.child,
  });

  /// The navigation bar of the page.
  final PreferredSizeWidget? navigationBar;

  /// The background color of the page.
  final Color? backgroundColor;

  /// The content of the page.
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.vars.colorSurface,
      appBar: navigationBar,
      body: child,
    );
  }
}
