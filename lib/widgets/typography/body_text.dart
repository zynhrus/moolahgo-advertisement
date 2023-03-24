import 'package:moolahgo/main.import.dart';
import 'package:moolahgo/main.library.dart';

class _BodyTextBuilder extends StatelessWidget {
  final String data;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final int maxLines;
  final TextOverflow overflow;
  final Color color;
  final bool autoSizeEnabled;
  final double height;

  const _BodyTextBuilder(
    this.data, {
    Key key,
    this.fontSize,
    this.fontWeight,
    this.textAlign,
    this.maxLines,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.height,
    this.autoSizeEnabled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.bodyText1.copyWith(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight ?? regular,
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

    return Text(
      data,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: style,
    );
  }
}

class BodyText {
  Widget body1Bold(String data,
          {TextAlign textAlign,
          int maxLines,
          TextOverflow overflow,
          Color color,
          double height,
          bool autoSizeEnabled = false}) =>
      _BodyTextBuilder(
        data,
        fontSize: 16,
        fontWeight: bold,
        color: color,
        maxLines: maxLines,
        height: height,
        overflow: overflow,
        textAlign: textAlign,
        autoSizeEnabled: autoSizeEnabled,
      );

  Widget body2Bold(String data,
          {TextAlign textAlign,
          int maxLines,
          TextOverflow overflow,
          Color color,
          double height,
          bool autoSizeEnabled = false}) =>
      _BodyTextBuilder(
        data,
        fontSize: 14,
        fontWeight: bold,
        color: color,
        maxLines: maxLines,
        overflow: overflow,
        height: height,
        textAlign: textAlign,
        autoSizeEnabled: autoSizeEnabled,
      );

  Widget body1Medium(String data,
          {TextAlign textAlign,
          int maxLines,
          TextOverflow overflow,
          Color color,
          double height,
          bool autoSizeEnabled = false}) =>
      _BodyTextBuilder(
        data,
        fontSize: 16,
        fontWeight: regular,
        color: color,
        maxLines: maxLines,
        overflow: overflow,
        height: height,
        textAlign: textAlign,
        autoSizeEnabled: autoSizeEnabled,
      );

  Widget body2Medium(String data,
          {TextAlign textAlign,
          int maxLines,
          TextOverflow overflow,
          Color color,
          double height,
          bool autoSizeEnabled = false}) =>
      _BodyTextBuilder(
        data,
        fontSize: 14,
        fontWeight: regular,
        color: color,
        maxLines: maxLines,
        overflow: overflow,
        height: height,
        textAlign: textAlign,
        autoSizeEnabled: autoSizeEnabled,
      );

  Widget bodyCustomSize(String data,
          {TextAlign textAlign,
          int maxLines,
          double fontSize,
          TextOverflow overflow,
          Color color,
          double height,
          FontWeight fontWeight,
          bool autoSizeEnabled = false}) =>
      _BodyTextBuilder(
        data,
        fontSize: fontSize ?? 16,
        fontWeight: fontWeight ?? regular,
        color: color,
        maxLines: maxLines,
        overflow: overflow,
        height: height,
        textAlign: textAlign,
        autoSizeEnabled: autoSizeEnabled,
      );
}
