import 'package:deftui/deftui.dart';
import 'package:uni_translate_client/uni_translate_client.dart';

class WordTagView extends StatelessWidget {
  const WordTagView(
    this.wordTag, {
    super.key,
  });

  final WordTag wordTag;

  @override
  Widget build(BuildContext context) {
    return Badge(
      child: Text(wordTag.name),
    );
  }
}
