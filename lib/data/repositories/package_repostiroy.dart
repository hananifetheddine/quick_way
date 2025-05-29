import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:get/get_connect/http/src/multipart/form_data.dart';
import 'package:get/get_connect/http/src/multipart/multipart_file.dart';
import 'package:quick_way/data/network/error_handler.dart';
import 'package:quick_way/domain/entities/package/package.dart';
import 'package:quick_way/domain/entities/toApi/package/package.dart';

import '../../app/utils.dart';
import '../../domain/repositories/package_repository.dart';
import '../network/api_provider.dart';
import '../network/api_request.dart';
import '../network/network_info.dart';
import '../network/paths.dart';

class PackageRepositoryImpl implements PackageRepository {
  final NetworkInfo _networkInfo;

  PackageRepositoryImpl(this._networkInfo);

  @override
  Future<Either<Failure, void>> addPackage(NewPackage package) async {
    if (await _networkInfo.isConnected) {
      try {
        FormData formData = FormData({
          ...package.toJson(),
          'image': MultipartFile(File(package.image),
              filename: nameFile(package.image)),
        });

        APIRequestRepresentable apiRequest = APIRequestRepresentable(
          url: AppPaths.package,
          method: HTTPMethod.post,
          body: formData,
        );
        await APIProvider.instance.request(apiRequest, requestHttp: false);
        return const Right(null);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return const Left(Failure.noInternet);
    }
  }

  @override
  Future<Either<Failure, List<Package>>> getPackages() async {
    if (await _networkInfo.isConnected) {
      try {
        APIRequestRepresentable apiRequest = APIRequestRepresentable(
          url: AppPaths.package,
          method: HTTPMethod.get,
        );
        var res =
            await APIProvider.instance.request(apiRequest, requestHttp: false);
        List<Package> packages =
            res["packages"].map<Package>((e) => Package.fromJons(e)).toList();
        return Right(packages);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return const Left(Failure.noInternet);
    }
  }
}
