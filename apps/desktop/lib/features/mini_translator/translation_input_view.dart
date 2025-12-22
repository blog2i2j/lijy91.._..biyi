import 'dart:ui';

import 'package:biyi_app/i18n/strings.g.dart';
import 'package:biyi_app/models/settings_base.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:screen_capturer/screen_capturer.dart';
import 'package:deftui/deftui.dart';

class TranslationInputView extends StatelessWidget {
  const TranslationInputView({
    super.key,
    required this.focusNode,
    required this.controller,
    required this.onChanged,
    this.capturedData,
    required this.isTextDetecting,
    required this.translationMode,
    required this.onTranslationModeChanged,
    required this.inputSubmitMode,
    required this.onClickExtractTextFromScreenCapture,
    required this.onClickExtractTextFromClipboard,
    required this.onButtonTappedClear,
    required this.onButtonTappedTrans,
  });

  final FocusNode focusNode;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  final CapturedData? capturedData;
  final bool isTextDetecting;

  final TranslationMode translationMode;
  final ValueChanged<TranslationMode> onTranslationModeChanged;
  final InputSubmitMode inputSubmitMode;

  final VoidCallback onClickExtractTextFromScreenCapture;
  final VoidCallback onClickExtractTextFromClipboard;

  final VoidCallback onButtonTappedClear;
  final VoidCallback onButtonTappedTrans;

  final bool isAddedToVocabulary = true;

  Widget _buildToolbarItems(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Row(
      spacing: 6,
      children: [
        Tooltip(
          message: t.app.home.tip_translation_mode(
            mode: translationMode.displayName,
          ),
          child: Button(
            variant: translationMode == TranslationMode.auto
                ? ButtonVariant.filled
                : ButtonVariant.outlined,
            child: Builder(
              builder: (context) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    const Icon(FluentIcons.target_20_regular),
                    if (translationMode == TranslationMode.auto)
                      Positioned(
                        bottom: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            color: themeData.vars.colorPrimary,
                            borderRadius: BorderRadius.circular(2),
                          ),
                          padding: const EdgeInsets.only(
                            left: 2,
                            right: 2,
                            top: 1.4,
                            bottom: 1.4,
                          ),
                          child: const Text(
                            'AUTO',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 5.4,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
            onPressed: () {
              TranslationMode newTranslationMode =
                  translationMode == TranslationMode.auto
                  ? TranslationMode.manual
                  : TranslationMode.auto;
              onTranslationModeChanged(newTranslationMode);
            },
          ),
        ),
        const SizedBox(
          width: 1,
          height: 20,
          child: VerticalDivider(thickness: 1),
        ),
        Tooltip(
          message: t.app.home.tip_extract_text_from_screen_capture,
          child: Button(
            onPressed: onClickExtractTextFromScreenCapture,
            child: const Icon(FluentIcons.crop_20_regular),
          ),
        ),
        Tooltip(
          message: t.app.home.tip_extract_text_from_clipboard,
          child: Button(
            onPressed: onClickExtractTextFromClipboard,
            child: const Icon(FluentIcons.clipboard_text_ltr_20_regular),
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(minWidth: 56),
          child: Button(
            onPressed: onButtonTappedClear,
            child: Text(t.app.home.btn_clear),
          ),
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(minWidth: 56),
          child: Button(
            onPressed: onButtonTappedTrans,
            child: Text(t.app.home.btn_trans),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Card(
      // margin: const EdgeInsets.only(
      //   left: 12,
      //   right: 12,
      //   top: 0,
      //   bottom: 12,
      // ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.zero,
            child: Stack(
              children: [
                TextField(
                  focusNode: focusNode,
                  decoration: const BoxDecoration(color: Color(0x00000000)),
                  selectionHeightStyle: BoxHeightStyle.max,
                  controller: controller,
                  padding: const EdgeInsets.only(
                    left: 12,
                    right: 12,
                    top: 14,
                    bottom: 12,
                  ),
                  style: themeData.vars.bodyMedium.copyWith(height: 1.2),
                  placeholder: t.app.home.input_hint,
                  // placeholder: Text(
                  //   t.app.home.input_hint,
                  //   style: themeData.vars.bodyMedium.copyWith(
                  //     color: themeData.vars.bodyMedium.color?.withValues(
                  //       alpha: 0.5,
                  //     ),
                  //     height: 1.2,
                  //   ),
                  // ),
                  maxLines: inputSubmitMode == InputSubmitMode.enter ? 1 : 6,
                  minLines: 1,
                  onChanged: onChanged,
                  onSubmitted: (newValue) {
                    onButtonTappedTrans();
                  },
                ),
                if (isTextDetecting)
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 0,
                    bottom: 0,
                    child: Container(
                      padding: const EdgeInsets.only(left: 12, right: 12),
                      color: themeData.vars.colorSurface,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              SpinKitDoubleBounce(
                                color: themeData.vars.colorPrimary,
                                size: 18.0,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                t.app.home.text_extracting_text,
                                style: TextStyle(
                                  color: themeData.vars.colorPrimary,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                          Expanded(child: Container()),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Divider(height: 1),
          ),
          Container(
            padding: const EdgeInsets.only(
              left: 8,
              right: 12,
              top: 8,
              bottom: 8,
            ),
            child: Row(
              children: [
                _buildToolbarItems(context),
                Expanded(child: Container()),
                _buildActionButtons(context),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
