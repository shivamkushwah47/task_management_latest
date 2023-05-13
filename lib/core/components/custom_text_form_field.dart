import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:task_management_app/core/global/colors.dart';

class TextfieldComponent extends StatelessWidget {
  const TextfieldComponent({
    Key? key,
    this.controller,
    this.border,
    this.hintText,
    this.suffix,
    this.inputFormatters,
    this.validator,
    this.enabled,
    this.keyboardType,
    this.onchange,
    this.prefixIcon,
    this.suffixIcon,
    this.onFieldSubmit,
    this.textScaleFactor,
    this.onSaved,
    this.obscureText,
    this.labelText,
    this.color,
    this.contentPadding,
  }) : super(key: key);
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? hintText;
  final Widget? suffix;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final List? inputFormatters;
  final bool? obscureText;
  final bool? enabled;
  final InputBorder? border;
  final Widget? prefixIcon;
  final Function(String)? onchange;
  final Function(String)? onFieldSubmit;
  final Function(String?)? onSaved;
  final double? textScaleFactor;
  final String? labelText;
  final Color? color;
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
            labelText: labelText,
            prefixIcon: prefixIcon,
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color:
                      color == null ? GlobalColor.customMaterialColor : color!,
                  style: BorderStyle.solid,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(30)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color:
                      color == null ? GlobalColor.grey : color!,
                ),
                borderRadius: BorderRadius.circular(30)),
            focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color:
                  color == null ? Colors.red : color!,
                ),
                borderRadius: BorderRadius.circular(30)),
            errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color:
                  color == null ? Colors.red : color!,
                ),
                borderRadius: BorderRadius.circular(30)),
            border: const OutlineInputBorder(),
            suffix: suffix,
            suffixIcon: suffixIcon,
            contentPadding:
                contentPadding ?? EdgeInsets.all(Get.height * 0.025),
            hintText: hintText,

            // hintStyle: AppTextStyle.hindTextFieldText,
            errorMaxLines: 2),
        onFieldSubmitted: onFieldSubmit,
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText ?? false,
        onChanged: onchange,
        // inputFormatters: [
        //   FilteringTextInputFormatter.deny(RegExp(r"\s"))
        // ],
        enabled: enabled,
        onSaved: onSaved,
        validator: validator);
  }
}

class TextfieldComponentEmail extends StatelessWidget {
  const TextfieldComponentEmail({
    Key? key,
    this.controller,
    this.border,
    this.hintText,
    this.suffix,
    this.inputFormatters,
    this.validator,
    this.enabled,
    this.keyboardType,
    this.onchange,
    this.prefixIcon,
    this.suffixIcon,
    this.onFieldSubmit,
    this.textScaleFactor,
    this.onSaved,
    this.obscureText,
    this.labelText,
    this.color,
    this.contentPadding,
  }) : super(key: key);
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? hintText;
  final Widget? suffix;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final List? inputFormatters;
  final bool? obscureText;
  final bool? enabled;
  final InputBorder? border;
  final Widget? prefixIcon;
  final Function(String)? onchange;
  final Function(String)? onFieldSubmit;
  final Function(String?)? onSaved;
  final double? textScaleFactor;
  final String? labelText;
  final Color? color;
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        decoration: InputDecoration(
            labelText: labelText,
            prefixIcon: prefixIcon,
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color:
                      color == null ? GlobalColor.customMaterialColor : color!,
                  style: BorderStyle.solid,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(30)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color:
                      color == null ? GlobalColor.customMaterialColor : color!,
                ),
                borderRadius: BorderRadius.circular(30)),
            errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color:
                  color == null ? GlobalColor.customMaterialColor : color!,
                ),
                borderRadius: BorderRadius.circular(30)),
            border: const OutlineInputBorder(),
            suffix: suffix,
            suffixIcon: suffixIcon,
            contentPadding:
                contentPadding ?? EdgeInsets.all(Get.height * 0.025),
            hintText: hintText,

            // hintStyle: AppTextStyle.hindTextFieldText,
            errorMaxLines: 2),
        onFieldSubmitted: onFieldSubmit,
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText ?? false,
        onChanged: onchange,
        inputFormatters: [FilteringTextInputFormatter.deny(RegExp(r"\s"))],
        enabled: enabled,
        onSaved: onSaved,
        validator: validator);
  }
}
