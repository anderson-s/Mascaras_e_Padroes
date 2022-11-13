import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputTextFormField extends StatelessWidget {
  final TextInputType tipo;
  final List<TextInputFormatter> formato;
  const InputTextFormField(
      {super.key, required this.tipo, required this.formato});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: tipo,
      inputFormatters: formato,
    );
  }
}
