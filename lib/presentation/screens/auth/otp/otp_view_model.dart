
part of 'otp_imports.dart';

class OtpViewModel {

  final Repository repository;

  OtpViewModel({required this.repository});


  final VelocityBloc<bool> isLoadingBloc = VelocityBloc<bool>(false);
  final TextEditingController otpController = TextEditingController();


  otp(String phone,context)async{
    isLoadingBloc.onUpdateData(true);
    var otpData = await repository.authRepo.otpApi(phone, otpController.text, context);
    if (otpData.success != 'false') {
      print("AUTH TOKEN--=-=-=---=-=-=---=-=--->${otpData.userData!.token!.original!.accessToken}");
      Utils.saveToken( otpData.userData!.token!.original!.accessToken.toString());
      await Utils.set('userData', otpData.userData);
      // Utils.saveUSerData(otpData.userData!);
      AutoRouter.of(context).push(const GeneralRoute());
    } else {
      VxToast.show(context, msg: otpData.message.toString());
    }
    isLoadingBloc.onUpdateData(false);
  }

  resendOTP(String phone,context)async{
    final response = await repository.authRepo.resendOTPApi(phone, context);
    if(response.success != 'false'){
      VxToast.show(context, msg: 'Please Check Your Messages');
    }else{
      VxToast.show(context, msg: response.message.toString());
    }
  }

}