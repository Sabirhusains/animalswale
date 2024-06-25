part of 'update_profile_imports.dart';

@RoutePage()
class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  late ProfileViewModel profileViewModel;

  @override
  void initState() {
    profileViewModel = ProfileViewModel(repository: context.read<Repository>());
    profileViewModel.getProfileData(context);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.primaryColor,
        title: "Update Profile".text.white.make(),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: ListView(
          children: [
            20.h.heightBox,
            BlocBuilder<VelocityBloc<XFile?>, VelocityState<XFile?>>(
              bloc: profileViewModel.selectedImageBloc,
              builder: (context, state) {
                if(state is VelocityInitialState){
                  return const Center(child: CircularProgressIndicator.adaptive(),);
                }else if(state is VelocityUpdateState){
                  final imagePath = state.data?.path;
                  return Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      if (imagePath != null && !imagePath.startsWith('http'))
                        Image.file(
                          File(imagePath),
                          height: 200,
                          width: 0.5.sw,
                          fit: BoxFit.cover,
                        ).cornerRadius(20).centered()
                      else if (imagePath != null && imagePath.startsWith('http'))
                        Image.network(
                          imagePath,
                          height: 200,
                          width: 0.5.sw,
                          fit: BoxFit.cover,
                        ).cornerRadius(20).centered()
                      else
                        Image.network(
                          "https://i0.wp.com/sunrisedaycamp.org/wp-content/uploads/2020/10/placeholder.png?ssl=1",
                          height: 200,
                          width: 0.5.sw,
                          fit: BoxFit.cover,
                        ).cornerRadius(20).centered(),
                      CircleAvatar(
                        radius: 23,
                        child: IconButton(
                          onPressed: () => profileViewModel.pickImage(context),
                          icon: const Icon(
                            FeatherIcons.camera,
                            color: MyColors.primaryColor,
                          ),
                        ),
                      ),
                    ],
                  );
                }
                return SizedBox();
              },
            ),
            // Name Controller
            20.h.heightBox,
            "Full Name".text.make(),
            8.h.heightBox,
            VxTextField(
              fillColor: Colors.transparent,
              borderRadius: 10,
              hint: "John Denny..",
              hintStyle: const TextStyle(color: Colors.grey),
              borderType: VxTextFieldBorderType.roundLine,
              controller: profileViewModel.nameController,
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              borderColor: MyColors.primaryColor,
              prefixIcon: const Icon(Icons.person),
            ),
            20.h.heightBox,
            "Email".text.make(),
            8.h.heightBox,
            VxTextField(
              fillColor: Colors.transparent,
              borderRadius: 10,
              hint: "john@gmail.com",
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              controller: profileViewModel.emailController,
              borderType: VxTextFieldBorderType.roundLine,
              borderColor: MyColors.primaryColor,
              prefixIcon: const Icon(Icons.email),
            ),
            40.h.heightBox,
            BlocBuilder<VelocityBloc<bool>, VelocityState<bool>>(
              bloc: profileViewModel.isLoadingBloc,
              builder: (context, state) {
                return PrimaryButton(
                    title: "Update Profile",
                    isLoading: state.data,
                    onPressed: () =>
                        profileViewModel.userProfileUpdate(context));
              },
            ),
          ],
        ),
      ),
    );
  }
}
