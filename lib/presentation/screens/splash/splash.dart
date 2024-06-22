part of 'splash_import.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    moveToOnboard();
    super.initState();

  }

  moveToOnboard()async{
    Future.delayed(const Duration(seconds: 2),(){
      Utils.manipulateLogin(context);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primaryColor,
      body: Center(
        child: FadedScaleAnimation(
          child: Image.asset(
            MyAssets.appLogo,
            color: MyColors.white,
            // height: 100,
            width: 250.w,
          ),
        ),
      ),
    );
  }
}
