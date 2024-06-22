
part of 'widget_imports.dart';

class OnboardSecond extends StatelessWidget {
  const OnboardSecond({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(MyAssets.onboard2,height: 333.h,width: 333.w,),
        30.h.heightBox,
        MyStrings.onboard2Desc.text.letterSpacing(1.5)
            .size(15.sp).align(TextAlign.center)
            .fontWeight(FontWeight.w500)
            .make(),
      ],
    );
  }
}
