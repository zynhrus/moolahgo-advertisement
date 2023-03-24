import 'package:moolahgo/main.library.dart';

@injectable
class AuthInterceptor extends Interceptor {
  @override
  Future onRequest(RequestOptions options) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");
    final Map<String, String> additionalHeaders = <String, String>{
      'Content-Type': "application/json",
      // For easier to add if we need to add token in header Authorization
      // 'Authorization':
      //     "Bearer 3yeewer23r283ru283ru283ru283ru283r",
    };

    final Map<String, String> additionalBody = <String, String>{
      'token': token,
    };

    //will pass any override value
    final Map<String, String> overrideHeaders =
        options.headers.cast<String, String>();
    final Map<String, String> overrideBody =
        options.queryParameters.cast<String, String>();

    additionalHeaders.addAll(overrideHeaders);
    overrideBody.addAll(overrideBody);

    options.data ??= {};

    options.headers.addAll(additionalHeaders);
    options.data.addAll(additionalBody);

    return options;
  }
}
