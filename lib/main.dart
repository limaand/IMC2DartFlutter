import 'package:calc_desafio_imc/classes/pessoa.dart';
import 'package:flutter/material.dart';
import 'imc_calculator.dart';

void main() => runApp(IMCCalculatorApp());

class IMCCalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora de IMC',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: IMCCalculatorScreen(),
    );
  }
}

class IMCCalculatorScreen extends StatefulWidget {
  @override
  _IMCCalculatorScreenState createState() => _IMCCalculatorScreenState();
}

class _IMCCalculatorScreenState extends State<IMCCalculatorScreen> {
  final TextEditingController pesoController = TextEditingController();
  final TextEditingController alturaController = TextEditingController();
  final TextEditingController nomeController = TextEditingController();
  String result = "";
  String classification = "";

  void calculateIMC() {
    double peso =
        double.tryParse(pesoController.text.replaceAll(",", ".")) ?? 0.0;
    double altura =
        double.tryParse(alturaController.text.replaceAll(",", ".")) ?? 0.0;
    String nome = nomeController.text;

    Pessoa pessoa =
        Pessoa(nome, peso, altura / 100); // Converter altura para metros
    IMCCalculator calculator = IMCCalculator();
    double imc = calculator.calculateIMC(pessoa.getPeso(), pessoa.getAltura());

    String imcClassification = calculator.classifyIMC(imc);

    setState(() {
      result = "Olá, ${pessoa.getNome()}!\nSeu IMC é ${imc.toStringAsFixed(2)}";
      classification = "Classificação: $imcClassification";
    });
  }

  void clearFields() {
    setState(() {
      pesoController.text = "";
      alturaController.text = "";
      nomeController.text = "";
      result = "";
      classification = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Desafio Calculadora de IMC'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 40),
                Text(
                  'Digite seu nome:',
                ),
                TextField(
                    controller: nomeController, textAlign: TextAlign.center),
                SizedBox(height: 20),
                Text(
                  'Digite seu peso (em kg):',
                ),
                TextField(
                  controller: pesoController,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Text(
                  'Digite sua altura (em cm):',
                ),
                TextField(
                  controller: alturaController,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: calculateIMC,
                      child: Text('Calcular IMC'),
                    ),
                    ElevatedButton(
                      onPressed: clearFields,
                      child: Text('Limpar'),
                    ),
                  ],
                ),
                SizedBox(height: 60),
                Text(
                  result,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                Text(
                  classification,
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ));
  }
}
