import 'package:moolahgo/main.import.dart';
import 'package:moolahgo/main.library.dart';
import 'package:moolahgo/modules/home/home.dart';
import 'package:moolahgo/modules/login/login.dart';

class UserScreen extends StatelessWidget {
  final UserModel user;

  const UserScreen({
    Key key,
    @required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userData = user.data;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 100),
              ImagePlaceholder(
                width: 100,
                height: 100,
                imageFit: BoxFit.cover,
                shape: BoxShape.circle,
                imageUrl: userData.photo,
              ),
              SizedBox(height: 50),
              TypographyCustom.subheading.subHeading1medium("Username"),
              Text(userData.userName),
              SizedBox(height: 20),
              TypographyCustom.subheading.subHeading1medium("Gender"),
              Text(userData.gender),
              SizedBox(height: 20),
              TypographyCustom.subheading.subHeading1medium("Nationality"),
              Text(userData.nationality),
              Spacer(),
              _logOutButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _logOutButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: CustomButton(
        title: "Log Out",
        width: 100,
        color: Theme.of(context).errorColor,
        onTap: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.remove("token").then((value) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => LoginScreen(),
              ),
              (route) => false,
            );
          });
        },
      ),
    );
  }
}
