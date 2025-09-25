import 'package:biyi_app/app/home/desktop_popup.dart';
import 'package:biyi_app/app/home/tab_homepage.dart';
import 'package:biyi_app/app/home/tab_settings.dart';
import 'package:biyi_app/app/home/tab_vocabulary.dart';
import 'package:uikit/uikit.dart';
import 'package:uni_platform/uni_platform.dart';

const _kHomeTabHomepage = 0;

class TabBarItem extends BottomNavigationBarItem {
  const TabBarItem({
    required super.icon,
    required String super.label,
    required Widget super.activeIcon,
  });
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = _kHomeTabHomepage;

  Widget _buildBody(BuildContext context) {
    return IndexedStack(
      index: _selectedIndex,
      children: const [
        TabHomepageScene(),
        TabVocabularyScene(),
        TabSettingsScene(),
      ],
    );
  }

  Widget _build(BuildContext context) {
    return PageScaffold(
      child: _buildBody(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (UniPlatform.isLinux ||
        UniPlatform.isMacOS ||
        UniPlatform.isWindows ||
        UniPlatform.isWeb) {
      return const DesktopPopupPage();
    }
    return _build(context);
  }
}
