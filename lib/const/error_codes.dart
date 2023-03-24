import 'api_error_model.dart';

/// List of available Error Codes derived from this app (Front end)
class FrontendErrors {
  FrontendErrors._();

  static ApiErrorModel get apiConnectionTimeout =>
      const ApiErrorModel(error: "ApiTimeOut");
}

/// List of available Error Codes derived from backend
class BackendErrors {
  BackendErrors._();

  static ApiErrorModel get forbidden => const ApiErrorModel(error: "Forbidden");

  static ApiErrorModel get unknown => const ApiErrorModel(error: "Unknown");
}
