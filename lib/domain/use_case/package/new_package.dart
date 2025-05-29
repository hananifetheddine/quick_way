import 'package:dartz/dartz.dart';
import 'package:quick_way/domain/entities/toApi/package/package.dart';

import '../../../data/network/error_handler.dart';
import '../../repositories/package_repository.dart';
import '../base_usecase.dart';

class AddPackageUseCase implements BaseUseCase<NewPackage, void> {
  final PackageRepository _repository;

  AddPackageUseCase(this._repository);

  @override
  Future<Either<Failure, void>> execute(NewPackage package) async {
    return await _repository.addPackage(package);
  }
}
