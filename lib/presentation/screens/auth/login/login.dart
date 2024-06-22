part of 'login_imports.dart';

@RoutePage()
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late LoginViewModel loginViewModel;

  @override
  void initState() {
    loginViewModel = LoginViewModel(repository: context.read<Repository>());
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      55.h.heightBox,
                      MyStrings.login.text
                          .size(18.sp)
                          .color(MyColors.primaryColor)
                          .fontWeight(FontWeight.w700)
                          .makeCentered(),
                      48.h.heightBox,
                      "Mobile Number".text.make(),
                      8.h.heightBox,
                      VxTextField(
                        fillColor: Colors.transparent,
                        borderRadius: 10,
                        hint: "+91 11111 11111",
                        hintStyle: const TextStyle(color: Colors.grey),
                        controller: loginViewModel.phoneController,
                        borderType: VxTextFieldBorderType.roundLine,
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.done,
                        borderColor: MyColors.primaryColor,
                        prefixIcon: const Icon(FeatherIcons.phone),
                        // validator: (email) {
                        //   if (email!.isEmpty) {
                        //     return "Email is Empty";
                        //   } else if (!email.isValidEmail) {
                        //     return "Invalid Email";
                        //   }
                        //   return null;
                        // },
                      ),
                      40.h.heightBox,
                      BlocBuilder<VelocityBloc<bool>, VelocityState<bool>>(
                        bloc: loginViewModel.isLoading,
                        builder: (context, state) {
                          return PrimaryButton(
                            title: MyStrings.requestOTP,
                            isLoading: state.data,
                            onPressed: () => loginViewModel.login(context),
                          );
                        },
                      ),
                      20.h.heightBox,
                      "Dont have an account ?"
                          .richText
                          .semiBold
                          .color(MyColors.primaryColor)
                          .size(14.sp)
                          .withTextSpanChildren([
                        TextSpan(
                            text: " Register",
                            recognizer: TapGestureRecognizer()
                              ..onTap = () =>
                                  AutoRouter.of(context).push(RegisterRoute()),
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                            )),
                      ]).makeCentered(),
                    ],
                  ),
                ),
              ),
              // Form(
              //   key: loginViewModel.formKey,
              //   child:
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
