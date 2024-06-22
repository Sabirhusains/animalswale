
part of 'widget_imports.dart';

class OnboardThird extends StatelessWidget {
  const OnboardThird({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(MyAssets.onboard3,height: 333.h,width: 333.w,),
        30.h.heightBox,
        MyStrings.onboard3Desc.text.letterSpacing(1.5)
            .size(15.sp).align(TextAlign.center)
            .fontWeight(FontWeight.w500)
            .make(),
      ],
    );
  }
}
