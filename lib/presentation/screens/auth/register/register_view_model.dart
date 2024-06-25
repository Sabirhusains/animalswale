part of 'register_imports.dart';

class RegisterViewModel {
  final Repository repository;

  RegisterViewModel({required this.repository});

  final ImagePicker picker = ImagePicker();

  final VelocityBloc<XFile?> selectedImageBloc = VelocityBloc<XFile?>(null);
  final VelocityBloc<bool> isLoadingBloc = VelocityBloc<bool>(false);
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  pickImage(context) async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      selectedImageBloc.onUpdateData(image);
    } else {
      VxToast.show(context, msg: "No Image Selected");
    }
  }

  register(context) async {
    isLoadingBloc.onUpdateData(true);
    var registerData = await repository.authRepo.registerApi(
        nameController.text,
        phoneController.text,
        emailController.text,
        passwordController.text,
        selectedImageBloc.state.data!,
        context);

    if (registerData.success != 'false') {
      // Utils.saveToken(loginData.accessToken.toString());
      AutoRouter.of(context).push(OtpRoute(mobileNo: phoneController.text));
    } else {
      VxToast.show(context, msg: registerData.message.toString());
    }
    isLoadingBloc.onUpdateData(false);
  }
}
