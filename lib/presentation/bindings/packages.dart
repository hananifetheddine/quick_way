import 'package:get/get.dart';
import 'package:quick_way/data/repositories/package_repostiroy.dart';
import 'package:quick_way/domain/use_case/package/new_package.dart';
import 'package:quick_way/presentation/controllers/packages/package.dart';

class NewPackageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddPackageUseCase(Get.find<PackageRepositoryImpl>()),
        fenix: true);
    Get.put(NewPackageController(Get.find(), Get.find(), Get.find()));
  }
}
