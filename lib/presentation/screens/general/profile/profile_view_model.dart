part of 'profile_imports.dart';


class ProfileViewModel {
  final Repository repository;

  ProfileViewModel({required this.repository});

  final ImagePicker picker = ImagePicker();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final VelocityBloc<XFile?> selectedImageBloc = VelocityBloc<XFile?>(null);
  final VelocityBloc<bool> isLoadingBloc = VelocityBloc<bool>(false);
  final VelocityBloc<UserData> userDataBloc = VelocityBloc<UserData>(UserData());

  pickImage(context) async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      selectedImageBloc.onUpdateData(image);
    } else {
      VxToast.show(context, msg: "No Image Selected");
    }
  }

  ///open Url Function
  Future<void> launchUrl(String url) async {
    if (!await launch(url)) throw 'Could not launch $url';
  }

  logout(context)async{
    var data = await repository.authRepo.logoutApi(context);
    print("DATA LOGOUT===>$data");
    if(data.message.isNotEmptyAndNotNull){
      Utils.clearAllSavedData();
      AutoRouter.of(context).push(const LoginRoute());
    }
  }


  getProfileData(BuildContext context)async{
    var userdata = await Utils.get("userData") ?? userDataBloc.state.data;
    var userDATA = UserData.fromJson(json.decode(userdata));
     userDataBloc.onUpdateData(userDATA);
    if(context.mounted){
      context.read<VelocityBloc<UserData>>().onUpdateData(userDATA);
    }
     if(userDATA.id != null){
       selectedImageBloc.onUpdateData(XFile("${ApiConstants.profileImageUrl}${userDATA.profileImage}"));
       nameController.text = userDATA.name.toString();
       emailController.text = userDATA.email.toString();
     }
  }

  userProfileUpdate(context) async {
    isLoadingBloc.onUpdateData(true);
    var updateProfileData = await repository.authRepo.updateProfileApi(
        nameController.text,
        emailController.text,
        selectedImageBloc.state.data!.path.startsWith('http') ? null: selectedImageBloc.state.data,
        context
    );

    isLoadingBloc.onUpdateData(false);

    if (updateProfileData.success != 'false') {
      await getProfileData(context);
      // Update the user data bloc with the new data
      userDataBloc.onUpdateData(updateProfileData.userData!);

      // Save the new user data locally
      await Utils.set('userData', updateProfileData.userData);

      // Navigate back to the previous page
      AutoRouter.of(context).back();
    } else {
      VxToast.show(context, msg: updateProfileData.message.toString());
    }
  }
}
