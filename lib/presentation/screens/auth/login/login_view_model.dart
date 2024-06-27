part of 'login_imports.dart';


class LoginViewModel{

  final Repository repository;

  LoginViewModel({required this.repository});

  final TextEditingController phoneController = TextEditingController();
  // final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final VelocityBloc<bool> isLoading= VelocityBloc<bool>(false);


  login(context)async {
    isLoading.onUpdateData(true);
    var loginData=await repository.authRepo.loginApi(phoneController.text,context);

    if(loginData.success != 'false'){
      AutoRouter.of(context).push(OtpRoute(mobileNo: phoneController.text));
    }else{
      VxToast.show(context, msg: loginData.message.toString());
    }
    isLoading.onUpdateData(false);
  }
}