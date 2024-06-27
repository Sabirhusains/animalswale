part of 'register_imports.dart';

@RoutePage()
class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late RegisterViewModel registerViewModel;

  @override
  void initState() {
    registerViewModel =
        RegisterViewModel(repository: context.read<Repository>());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primaryColor,
      body: SafeArea(
        child: FadedScaleAnimation(
          child: ListView(
            children: [
              20.h.heightBox,
              Image.asset(
                MyAssets.appLogo,
                color: MyColors.white,
                width: 200.w,
              ).centered(),
              100.h.heightBox,
              Container(
                height: MediaQuery.sizeOf(context).height,
                width: MediaQuery.sizeOf(context).width,
                decoration: const BoxDecoration(
                    color: MyColors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(36),
                      topRight: Radius.circular(36),
                    )),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        55.h.heightBox,
                        MyStrings.register.text
                            .size(18.sp)
                            .color(MyColors.primaryColor)
                            .fontWeight(FontWeight.w700)
                            .makeCentered(),
                        48.h.heightBox,
                        BlocBuilder<VelocityBloc<XFile?>, VelocityState<XFile?>>(
                          bloc: registerViewModel.selectedImageBloc,
                          builder: (context, state) {
                            return Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                state.data != null
                                    ? Image.file(
                                        File(state.data!.path),
                                        height: 200,
                                        width: 0.5.sw,
                                        fit: BoxFit.cover,
                                      ).cornerRadius(20).centered()
                                    : Image.network(
                                        "https://i0.wp.com/sunrisedaycamp.org/wp-content/uploads/2020/10/placeholder.png?ssl=1",
                                        height: 200,
                                        width: 0.5.sw,
                                        fit: BoxFit.cover,
                                      ).cornerRadius(20).centered(),
                                CircleAvatar(
                                  radius: 23,
                                  child: IconButton(
                                      onPressed: () =>
                                          registerViewModel.pickImage(context),
                                      icon: const Icon(
                                        FeatherIcons.camera,
                                        color: MyColors.primaryColor,
                                      )),
                                ),
                              ],
                            );
                          },
                        ),
                        8.h.heightBox,
                        "Full Name".text.make(),
                        8.h.heightBox,
                        CommanTextfield(
                          hint: "John Denny..",
                          controller: registerViewModel.nameController,
                          textInputType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          prefixIcon:const Icon(Icons.person),
                        ),
                        20.h.heightBox,
                        "Phone".text.make(),
                        8.h.heightBox,
                        CommanTextfield(
                          hint: "+91 11111 11111",
                          controller: registerViewModel.phoneController,
                          textInputType: TextInputType.phone,
                          textInputAction: TextInputAction.next,
                          prefixIcon:const Icon(Icons.phone),
                        ),
                        20.h.heightBox,
                        "Email".text.make(),
                        8.h.heightBox,
                        CommanTextfield(
                          hint: "john@gmail.com",
                          textInputType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          controller: registerViewModel.emailController,
                          prefixIcon:const Icon(Icons.email),
                        ),
                        20.h.heightBox,
                        "Password".text.make(),
                        8.h.heightBox,
                        CommanTextfield(
                          textInputType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.done,
                          controller: registerViewModel.passwordController,
                          prefixIcon:const Icon(Icons.lock),
                          obSecureText: true,
                        ),
                        40.h.heightBox,
                        BlocBuilder<VelocityBloc<bool>, VelocityState<bool>>(
                          bloc: registerViewModel.isLoadingBloc,
                          builder: (context, state) {
                            return PrimaryButton(
                                title: MyStrings.requestOTP,
                                isLoading: state.data,
                                onPressed: () {
                                  if (registerViewModel
                                          .selectedImageBloc.state.data !=
                                      null) {
                                    registerViewModel.register(context);
                                  } else {
                                    VxToast.show(context,
                                        msg: "Please Select Profile Image");
                                  }
                                });
                          },
                        ),
                        20.h.heightBox,
                        "Already have an account ?"
                            .richText
                            .semiBold
                            .color(MyColors.primaryColor)
                            .size(14.sp)
                            .withTextSpanChildren([
                          TextSpan(
                              text: " Login",
                              recognizer: TapGestureRecognizer()
                                ..onTap = () =>
                                    AutoRouter.of(context).push(LoginRoute()),
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                              )),
                        ]).makeCentered(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
