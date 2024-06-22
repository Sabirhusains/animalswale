part of 'auth_imports.dart';

@RoutePage()
class Auth extends StatefulWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage(MyAssets.auth),opacity: 0.6,fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  MyAssets.appLogo,
                  // height: 100,
                  width: 200.w,
                  color: MyColors.primaryColor,
                ).centered(),
                const Spacer(),
                MyStrings.auth.text
                    .size(28.sp)
                    .white
                    .fontWeight(FontWeight.w700)
                    .make(),
                20.h.heightBox,
                PrimaryButton(title: MyStrings.login, onPressed: () => AutoRouter.of(context).push(LoginRoute())),
                12.h.heightBox,
                OutlineButton(title: MyStrings.register, onPressed: () =>AutoRouter.of(context).push(RegisterRoute())),
                20.h.heightBox,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
