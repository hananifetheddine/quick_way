import 'package:get/get.dart';
import 'package:quick_way/presentation/controllers/auth/registration.dart';

import '../../data/repositories/auth_repository.dart';
import '../../domain/use_case/auth/send_otp_usecase.dart';
import '../../domain/use_case/auth/signup_usecase.dart';
import '../../domain/use_case/auth/verify_otp_uscase.dart';
import '../controllers/auth/login.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SendOTPUseCase(Get.find<AuthRepositoryImpl>()),
        fenix: true);
    Get.lazyPut(() => VerifyOTPUseCase(Get.find<AuthRepositoryImpl>()),
        fenix: true);
    Get.put(LoginController(Get.find(), Get.find(), Get.find()));
  }
}

class RegistrationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignupUseCase(Get.find<AuthRepositoryImpl>()),
        fenix: true);

    Get.put(RegistrationController(Get.find(), Get.find()));
  }
}
