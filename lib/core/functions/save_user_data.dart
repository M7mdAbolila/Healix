import 'package:healix/core/constants/constants.dart';

import '../helpers/shared_pref_helper.dart';
import '../helpers/shared_pref_keys.dart';
import '../networking/dio_factory.dart';

saveUserData({required dynamic state}) {
  SharedPrefHelper.setSecuredString(
    SharedPrefKeys.userToken,
    state.response.token ?? '',
  );
  SharedPrefHelper.setData(
    SharedPrefKeys.userPhotoUrl,
    state.response.user?.user?.photoUrl ?? '',
  );
  SharedPrefHelper.setData(
    SharedPrefKeys.userFullName,
    '${state.response.user?.user?.fname ?? ''} ${state.response.user?.user?.lname ?? ''}',
  );
  DioFactory.setTokenIntoHeaderAfterLogin(state.response.token ?? '');
  userFullName =
      '${state.response.user?.user?.fname ?? ''} ${state.response.user?.user?.lname ?? ''}';
  userProfileImage = state.response.user?.user?.photoUrl ?? '';
}
