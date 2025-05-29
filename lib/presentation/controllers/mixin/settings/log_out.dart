import '../../../../domain/use_case/auth/log_out_usecase.dart';
import '../../../components/default_widgets/snack_bar.dart';

mixin LogOutMixin {
  Future<void> logOut(LogOutUseCase logOutUseCase) async {
    var res = await logOutUseCase.execute();
    res.fold(
        (l) =>
            snackBarDetailsModel(snack: SnackCase.error, subTitle: l.message),
        (_) async {});
  }
}
