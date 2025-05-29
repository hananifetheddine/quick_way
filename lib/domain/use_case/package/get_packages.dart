import 'package:dartz/dartz.dart';
import 'package:quick_way/domain/repositories/package_repository.dart';

import '../../../data/network/error_handler.dart';
import '../../entities/package/package.dart';
import '../base_usecase.dart';

class GetPackagesUseCase implements BaseUseCaseNoParams<List<Package>> {
  final PackageRepository _repository;

  GetPackagesUseCase(this._repository);

  @override
  Future<Either<Failure, List<Package>>> execute() async {
    return await _repository.getPackages();
  }
}
