
part of 'onboard_imports.dart';

@RoutePage()
class Onboard extends StatefulWidget {
  Onboard({Key? key}) : super(key: key);

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  OnboardViewModel onboardViewModel = OnboardViewModel();



  @override
  void dispose() {
    onboardViewModel.pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  Image.asset(
                    MyAssets.appLogo,
                    // height: 100,
                    width: 200.w,
                  ),
                  63.h.heightBox,
                  PageView(
                    controller: onboardViewModel.pageController,
                    children: const [
                      OnboardFirst(),
                      OnboardSecond(),
                      OnboardThird(),
                    ],
                  ).expand(),
                  61.h.heightBox,
                  PrimaryButton(title: MyStrings.getStarted, onPressed: (){}),
                  61.h.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyStrings.skip.text
                          .size(16.sp)
                          .align(TextAlign.center)
                          .letterSpacing(1.9)
                          .color(MyColors.primaryColor)
                          .fontWeight(FontWeight.w700)
                          .make(),
                      SmoothPageIndicator(
                        controller: onboardViewModel.pageController,
                        count: 3,
                        // axisDirection: Axis.vertical,
                        effect: const WormEffect(
                          activeDotColor: MyColors.primaryColor,
                          dotHeight: 12,
                          dotWidth: 12,
                        ),
                        onDotClicked: (index) {},
                      ),
                      MyStrings.next.text
                          .size(16.sp)
                          .align(TextAlign.center)
                          .letterSpacing(1.9)
                          .color(MyColors.primaryColor)
                          .fontWeight(FontWeight.w700)
                          .make(),
                    ],
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
