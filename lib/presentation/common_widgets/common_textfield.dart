part of 'common_widget_imports.dart';


class CommanTextfield extends StatelessWidget {
  final String? hint;
  final TextEditingController? controller;
  final Function()? onEditingComplete;
  final Function(String)? onChange;
  final Function(String?)? onSave;
  final Widget? prefixIcon;
  final String? initialValue;
  final int? maxLength;
  final int maxLine;
  final String? counterText;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final bool? readOnly;
  final bool autoFocus;
  final bool? obSecureText;
  final FocusNode? focusNode;

  const CommanTextfield({
    Key? key,
    this.hint,
    this.controller,
    this.onEditingComplete,
    this.obSecureText = false,
    this.onChange,
    this.onSave,
    this.textInputType,
    this.counterText,
    this.prefixIcon,
    this.initialValue,
    this.textInputAction,
    this.maxLength,
    this.maxLine = 1,
    this.autoFocus = false,
    this.readOnly = false,
    this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxTextField(
      controller: controller,
      autofocus: autoFocus,
      keyboardType: textInputType ?? TextInputType.text,
      onChanged: onChange,
      onEditingComplete: onEditingComplete,
      onSubmitted: onSave,
      textInputAction: textInputAction ?? TextInputAction.next,
      obscureText: obSecureText ?? false,
      isPassword: obSecureText ?? false,
      maxLength: maxLength,
      maxLine: maxLine,
      focusNode: focusNode,
      fillColor: Colors.transparent,
      hint: hint,
      prefixIcon: prefixIcon,
      counterText: counterText,
      borderRadius: 10,
      readOnly: readOnly ?? false,
      borderType: VxTextFieldBorderType.roundLine,
      borderColor: MyColors.primaryColor,
    );
  }
}
