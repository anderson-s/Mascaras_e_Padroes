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
  final TextEditingController _cpf = TextEditingController();
  final TextEditingController _cnpj = TextEditingController();
  final TextEditingController _cep = TextEditingController();
  final TextEditingController _telefone = TextEditingController();
  final TextEditingController _data = TextEditingController();
  final TextEditingController _dinheiro = TextEditingController();
  @override
  void dispose() {
    _cpf.dispose();
    _cnpj.dispose();
    _cep.dispose();
    _telefone.dispose();
    _data.dispose();
    _dinheiro.dispose();
    super.dispose();
  }

  _recuperar() {
    String moeda = _dinheiro.text.toString();
    moeda = moeda.replaceAll(".", "");
    moeda = moeda.replaceAll(".", ",");
    print(double.parse(UtilBrasilFields.removerSimboloMoeda(
        moeda))); //Transformando o valores apenas em double
    print(UtilBrasilFields.obterReal(double.parse(
        UtilBrasilFields.removerSimboloMoeda(
            moeda)))); //Deixando a formatação novamente como antes
  }

  _padroes() {
    //Estados
    print("###########Estados:##########");
    for (int i = 0; i < Estados.listaEstados.length; i++) {
      print(Estados.listaEstados[i]);
    }

    //Meses
    print("##########Meses###########");
    for (int i = 0; i < Meses.listaMeses.length; i++) {
      print(Meses.listaMeses[i]);
    }

    //Regioes
    print("##########Regiões##########");
    for (int i = 0; i < Regioes.listaRegioes.length; i++) {
      print(Regioes.listaRegioes[i]);
    }
    //Semana
    print("##########Semana##########");
    for (int i = 0; i < Semana.listaDiasSemana.length; i++) {
      print(Semana.listaDiasSemana[i]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Máscaras e Padrões"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              InputTextFormField(
                controller: _cpf,
                tipo: TextInputType.number,
                formato: [
                  FilteringTextInputFormatter.digitsOnly,
                  CpfInputFormatter()
                ],
                texto: "CPF",
              ),
              InputTextFormField(
                controller: _cnpj,
                tipo: TextInputType.number,
                formato: [
                  FilteringTextInputFormatter.digitsOnly,
                  CnpjInputFormatter()
                ],
                texto: "CNPJ",
              ),
              InputTextFormField(
                controller: _cep,
                tipo: TextInputType.number,
                formato: [
                  FilteringTextInputFormatter.digitsOnly,
                  CepInputFormatter()
                ],
                texto: "CEP",
              ),
              InputTextFormField(
                controller: _telefone,
                tipo: TextInputType.number,
                formato: [
                  FilteringTextInputFormatter.digitsOnly,
                  TelefoneInputFormatter()
                ],
                texto: "Telefone",
              ),
              InputTextFormField(
                controller: _data,
                tipo: TextInputType.number,
                formato: [
                  FilteringTextInputFormatter.digitsOnly,
                  DataInputFormatter()
                ],
                texto: "Data",
              ),
              InputTextFormField(
                controller: _dinheiro,
                tipo: TextInputType.number,
                formato: [
                  FilteringTextInputFormatter.digitsOnly,
                  RealInputFormatter(moeda: true)
                ],
                texto: "Real",
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ElevatedButton(
                  onPressed: () {
                    if (_dinheiro.text.isNotEmpty) {
                      _recuperar();
                    }
                    _padroes();
                  },
                  child: const Text("Recuperar"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
