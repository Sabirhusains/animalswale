part of 'otp_imports.dart';

@RoutePage()
class Otp extends StatefulWidget {
  String mobileNo;

  Otp({Key? key, required this.mobileNo}) : super(key: key);

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  late OtpViewModel otpViewModel;

  @override
  void initState() {
    otpViewModel = OtpViewModel(repository: context.read<Repository>());
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
                      MyStrings.otpVerification.text
                          .size(18.sp)
                          .color(MyColors.primaryColor)
                          .fontWeight(FontWeight.w700)
                          .makeCentered(),
                      "+91 ${widget.mobileNo}"
                          .text
                          .size(14.sp)
                          .black
                          .fontWeight(FontWeight.bold)
                          .makeCentered(),
                      48.h.heightBox,
                      VxPinView(
                        color: MyColors.primaryColor,
                        size: 50,
                        space: 15.w,
                        obscureText: false,
                        count: 4,
                        onChanged: (value) {
                          otpViewModel.otpController.text = value;
                        },
                        keyboardType: TextInputType.number,
                      ).centered(),
                      40.h.heightBox,
                      BlocBuilder<VelocityBloc<bool>, VelocityState<bool>>(
                        bloc: otpViewModel.isLoadingBloc,
                        builder: (context, state) {
                          return PrimaryButton(
                            title: MyStrings.otpVerification,
                            isLoading: state.data,
                            onPressed: () {
                              if (otpViewModel.otpController.text.isNotEmpty) {
                                otpViewModel.otp(widget.mobileNo, context);
                              } else {
                                VxToast.show(context, msg: "Incorrect OTP");
                              }
                            },
                            // onPressed: () {
                            //   if (loginViewModel.formKey.currentState!
                            //       .validate()) {
                            //     loginViewModel.login(context);
                            //   }
                            // }
                          );
                        },
                      ),
                      20.h.heightBox,
                    ],
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
