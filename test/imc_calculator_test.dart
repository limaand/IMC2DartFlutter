import 'package:calc_desafio_imc/imc_calculator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Teste para calculo do imc', () {
    // Crie uma instância da calculadora IMC
    IMCCalculator calculator = IMCCalculator();
    // Calcule o IMC com precisão de duas casas decimais
    double expectedIMC = 22.86;
    double calculatedIMC = calculator.calculateIMC(70, 175 / 100);
    // Arredonde os valores para duas casas decimais
    expectedIMC = double.parse(expectedIMC.toStringAsFixed(2));
    calculatedIMC = double.parse(calculatedIMC.toStringAsFixed(2));
    // Teste se os valores arredondados são iguais
    expect(calculatedIMC, expectedIMC);
  });

  test('Teste de classificação do imc', () {
    // Crie uma instância da calculadora IMC
    IMCCalculator calculator = IMCCalculator();

    // Teste a classificação do IMC com diferentes valores
    expect(calculator.classifyIMC(15.0), 'Magreza grave');
    expect(calculator.classifyIMC(16.5), 'Magreza moderada');
    expect(calculator.classifyIMC(18.0), 'Magreza leve');
    expect(calculator.classifyIMC(22.0), 'Saudável');
    expect(calculator.classifyIMC(27.5), 'Sobrepeso');
    expect(calculator.classifyIMC(31.0), 'Obesidade - GRAU I');
    expect(calculator.classifyIMC(37.5), 'Obesidade - GRAU II (Severa)');
    expect(calculator.classifyIMC(42.0), 'Obesidade - GRAU III (Mórbida)');
  });
}
