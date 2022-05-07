
import 'package:social_app/modules/login/social_login_screen.dart';
import 'package:social_app/shared/component/component.dart';
import 'package:social_app/shared/network/local/cache_helper.dart';

void signOut(context)
{
  CacheHelper.removeData(
    key: 'token',
  ).then((value)
  {
    if (value)
    {
      navigateAndFinish(
        context,
        SocialLoginScreen(),
      );
    }
  });
}

void printFullText(String text) {
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}

String token = '';

String uId = '';
