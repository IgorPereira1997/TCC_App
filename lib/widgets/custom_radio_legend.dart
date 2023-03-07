import 'package:flutter/material.dart';

class RadioLegend extends StatelessWidget {
  const RadioLegend({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const List<int> values = [0, 1, 2, 3, 4, 8, 9];

    final Map<int, String> legendText = {
      0: 'Nenhuma deficiência',
      1: 'Deficiência leve',
      2: 'Deficiência moderada',
      3: 'Deficiência grave',
      4: 'Deficiência completa',
      8: 'Não especificada',
      9: 'Não aplicável',
    };

    return Center(
      child: Column(
        children: [
          const Text('Assinale com um (X) o valor mais adequado à situação,'),
          const Text('de acordo com os seguintes qualificadores:'),
          const SizedBox(
            height: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: List.generate(values.length, (index) {
              return Padding(
                padding: const EdgeInsets.only(left: 20, right: 18),
                child: Row(
                  children: [
                    Text('${values[index]} - ${legendText[values[index]]}'),
                    const SizedBox(width: 8),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
