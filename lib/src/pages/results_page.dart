import 'package:flutter/material.dart';
import '../models/imc.dart';
import '../shared/constants.dart';
import '../components/bottom_button.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({
    super.key,
    required this.indexes,
  });

  final List<IMC> indexes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(kApplicationTitle),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              height: 50.0,
              padding: const EdgeInsets.all(15.0),
              alignment: Alignment.topLeft,
              child: const Text(
                'Seus Resultados',
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ListView.builder(
              itemCount: indexes.length,
              itemBuilder: (context, index) {
                var imc = indexes[index];
                return ListTile(
                  leading: Text(
                    imc.calcular(),
                    style: kBMITextStyle,
                  ),
                  title: Text(
                    imc.classificar().toUpperCase(), //classificar
                    style: kResultTextStyle,
                  ),
                );
              },
            ),
          ),
          BottomButton(
            buttonTitle: 'RECALCULAR',
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
