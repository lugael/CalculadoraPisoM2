import 'package:flutter/material.dart';
import 'package:m2calc/domain/entites/result_entity.dart';

class ResultDialog extends StatelessWidget {
  const ResultDialog({super.key, required this.resultEntity});
  final ResultEntity resultEntity;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Resultado'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text('${resultEntity.amountPieces} pisos'),
            subtitle: const Text('Quantidade de pisos'),
          ),
          ListTile(
            title: Text('${resultEntity.amountFloor} pisos'),
            subtitle: const Text('Quantidade de pisos para o rodapé'),
          ),
          ListTile(
            title: Text('${resultEntity.amountPiecesAndFooter} pisos'),
            subtitle: const Text('Total de pisos'),
          ),
          const Divider(),
          ListTile(
            title: Text('${resultEntity.areaWithouFooter} m²'),
            subtitle: const Text('Metragem quadrada sem rodapé'),
          ),
          ListTile(
            title: Text('${resultEntity.areaWithFooter.toStringAsFixed(2)} m²'),
            subtitle: const Text('Metragem quadrada com rodapé'),
          )
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Continuar'),
        )
      ],
    );
  }
}
