import 'dart:async';

import 'package:deftui/deftui.dart';
import 'package:flutter/widgets.dart' show WidgetsBinding;
import 'package:go_router/go_router.dart';

import '../../widgets/page_scaffold.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Timer? _redirectTimer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      _redirectTimer = Timer(const Duration(milliseconds: 600), () {
        if (!mounted) return;
        context.replace('/settings/general');
      });
    });
  }

  @override
  void dispose() {
    _redirectTimer?.cancel();
    super.dispose();
  }

  Widget _buildBody(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 36,
            height: 36,
            child: Loader(
              color: theme.vars.colorPrimary,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Loading...',
            style: theme.vars.bodyMedium,
          ),
        ],
      ),
    );
  }

  Widget _build(BuildContext context) {
    return PageScaffold(child: _buildBody(context));
  }

  @override
  Widget build(BuildContext context) {
    return _build(context);
  }
}
