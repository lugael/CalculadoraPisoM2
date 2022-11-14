import 'package:flutter_test/flutter_test.dart';
import 'package:m2calc/presentation/controllers/calculator_controller.dart';

void main() {
  group('Teste de cálculo', () {
    final CalculatorController calculatorController = CalculatorController();
    calculatorController.setRoomWidgth('2.4');
    calculatorController.setRoomLegth('3.22');
    calculatorController.setFloorWidth('0.6');
    calculatorController.setFloorLength('0.6');

    final result = calculatorController.calculate();

    test('Quantidade de pisos', () {
      expect(result.amountPieces, 24);
    });

    test('Quantidade de pisos para o rodapé', () {
      expect(result.amountFloor, 12);
    });

    test('Quantidade total de pisos', () {
      expect(result.amountPiecesAndFooter, 36);
    });

    test('Metragem quadrada total sem rodapé', () {
      expect(result.areaWithouFooter, 8.64);
    });

    test('Metragem quadrada total com rodapé', () {
      expect(result.areaWithFooter, 12.959999999999999);
    });
  });
}
