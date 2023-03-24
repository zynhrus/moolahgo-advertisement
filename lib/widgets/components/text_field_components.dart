import 'package:moolahgo/main.import.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key key, this.name, this.hint, this.controller, this.isObscure = false})
      : super(key: key);

  final String name;
  final String hint;
  final bool isObscure;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TypographyCustom.bodyText.body2Medium(name),
        SizedBox(height: 8),
        TextField(
          controller: controller,
          cursorColor: Theme.of(context).textTheme.bodyText1.color,
          obscureText: isObscure,
          decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(defaultBorderRadius),
              borderSide: BorderSide(color: Theme.of(context).primaryColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(defaultBorderRadius),
              borderSide: BorderSide(color: Theme.of(context).primaryColor),
            ),
          ),
        ),
      ],
    );
  }
}
