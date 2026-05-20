/// Identifies why the user is on the verification screen.
enum VerifyFlow {
  signup,
  forgotPassword;

  static VerifyFlow fromQuery(String? value) {
    return switch (value) {
      'forgot_password' => VerifyFlow.forgotPassword,
      _ => VerifyFlow.signup,
    };
  }

  String get queryValue => switch (this) {
        VerifyFlow.signup => 'signup',
        VerifyFlow.forgotPassword => 'forgot_password',
      };
}
