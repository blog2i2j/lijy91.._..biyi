import 'dart:io';

import 'package:biyi_app/routes/settings/appearance/page.dart';
import 'package:biyi_app/routes/settings/language/page.dart';
import 'package:biyi_app/routes/settings/ocr_engines/page.dart';
import 'package:biyi_app/routes/settings/translation_engines/page.dart';
import 'package:flutter/material.dart' hide Card, Theme, Scaffold, Divider;
import 'package:go_router/go_router.dart';
import 'package:biyi_app/routes/settings/about/page.dart';
import 'package:biyi_app/routes/settings/advanced/page.dart';
import 'package:biyi_app/routes/settings/general/page.dart';
import 'package:deftui/deftui.dart' hide Colors;
import 'package:biyi_app/routes/settings/keybinds/page.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';

import 'package:biyi_app/i18n/strings.g.dart';

import '../../widgets/ui/page_scaffold.dart';

part 'route.g.dart';

@TypedShellRoute<SettingsShellRoute>(
  routes: [
    TypedGoRoute<KeybindsSettingsRoute>(
      path: '/settings/keybinds',
      name: 'KeybindsSettings',
    ),
    TypedGoRoute<LanguageSettingsRoute>(
      path: '/settings/language',
      name: 'LanguageSettings',
    ),
    TypedGoRoute<AppearanceSettingsRoute>(
      path: '/settings/appearance',
      name: 'AppearanceSettings',
    ),
    TypedGoRoute<GeneralSettingsRoute>(
      path: '/settings/general',
      name: 'GeneralSettings',
    ),
    TypedGoRoute<OcrEnginesSettingsRoute>(
      path: '/settings/ocr-engines',
      name: 'OcrEnginesSettings',
    ),
    TypedGoRoute<TranslationEnginesSettingsRoute>(
      path: '/settings/translation-engines',
      name: 'TranslationEnginesSettings',
    ),
    TypedGoRoute<AdvancedSettingsRoute>(
      path: '/settings/advanced',
      name: 'AdvancedSettings',
    ),
    TypedGoRoute<AboutSettingsRoute>(
      path: '/settings/about',
      name: 'AboutSettings',
    ),
  ],
)
class SettingsShellRoute extends ShellRouteData {
  const SettingsShellRoute();

  static final GlobalKey<NavigatorState> $navigatorKey =
      GlobalKey<NavigatorState>();

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    Widget navigator,
  ) {
    return SettingsLayout(child: navigator);
  }
}

class AppearanceSettingsRoute extends GoRouteData
    with $AppearanceSettingsRoute {
  const AppearanceSettingsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const AppearanceSettingPage();
}

class GeneralSettingsRoute extends GoRouteData with $GeneralSettingsRoute {
  const GeneralSettingsRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const NoTransitionPage<void>(
      child: GeneralSettingPage(),
    );
  }
}

class KeybindsSettingsRoute extends GoRouteData with $KeybindsSettingsRoute {
  const KeybindsSettingsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const KeybindsSettingPage();
}

class LanguageSettingsRoute extends GoRouteData with $LanguageSettingsRoute {
  const LanguageSettingsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const LanguageSettingPage();
}

class AdvancedSettingsRoute extends GoRouteData with $AdvancedSettingsRoute {
  const AdvancedSettingsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const AdvancedSettingPage();
}

class AboutSettingsRoute extends GoRouteData with $AboutSettingsRoute {
  const AboutSettingsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const AboutSettingPage();
}

class OcrEnginesSettingsRoute extends GoRouteData
    with $OcrEnginesSettingsRoute {
  const OcrEnginesSettingsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const OcrEnginesSettingPage();
}

class TranslationEnginesSettingsRoute extends GoRouteData
    with $TranslationEnginesSettingsRoute {
  const TranslationEnginesSettingsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const TranslationEnginesSettingPage();
}

class SettingsLayout extends StatelessWidget {
  const SettingsLayout({
    super.key,
    required this.child,
  });

  final Widget child;

  String _getPageTitle(String path) {
    if (path.contains('/general')) return t.app.settings.general.title;
    if (path.contains('/appearance')) return t.app.settings.appearance.title;
    if (path.contains('/keybinds')) return t.app.settings.keybinds.title;
    if (path.contains('/language')) return t.app.settings.language.title;
    if (path.contains('/advanced')) return t.app.settings.advanced.title;
    if (path.contains('/ocr-engines')) return t.app.settings.ocr_engines.title;
    if (path.contains('/translation-engines')) {
      return t.app.settings.translation_engines.title;
    }
    if (path.contains('/about')) return t.app.settings.about.title;
    return 'Settings';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final currentPath = GoRouterState.of(context).uri.path;
    final pageTitle = _getPageTitle(currentPath);

    return PageScaffold(
      child: Row(
        children: [
          Sidebar(
            collapsible: SidebarCollapsible.none,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SidebarContent(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SidebarGroup(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SidebarGroupLabel(
                              child: Text(t.app.settings.kLayout.navgroup.client),
                            ),
                            SidebarGroupContent(
                              child: SidebarMenu(
                                children: [
                                  SidebarMenuItem(
                                    child: SidebarMenuButton(
                                      icon: const Icon(
                                        FluentIcons.app_generic_20_regular,
                                      ),
                                      label: Text(t.app.settings.general.title),
                                      tooltip: t.app.settings.general.title,
                                      selected: currentPath == '/settings/general',
                                      onPressed: () => context.go('/settings/general'),
                                    ),
                                  ),
                                  SidebarMenuItem(
                                    child: SidebarMenuButton(
                                      icon: const Icon(
                                        FluentIcons.style_guide_20_regular,
                                      ),
                                      label: Text(t.app.settings.appearance.title),
                                      tooltip: t.app.settings.appearance.title,
                                      selected: currentPath == '/settings/appearance',
                                      onPressed: () =>
                                          context.go('/settings/appearance'),
                                    ),
                                  ),
                                  SidebarMenuItem(
                                    child: SidebarMenuButton(
                                      icon: const Icon(
                                        FluentIcons.keyboard_20_regular,
                                      ),
                                      label: Text(t.app.settings.keybinds.title),
                                      tooltip: t.app.settings.keybinds.title,
                                      selected: currentPath == '/settings/keybinds',
                                      onPressed: () => context.go('/settings/keybinds'),
                                    ),
                                  ),
                                  SidebarMenuItem(
                                    child: SidebarMenuButton(
                                      icon: const Icon(
                                        FluentIcons.local_language_20_regular,
                                      ),
                                      label: Text(t.app.settings.language.title),
                                      tooltip: t.app.settings.language.title,
                                      selected: currentPath == '/settings/language',
                                      onPressed: () => context.go('/settings/language'),
                                    ),
                                  ),
                                  SidebarMenuItem(
                                    child: SidebarMenuButton(
                                      icon: const Icon(
                                        FluentIcons.settings_20_regular,
                                      ),
                                      label: Text(t.app.settings.advanced.title),
                                      tooltip: t.app.settings.advanced.title,
                                      selected: currentPath == '/settings/advanced',
                                      onPressed: () => context.go('/settings/advanced'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      SidebarGroup(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SidebarGroupLabel(
                              child: Text(
                                t.app.settings.kLayout.navgroup.integrations,
                              ),
                            ),
                            SidebarGroupContent(
                              child: SidebarMenu(
                                children: [
                                  SidebarMenuItem(
                                    child: SidebarMenuButton(
                                      icon: const Icon(FluentIcons.scan_20_regular),
                                      label: Text(t.app.settings.ocr_engines.title),
                                      tooltip: t.app.settings.ocr_engines.title,
                                      selected: currentPath == '/settings/ocr-engines',
                                      onPressed: () =>
                                          context.go('/settings/ocr-engines'),
                                    ),
                                  ),
                                  SidebarMenuItem(
                                    child: SidebarMenuButton(
                                      icon:
                                          const Icon(FluentIcons.translate_20_regular),
                                      label: Text(
                                        t.app.settings.translation_engines.title,
                                      ),
                                      tooltip:
                                          t.app.settings.translation_engines.title,
                                      selected: currentPath ==
                                          '/settings/translation-engines',
                                      onPressed: () => context.go(
                                        '/settings/translation-engines',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      SidebarGroup(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SidebarGroupLabel(
                              child: Text(t.app.settings.kLayout.navgroup.resources),
                            ),
                            SidebarGroupContent(
                              child: SidebarMenu(
                                children: [
                                  SidebarMenuItem(
                                    child: SidebarMenuButton(
                                      icon: const Icon(FluentIcons.info_20_regular),
                                      label: Text(t.app.settings.about.title),
                                      tooltip: t.app.settings.about.title,
                                      selected: currentPath == '/settings/about',
                                      onPressed: () => context.go('/settings/about'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Main content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    left: 32,
                    right: 32,
                    top: Platform.isMacOS ? 56 : 24,
                    bottom: 24,
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: theme.vars.colorBorder,
                        width: 1,
                      ),
                    ),
                  ),
                  child: Text(
                    pageTitle,
                    style: theme.vars.headlineMedium,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(32),
                    child: child,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SettingsModalPage extends Page<void> {
  final Widget child;

  const SettingsModalPage({
    required this.child,
    super.key,
  });

  @override
  Route<void> createRoute(BuildContext context) {
    return DialogRoute<void>(
      context: context,
      settings: this,
      barrierDismissible: true,
      barrierColor: Colors.black.withValues(alpha: 0.35),
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(24),
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 1000,
            maxHeight: 700,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: child,
          ),
        ),
      ),
    );
  }
}
