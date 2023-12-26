import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../configs/injector/injector.dart';
import '../../../core/models/app/exceptions.dart';
import '../../../core/models/request/get_user_status.dart';
import '../../../core/models/response/profile_model.dart';
import '../../../core/services/secure_local_storage.dart';
import '../../../data/repository/user_repository.dart';
import '../../../views/utils/exception_handler.dart';
import '../../../views/widgets/dialog/common_dialog.dart';

class UserProfileController extends GetxController {
  final userProfileRepository = getIt<UserRepository>();
  final secureLocalDataSource = getIt<SecureLocalStorageService>();
  final userInfo = Rx<ProfileModel?>(null);
  final userStatus = Rx<int?>(null);
  final refreshController = RefreshController(initialRefresh: true);

  // ignore: non_constant_identifier_names
  final account_signType = Rx<String>('');

  getUserInfor() async {
    try {
      final failureOrUserInfor = await userProfileRepository.getProfile();
      failureOrUserInfor.fold(
        (l) => throw l.error,
        (r) => {
          userInfo.value = r,
          account_signType.value = userInfo.value!.signType.toString(),
          refreshController.refreshCompleted()},
      );
    } catch (e, s) {
      refreshController.refreshFailed();
      showErrorModal(exceptionHandler(GenericException(error: e, stack: s)));
    }
  }

  getUserStatus(UserStatusRequest param) async {
    try {
      final failureOrUserInfor =
          await userProfileRepository.getUserStatus(param);
      failureOrUserInfor.fold(
        (l) => throw l,
        (r) => userStatus.value = r,
      );
    } catch (e, s) {
      showErrorModal(exceptionHandler(GenericException(error: e, stack: s)));
    }
  }

  onRefresh() async {
    userInfo.value = null;
    getUserInfor();
  }
}
