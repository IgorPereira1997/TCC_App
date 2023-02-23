import 'package:flutter/material.dart';

class CIFPatientScreen extends StatefulWidget {
  static String routeName = '/patient-cif';
  const CIFPatientScreen({super.key});

  @override
  CIFPatientScreenState createState() => CIFPatientScreenState();
}

class CIFPatientScreenState extends State<CIFPatientScreen> {
  bool _funcaoCorporalChecked = false;
  bool _funcoesMentaisChecked = false;
  bool _conscienciaChecked = false;
  bool _orientacaoChecked = false;
  bool _funcoesEnergiaImpulsosChecked = false;
  bool _sonoChecked = false;

  void _handleFuncaoCorporalChange(bool? value) {
    setState(() {
      _funcaoCorporalChecked = value!;
      if (!value) {
        _funcoesMentaisChecked = false;
      }
    });
  }

  void _handleFuncoesMentaisChange(bool? value) {
    setState(() {
      _funcoesMentaisChecked = value!;
      if (!value) {
        _conscienciaChecked = false;
        _orientacaoChecked = false;
        _funcoesEnergiaImpulsosChecked = false;
        _sonoChecked = false;
      }
    });
  }

  void _handleConscienciaChange(bool? value) {
    setState(() {
      _conscienciaChecked = value!;
    });
  }

  void _handleOrientacaoChange(bool? value) {
    setState(() {
      _orientacaoChecked = value!;
    });
  }

  void _handleFuncoesEnergiaImpulsosChange(bool? value) {
    setState(() {
      _funcoesEnergiaImpulsosChecked = value!;
    });
  }

  void _handleSonoChange(bool? value) {
    setState(() {
      _sonoChecked = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 100,
            ),
            CheckboxListTile(
              title: const Text('FUNÇÃO CORPORAL'),
              value: _funcaoCorporalChecked,
              onChanged: _handleFuncaoCorporalChange,
            ),
            if (_funcaoCorporalChecked)
              CheckboxListTile(
                title: const Text('FUNÇÕES MENTAIS'),
                value: _funcoesMentaisChecked,
                onChanged: _handleFuncoesMentaisChange,
              ),
            if (_funcaoCorporalChecked && _funcoesMentaisChecked)
              Column(
                children: [
                  CheckboxListTile(
                    title: const Text('Consciência'),
                    value: _conscienciaChecked,
                    onChanged: _handleConscienciaChange,
                  ),
                  CheckboxListTile(
                    title: const Text('Orientação (tempo, lugar, pessoa)'),
                    value: _orientacaoChecked,
                    onChanged: _handleOrientacaoChange,
                  ),
                  CheckboxListTile(
                    title: const Text('Funções da energia e de impulsos'),
                    value: _funcoesEnergiaImpulsosChecked,
                    onChanged: _handleFuncoesEnergiaImpulsosChange,
                  ),
                  CheckboxListTile(
                    title: const Text('Sono'),
                    value: _sonoChecked,
                    onChanged: _handleSonoChange,
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
