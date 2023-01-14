import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatefulWidget {
  final IconData icon;
  final String label;
  final bool isSecret;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? typeKeyboard;
  final String? initialValue;
  final bool readOnly;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final bool? showCursor;

  const CustomTextFormField({
    Key? key,
    required this.icon,
    required this.label,
    this.isSecret = false,
    this.inputFormatters,
    this.typeKeyboard,
    this.initialValue,
    this.readOnly = false,
    this.textInputAction,
    this.controller,
    this.showCursor,
  }) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isObscure = false;

  @override
  void initState() {
    super.initState();

    isObscure = widget.isSecret;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        showCursor: widget.showCursor,
        controller: widget.controller,
        readOnly: widget.readOnly,
        initialValue: widget.initialValue,
        inputFormatters: widget.inputFormatters,
        obscureText: isObscure,
        keyboardType: widget.typeKeyboard,
        validator: (String? text) {
          if (text == null || text.isEmpty) {
            return 'O campo ${widget.label} não pode ser vazio';
          }
          return null;
        },
        decoration: InputDecoration(
          constraints:
              BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.8),
          prefixIcon: Icon(widget.icon),
          suffixIcon: widget.isSecret
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },
                  icon: isObscure
                      ? const Icon(Icons.visibility)
                      : const Icon(Icons.visibility_off),
                )
              : null,
          labelText: widget.label,
          isDense: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        textInputAction: widget.textInputAction,
      ),
    );
  }
}
