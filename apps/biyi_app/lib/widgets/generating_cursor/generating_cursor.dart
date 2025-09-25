import 'package:uikit/uikit.dart';

class GeneratingCursor extends StatefulWidget {
  const GeneratingCursor({super.key});

  @override
  State<GeneratingCursor> createState() => _GeneratingCursorState();
}

class _GeneratingCursorState extends State<GeneratingCursor>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(left: 2),
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Text(
            '|',
            style: themeData.typography.base.copyWith(
              height: 1.4,
            ),
          );
        },
      ),
    );
  }
}
