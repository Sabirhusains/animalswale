
part of 'widget_imports.dart';

class OnboardFirst extends StatelessWidget {
  const OnboardFirst({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(MyAssets.onboard1,height: 333.h,width: 333.w,),
        30.h.heightBox,
        MyStrings.onboard1Desc.text
            .size(15.sp).align(TextAlign.center).letterSpacing(1.5)
            .fontWeight(FontWeight.w500)
            .make(),
      ],
    );
  }
}
