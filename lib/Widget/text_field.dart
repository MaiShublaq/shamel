import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamel/Controlleelper/controller_helper.dart';

class text_field extends StatefulWidget {
  final TextEditingController? controller;

  final IconData? suffixIcon;
        bool obsecure ;
  final String? errorText1;
  final String? hint;
  final TextInputType? keybord;

   text_field(
      {Key? key,
      required this.controller,
      this.obsecure = false,
      this.hint,
        this.keybord,
      this.suffixIcon,
      this.errorText1})
      : super(key: key);

  @override
  State<text_field> createState() => _text_fieldState();
}

class _text_fieldState extends State<text_field> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: widget.obsecure,
      keyboardType: widget.keybord,
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: TextStyle(
          color: Color(context.greyColor) , fontSize: 12 ),

        errorText: widget.errorText1,
        constraints: BoxConstraints(maxHeight: widget.errorText1== null? 42.h : 75.h ,maxWidth: 341.w),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7.r),
          borderSide: BorderSide(color: Colors.red, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1.0, color: Color(context.greyColor)),
          borderRadius: BorderRadius.circular(7.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7.r),
          borderSide: BorderSide(color: Color(context.greenColor), width: 1.0),
        ),
      ),
      enabled: true,

    );
  }
}
