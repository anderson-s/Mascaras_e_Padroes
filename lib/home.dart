import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mascaras_e_padroes/input_text.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Máscaras e Padrões"),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            InputTextFormField(
              tipo: TextInputType.number,
              formato: [
                FilteringTextInputFormatter.digitsOnly,
                CpfInputFormatter()
              ],
            ),
            InputTextFormField(
              tipo: TextInputType.number,
              formato: [
                FilteringTextInputFormatter.digitsOnly,
                CnpjInputFormatter()
              ],
            ),
            InputTextFormField(
              tipo: TextInputType.number,
              formato: [
                FilteringTextInputFormatter.digitsOnly,
                CepInputFormatter()
              ],
            ),
            InputTextFormField(
              tipo: TextInputType.number,
              formato: [
                FilteringTextInputFormatter.digitsOnly,
                CnpjInputFormatter()
              ],
            )
          ],
        ),
      ),
    );
  }
}
