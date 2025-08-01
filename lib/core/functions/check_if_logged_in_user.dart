import 'package:healix/core/helpers/extensions.dart';

import '../constants/constants.dart';
import '../helpers/shared_pref_helper.dart';
import '../helpers/shared_pref_keys.dart';

checkIfLoggedInUser() async {
  String? userToken =
      await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
  if (userToken.isNullOrEmpty()) {
    isLoggedInUser = false;
  } else {
    isLoggedInUser = true;
    userProfileImage =
        await SharedPrefHelper.getString(SharedPrefKeys.userPhotoUrl);
    userFullName =
        await SharedPrefHelper.getString(SharedPrefKeys.userFullName);
  }
}
