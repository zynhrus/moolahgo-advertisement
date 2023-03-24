import 'package:moolahgo/main.import.dart';
import 'package:moolahgo/main.library.dart';

class _SubheadingTextBuilder extends StatelessWidget {
  final String data;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final int maxLines;
  final double fontSize;
  final TextOverflow overflow;
  final Color color;
  final bool autoSizeEnabled;
  final bool asMarkdown;
  final double height;
  final List<Shadow> shadows;

  const _SubheadingTextBuilder(this.data,
      {Key key,
      this.fontWeight,
      this.textAlign,
      this.maxLines,
      this.fontSize,
      this.overflow = TextOverflow.ellipsis,
      this.color,
      this.height,
      this.shadows,
      this.autoSizeEnabled = false,
      this.asMarkdown = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.subtitle1.copyWith(
        color: color,
        fontSize: fontSize ?? 14,
        fontWeight: fontWeight,
        shadows: shadows,
        height: height);

    if (autoSizeEnabled) {
      return AutoSizeText(data,
          textAlign: textAlign,
          maxLines: maxLines,
          overflow: overflow,
          style: style);
    }

    return Text(data,
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
        style: style);
  }
}

class SubheadingText {
  Widget subHeading1bold(
    String data, {
    TextAlign textAlign,
    int maxLines,
    TextOverflow overflow,
    Color color,
    double height,
    bool autoSizeEnabled = false,
  }) =>
      _SubheadingTextBuilder(
        data,
        color: color,
        fontSize: 16,
        maxLines: maxLines,
        overflow: overflow,
        height: height,
        fontWeight: bold,
        textAlign: textAlign,
        autoSizeEnabled: autoSizeEnabled,
      );

  Widget subHeading1medium(
    String data, {
    TextAlign textAlign,
    int maxLines,
    TextOverflow overflow,
    Color color,
    double height,
    bool autoSizeEnabled = false,
  }) =>
      _SubheadingTextBuilder(
        data,
        color: color,
        fontSize: 16,
        maxLines: maxLines,
        overflow: overflow,
        height: height,
        fontWeight: medium,
        textAlign: textAlign,
        autoSizeEnabled: autoSizeEnabled,
      );

  Widget subHeading2bold(
    String data, {
    TextAlign textAlign,
    int maxLines,
    TextOverflow overflow,
    Color color,
    double height,
    bool autoSizeEnabled = false,
  }) =>
      _SubheadingTextBuilder(
        data,
        color: color,
        fontSize: 14,
        maxLines: maxLines,
        overflow: overflow,
        height: height,
        fontWeight: bold,
        textAlign: textAlign,
        autoSizeEnabled: autoSizeEnabled,
      );

  Widget subHeading2medium(
    String data, {
    TextAlign textAlign,
    int maxLines,
    TextOverflow overflow,
    Color color,
    double height,
    bool autoSizeEnabled = false,
  }) =>
      _SubheadingTextBuilder(
        data,
        color: color,
        fontSize: 14,
        maxLines: maxLines,
        overflow: overflow,
        height: height,
        fontWeight: medium,
        textAlign: textAlign,
        autoSizeEnabled: autoSizeEnabled,
      );

  Widget subHeadingCustom(
    String data, {
    TextAlign textAlign,
    int maxLines,
    double fontSize,
    TextOverflow overflow,
    FontWeight fontWeight,
    Color color,
    double height,
    List<Shadow> shadows,
    bool autoSizeEnabled = false,
  }) =>
      _SubheadingTextBuilder(
        data,
        color: color,
        fontSize: fontSize,
        maxLines: maxLines,
        overflow: overflow,
        height: height,
        shadows: shadows,
        fontWeight: fontWeight ?? medium,
        textAlign: textAlign,
        autoSizeEnabled: autoSizeEnabled,
      );
}
