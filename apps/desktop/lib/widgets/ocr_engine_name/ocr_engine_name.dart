import 'package:biyi_app/models/ext_ocr_engine_config.dart';
import 'package:deftui/deftui.dart';

class OcrEngineName extends StatelessWidget {
  const OcrEngineName(
    this.ocrEngineConfig, {
    super.key,
  });

  final OcrEngineConfig ocrEngineConfig;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Text.rich(
      TextSpan(
        text: ocrEngineConfig.typeName,
        children: [
          TextSpan(
            text: ' (${ocrEngineConfig.id})',
            style: themeData.vars.bodySmall.copyWith(
              color: Colors.neutral.shade400,
            ),
          ),
        ],
      ),
    );
  }
}
