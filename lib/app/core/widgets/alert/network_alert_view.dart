class NetworkAlertView {
  NetworkAlertView._privateConstructor();

  static final NetworkAlertView _instance =
      NetworkAlertView._privateConstructor();

  static NetworkAlertView get instance => _instance;

  bool _isShowing = false;

  show() {
    if (_isShowing) {
      return;
    }

    // BuildContext? context = navigatorKey.currentContext;

    // if (context == null) {
    //   print('Global context is null');
    //   return;
    // }

    _isShowing = true;

    // context.showErrorMessage(
    //     message: message,
    //     dismissible: false,
    //     onCancel: () {
    //       _isShowing = false;
    //     });
  }
}
