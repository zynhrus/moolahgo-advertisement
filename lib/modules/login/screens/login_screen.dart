import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moolahgo/main.import.dart';
import 'package:moolahgo/modules/home/home.dart';
import 'package:moolahgo/modules/login/cubit/cubits.dart';
import 'package:moolahgo/modules/login/models/models.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key key}) : super(key: key);

  final TextEditingController usernameController =
      TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        body: BlocProvider(
          create: (context) => getIt.get<LoginCubit>(),
          child: Padding(
            padding: EdgeInsets.all(defaultMargin),
            child: _buildBody(context),
          ),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 50),
          _title(),
          SizedBox(height: 30),
          _formSection(context),
        ],
      ),
    );
  }

  Widget _formSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).appBarTheme.color,
        borderRadius: BorderRadius.circular(defaultBorderRadius),
      ),
      child: Column(
        children: [
          SizedBox(height: 20),
          _emailTextField(),
          SizedBox(height: 20),
          _passwordTextField(),
          SizedBox(height: 60),
          _getStartedButton(context),
        ],
      ),
    );
  }

  Widget _getStartedButton(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        } else if (state is LoginFailed) {
          _scaffoldKey.currentState.showSnackBar(
            new SnackBar(
              backgroundColor: Theme.of(context).errorColor,
              content: new Text(
                  'Login Failed! Please check your username or password again'),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is LoginLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return CustomButton(
          title: "Sign In",
          onTap: () {
            context.read<LoginCubit>().login(
                  loginData: LoginModel(
                    userName: usernameController.text,
                    password: passwordController.text,
                  ),
                );
          },
        );
      },
    );
  }

  Widget _passwordTextField() {
    return CustomTextField(
      name: "Password",
      hint: "Your password",
      isObscure: true,
      controller: passwordController,
    );
  }

  Widget _emailTextField() {
    return CustomTextField(
      name: "Username",
      hint: "Your username",
      controller: usernameController,
    );
  }

  Widget _title() {
    return TypographyCustom.subheading.subHeadingCustom(
      "Sign in with your \nexisting account",
      fontSize: 24,
      fontWeight: semiBold,
    );
  }
}
