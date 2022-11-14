import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:m2calc/core/helpers/validator_helper.dart';
import 'package:m2calc/presentation/controllers/calculator_controller.dart';
import 'package:m2calc/presentation/widget/result_dialog.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final _formKey = GlobalKey<FormState>();
  final _controller = CalculatorController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculadora de pisos')),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(20),
          child: _buildForm(),
        ),
      ),
    );
  }

  Form _buildForm() {
    return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildHeaderText('Dimesões do cômodo'),
            _buildVerticalSpace(),
            _buildNumberInputField(
              'Largura (metro)',
              onSaved: _controller.setRoomWidgth,
            ),
            _buildVerticalSpace(),
            _buildNumberInputField(
              'Comprimento (metros)',
              onSaved: _controller.setRoomLegth,
            ),
            _buildVerticalSpace(),
            _buildHeaderText('Dimesões do piso'),
            _buildVerticalSpace(),
            _buildNumberInputField(
              'Largura (centimetros)',
              onSaved: _controller.setFloorWidth,
            ),
            _buildVerticalSpace(),
            _buildNumberInputField(
              'Comprimento (centimetros)',
              onSaved: _controller.setFloorLength,
            ),
            _buildVerticalSpace(height: 40),
            _buildCalculateButton(),
          ],
        ));
  }

  _buildVerticalSpace({double height = 20}) {
    return SizedBox(
      height: height,
    );
  }

  _buildHeaderText(String title) {
    return Container(
      height: 40,
      decoration: const BoxDecoration(color: Colors.amber),
      child: Center(
          child: Text(
        title,
        style: TextStyle(
          color: Theme.of(context).colorScheme.secondary,
          fontWeight: FontWeight.bold,
        ),
      )),
    );
  }

  _buildNumberInputField(String label, {required Function(String?) onSaved}) {
    return TextFormField(
      onSaved: onSaved,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: label,
      ),
      validator: (value) => ValidatorHelper.isValidText(value),
      keyboardType: TextInputType.number,
    );
  }

  _buildCalculateButton() {
    return ElevatedButton(onPressed: _calculate, child: const Text('Calcular'));
  }

  _calculate() {
    final formState = _formKey.currentState;
    if (formState != null && formState.validate()) {
      formState.save();
      final result = _controller.calculate();
      showDialog(context: context, builder: (context) => ResultDialog(resultEntity: result));
    }
  }
}
