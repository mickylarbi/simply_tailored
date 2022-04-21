import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  const CustomTextFormField({
    Key? key,required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: const EdgeInsets.symmetric(horizontal: 24),
        filled: true,
        fillColor: const Color(0xFFE4E4E4),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

class PasswordTextFormField extends StatefulWidget {
  final String? hintText;
  const PasswordTextFormField({
    Key? key,
    this.hintText = 'Password',
  }) : super(key: key);

  @override
  State<PasswordTextFormField> createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  ValueNotifier<bool> obscureText = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: obscureText,
        builder: (context, value, child) {
          return TextFormField(
            obscureText: value,
            decoration: InputDecoration(
                hintText: widget.hintText,
                contentPadding: const EdgeInsets.symmetric(horizontal: 24),
                filled: true,
                fillColor: const Color(0xFFE4E4E4),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none),
                suffixIcon: IconButton(
                    icon: Icon(value ? Icons.visibility_off : Icons.visibility),
                    onPressed: () {
                      obscureText.value = !obscureText.value;
                    })),
          );
        });
  }

  @override
  void dispose() {
    obscureText.dispose();
    super.dispose();
  }
}
