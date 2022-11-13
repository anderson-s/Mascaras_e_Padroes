import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputTextFormField extends StatelessWidget {
  final TextInputType tipo;
  final List<TextInputFormatter> formato;
  final String texto;
  final TextEditingController controller;
  const InputTextFormField({
    super.key,
    required this.tipo,
    required this.formato,
    required this.texto,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: texto,
      ),
      keyboardType: tipo,
      inputFormatters: formato,
    );
  }
}
