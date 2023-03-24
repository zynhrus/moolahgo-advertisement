import 'body_text.dart';
import 'caption_text.dart';
import 'heading_text.dart';
import 'subheading_text.dart';

/// [asMarkdown] will be checked only when [autoSizeEnabled] is false
abstract class TypographyCustom {
  const TypographyCustom._();
  static final HeadingText heading = HeadingText();
  static final SubheadingText subheading = SubheadingText();
  static final CaptionText caption = CaptionText();
  static final BodyText bodyText = BodyText();
}
