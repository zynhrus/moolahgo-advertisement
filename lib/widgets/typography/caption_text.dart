import 'package:moolahgo/main.import.dart';
import 'package:moolahgo/main.library.dart';

class _CaptionTextBuilder extends StatelessWidget {
  final String data;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final int maxLines;
  final TextOverflow overflow;
  final Color color;
  final bool autoSizeEnabled;
  final double height;

  const _CaptionTextBuilder(this.data,
      {Key key,
      this.fontSize,
      this.fontWeight,
      this.textAlign,
      this.maxLines,
      this.overflow = TextOverflow.ellipsis,
      this.height,
      this.color,
      this.autoSizeEnabled = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle style = Theme.of(context).textTheme.caption.copyWith(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        height: height);
    if (autoSizeEnabled) {
      return AutoSizeText(
        data,
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
        style: style,
        minFontSize: 8,
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

class CaptionText {
  Widget caption1Bold(String data,
          {TextAlign textAlign,
          int maxLines,
          TextOverflow overflow,
          Color color,
          double height,
          bool autoSizeEnabled = false}) =>
      _CaptionTextBuilder(
        data,
        fontSize: 12,
        fontWeight: bold,
        color: color,
        maxLines: maxLines,
        overflow: overflow,
        textAlign: textAlign,
        autoSizeEnabled: autoSizeEnabled,
      );

  Widget caption2Bold(String data,
          {TextAlign textAlign,
          int maxLines,
          TextOverflow overflow,
          Color color,
          double height,
          bool autoSizeEnabled = false}) =>
      _CaptionTextBuilder(
        data,
        fontSize: 10,
        fontWeight: bold,
        color: color,
        height: height,
        maxLines: maxLines,
        overflow: overflow,
        textAlign: textAlign,
        autoSizeEnabled: autoSizeEnabled,
      );

  Widget caption1Medium(String data,
          {TextAlign textAlign,
          int maxLines,
          TextOverflow overflow,
          Color color,
          double height,
          bool autoSizeEnabled = false}) =>
      _CaptionTextBuilder(
        data,
        fontSize: 12,
        fontWeight: regular,
        color: color,
        height: height,
        maxLines: maxLines,
        overflow: overflow,
        textAlign: textAlign,
        autoSizeEnabled: autoSizeEnabled,
      );

  Widget caption2Medium(String data,
          {TextAlign textAlign,
          int maxLines,
          TextOverflow overflow,
          Color color,
          double height,
          bool autoSizeEnabled = false}) =>
      _CaptionTextBuilder(
        data,
        fontSize: 10,
        fontWeight: regular,
        color: color,
        height: height,
        maxLines: maxLines,
        overflow: overflow,
        textAlign: textAlign,
        autoSizeEnabled: autoSizeEnabled,
      );

  Widget captionCustom(String data,
          {TextAlign textAlign,
          int maxLines,
          double fontSize,
          FontWeight fontWeight,
          TextOverflow overflow,
          Color color,
          double height,
          bool autoSizeEnabled = false}) =>
      _CaptionTextBuilder(
        data,
        fontSize: fontSize ?? 12,
        fontWeight: fontWeight ?? regular,
        color: color,
        maxLines: maxLines,
        overflow: overflow,
        height: height,
        textAlign: textAlign,
        autoSizeEnabled: autoSizeEnabled,
      );
}
