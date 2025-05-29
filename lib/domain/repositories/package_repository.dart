import 'package:dartz/dartz.dart';
import 'package:quick_way/domain/entities/package/package.dart';
import 'package:quick_way/domain/entities/toApi/package/package.dart';

import '../../data/network/error_handler.dart';

abstract class PackageRepository {
  Future<Either<Failure, void>> addPackage(NewPackage package);
  Future<Either<Failure, List<Package>>> getPackages();
}
