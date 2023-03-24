import 'package:moolahgo/main.import.dart';
import 'package:moolahgo/main.library.dart';

class _HeadingTextBuilder extends StatelessWidget {
  final String data;
  final double fontSize;
  final TextAlign textAlign;
  final int maxLines;
  final TextOverflow overflow;
  final Color color;
  final bool autoSizeEnabled;
  final bool asMarkdown;
  final double height;
  final FontWeight fontWeight;

  const _HeadingTextBuilder(this.data,
      {Key key,
      this.fontSize,
      this.textAlign,
      this.maxLines,
      this.overflow = TextOverflow.ellipsis,
      this.color,
      this.height,
      this.fontWeight,
      this.autoSizeEnabled = false,
      this.asMarkdown = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.headline1.copyWith(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight ?? bold,
        height: height);
    if (autoSizeEnabled) {
      return AutoSizeText(
        data,
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
        style: style,
      );
    }

    return Text(data,
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
        style: style);
  }
}

class HeadingText {
  Widget h1(
    String data, {
    TextAlign textAlign,
    int maxLines,
    TextOverflow overflow,
    Color color,
    double height,
    bool autoSizeEnabled = false,
  }) =>
      _HeadingTextBuilder(
        data,
        fontSize: 28,
        color: color,
        maxLines: maxLines,
        overflow: overflow,
        height: height,
        textAlign: textAlign,
        autoSizeEnabled: autoSizeEnabled,
      );

  Widget h2(
    String data, {
    TextAlign textAlign,
    int maxLines,
    TextOverflow overflow,
    Color color,
    double height,
    bool autoSizeEnabled = false,
  }) =>
      _HeadingTextBuilder(
        data,
        fontSize: 24,
        color: color,
        maxLines: maxLines,
        overflow: overflow,
        height: height,
        textAlign: textAlign,
        autoSizeEnabled: autoSizeEnabled,
      );

  Widget h3(
    String data, {
    TextAlign textAlign,
    int maxLines,
    TextOverflow overflow,
    Color color,
    double height,
    bool autoSizeEnabled = false,
  }) =>
      _HeadingTextBuilder(
        data,
        fontSize: 20,
        color: color,
        maxLines: maxLines,
        overflow: overflow,
        height: height,
        textAlign: textAlign,
        autoSizeEnabled: autoSizeEnabled,
      );

  Widget h4(
    String data, {
    TextAlign textAlign,
    int maxLines,
    TextOverflow overflow,
    Color color,
    double height,
    bool autoSizeEnabled = false,
  }) =>
      _HeadingTextBuilder(
        data,
        fontSize: 16,
        color: color,
        maxLines: maxLines,
        overflow: overflow,
        height: height,
        textAlign: textAlign,
        autoSizeEnabled: autoSizeEnabled,
      );

  Widget h5(
    String data, {
    TextAlign textAlign,
    int maxLines,
    TextOverflow overflow,
    Color color,
    double height,
    bool autoSizeEnabled = false,
  }) =>
      _HeadingTextBuilder(
        data,
        fontSize: 14,
        color: color,
        maxLines: maxLines,
        overflow: overflow,
        height: height,
        textAlign: textAlign,
        autoSizeEnabled: autoSizeEnabled,
      );

  Widget h6(
    String data, {
    TextAlign textAlign,
    int maxLines,
    TextOverflow overflow,
    Color color,
    double height,
    bool autoSizeEnabled = false,
  }) =>
      _HeadingTextBuilder(
        data,
        fontSize: 12,
        color: color,
        maxLines: maxLines,
        overflow: overflow,
        height: height,
        textAlign: textAlign,
        autoSizeEnabled: autoSizeEnabled,
      );

  Widget hCustom(
    String data, {
    TextAlign textAlign,
    int maxLines,
    double fontSize,
    TextOverflow overflow,
    Color color,
    double height,
    FontWeight fontWeight,
    bool autoSizeEnabled = false,
  }) =>
      _HeadingTextBuilder(
        data,
        fontSize: fontSize ?? 28,
        color: color,
        maxLines: maxLines,
        overflow: overflow,
        height: height,
        fontWeight: fontWeight,
        textAlign: textAlign,
        autoSizeEnabled: autoSizeEnabled,
      );
}
