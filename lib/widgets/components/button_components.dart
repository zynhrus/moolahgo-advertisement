import 'package:moolahgo/main.import.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key key,
    this.title,
    this.width = double.infinity,
    this.onTap,
    this.color,
  }) : super(key: key);

  final String title;
  final double width;
  final Color color;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: 55,
        decoration: BoxDecoration(
            color: color == null ? Theme.of(context).primaryColor : color,
            borderRadius: BorderRadius.circular(defaultBorderRadius)),
        child: Center(
          child: TypographyCustom.bodyText.bodyCustomSize(
            title,
            fontSize: 18,
            fontWeight: medium,
            color: Theme.of(context).appBarTheme.color,
          ),
        ),
      ),
    );
  }
}
