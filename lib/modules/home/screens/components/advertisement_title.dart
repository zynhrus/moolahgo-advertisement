import 'package:moolahgo/main.import.dart';
import 'view_state.dart';

class AdvertisementTitleContent extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final List<Shadow> shadows;

  const AdvertisementTitleContent({
    Key key,
    this.text,
    this.fontSize,
    this.color,
    this.shadows,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: TypographyCustom.subheading.subHeadingCustom(
        text,
        fontSize: fontSize,
        color: color,
        shadows: shadows,
      ),
    );
  }
}

class AdvertisementTitle extends StatefulWidget {
  final String title;
  final ViewState viewState;
  final Color color;
  final List<Shadow> shadows;
  final double smallFontSize;
  final double largeFontSize;

  const AdvertisementTitle({
    Key key,
    @required this.title,
    @required this.viewState,
    this.color,
    this.shadows,
    this.smallFontSize = 15.0,
    this.largeFontSize = 40.0,
  }) : super(key: key);

  @override
  _AdvertisementTitleState createState() => _AdvertisementTitleState();
}

class _AdvertisementTitleState extends State<AdvertisementTitle>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _fontSizeTween;

  double fontSize;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 330),
    )..addListener(() {
        setState(() {
          fontSize = _fontSizeTween.value;
        });
      });

    switch (widget.viewState) {
      case ViewState.enlarge:
        _fontSizeTween = Tween<double>(
          begin: widget.smallFontSize,
          end: widget.largeFontSize,
        ).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeInOut,
          ),
        );

        _animationController.forward(from: 0.0);
        break;

      case ViewState.enlarged:
        fontSize = widget.largeFontSize;
        break;

      case ViewState.shrink:
        _fontSizeTween = Tween<double>(
          begin: widget.largeFontSize,
          end: widget.smallFontSize,
        ).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeInOut,
          ),
        );

        _animationController.forward(from: 0.0);
        break;

      case ViewState.shrunk:
        fontSize = widget.smallFontSize;
        break;
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AdvertisementTitleContent(
      text: widget.title,
      fontSize: fontSize,
      color: widget.color,
      shadows: widget.shadows,
    );
  }
}
