import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ticket_booking/controller/login_controller.dart';

// ignore: must_be_immutable
class LoginTextFormField extends GetView<LoginController> {
  LoginTextFormField({
    Key? key,
    required this.hintText,
    required this.keyboardType,
    required this.obscureText,
    required this.containerColor,
    required this.textColor,
    required this.textEditingController,
    required this.isTextFieldClicked,
    this.isPasswordField,
    this.validator,
    this.textInputFormatter,
    this.focusNode,
  }) : super(key: key);
  final String hintText;
  final TextInputType keyboardType;
  final bool obscureText;
  final Color containerColor;
  final Color textColor;
  final String? Function(String?)? validator;
  final TextEditingController textEditingController;
  final RxBool isTextFieldClicked;
  List<TextInputFormatter>? textInputFormatter;
  FocusNode? focusNode;
  Widget? isPasswordField;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedPadding(
            duration: const Duration(seconds: 1),
            padding: isTextFieldClicked.value
                ? EdgeInsets.only(
                    left: 3,
                    bottom: 2,
                    top: (hintText == 'E-mail') ? 0 : 10,
                  )
                : const EdgeInsets.all(0),
            child: AnimatedOpacity(
              opacity: isTextFieldClicked.value ? 1 : 0,
              duration: const Duration(seconds: 1),
              child: Text(
                hintText,
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w500,
                  color: const Color.fromARGB(152, 0, 0, 0),
                ),
              ),
            ),
          ),
          Obx(
            () => AnimatedPhysicalModel(
              borderRadius: BorderRadius.circular(14),
              shape: BoxShape.rectangle,
              elevation: isTextFieldClicked.value ? 4 : 0,
              color: Colors.amber,
              duration: const Duration(
                seconds: 1,
              ),
              shadowColor: Colors.cyan,
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: containerColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 5,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          focusNode: focusNode,
                          controller: textEditingController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: hintText,
                            hintStyle: GoogleFonts.roboto(
                              color: textColor,
                            ),

                            // suffixIcon: isPasswordField,
                          ),
                          obscureText: obscureText,
                          keyboardType: keyboardType,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: validator,
                          inputFormatters: textInputFormatter,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              isTextFieldClicked.value = true;
                            } else {
                              isTextFieldClicked.value = false;
                            }
                          },
                        ),
                      ),
                      isPasswordField ?? const SizedBox(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
