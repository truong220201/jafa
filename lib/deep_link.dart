import 'package:uni_links/uni_links.dart';

Future<String?> getInitialDeepLink() async {
  try {
    final initialLink = await getInitialLink();
    print(initialLink);
    return initialLink;
  } catch (e) {
    print(e);
    return null;
  }
}
