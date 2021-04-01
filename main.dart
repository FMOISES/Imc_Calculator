import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MaterialApp(
    title: "calculadora Imc",
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController peso = new TextEditingController();
  TextEditingController altura = new TextEditingController();

  String _info = "Informe seus dados acima";

  void _reset() {
    setState(() {
      peso.text = "";
      altura.text = "";
      _info = "Informe seus dados acima";
    });
  }

  void _calcular() {
    double peso_double = double.parse(peso.text);
    double altura_double = double.parse(altura.text);
    double imc = peso_double / (altura_double * altura_double);
    setState(() {
      if (imc < 18.5) {
        _info =
            "Seu Imc é ${imc.toStringAsPrecision(4)} e você está abaixo do peso.";
      }
      if (imc < 24.9 && imc >= 18.5) {
        _info =
            "Seu Imc é ${imc.toStringAsPrecision(4)} e você está no Peso Ideal.";
      }
      if (imc < 30 && imc >= 24.9) {
        _info =
            "Seu Imc é ${imc.toStringAsPrecision(4)} e você está um pouco acima do peso";
      }
      if (imc >= 25 && imc < 30) {
        _info =
            "Seu Imc é ${imc.toStringAsPrecision(4)} e você está um pouco acima do peso";
      }
      if (imc >= 30 && imc <= 34.9) {
        _info =
            "Você está com Obesidade Grau I, seu imc é ${imc.toStringAsPrecision(4)}";
      }
      if (imc >= 35 && imc < 40) {
        _info =
            "Você está com Obesidade Grau II, seu imc é ${imc.toStringAsPrecision(4)}";
      }
      if (imc > 40) {
        _info =
            "Você está com Obesidade Grau III, seu imc é ${imc.toStringAsPrecision(4)}";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Calc Imc",
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
          actions: [
            IconButton(
                onPressed: () {
                  _reset();
                },
                icon: Icon(Icons.refresh)),
          ],
        ),
        backgroundColor: Colors.blueGrey,
        body: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(10.00, 0.00, 10.00, 0.00),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Icon(
                    Icons.person_outlined,
                    size: 120.00,
                    color: Colors.white,
                  ),
                  TextFormField(
                    controller: peso,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Peso (Kg)",
                        labelStyle: TextStyle(color: Colors.white)),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black, fontSize: 25.00),
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Insira Seu peso";
                      }
                    },
                  ),
                  TextFormField(
                    controller: altura,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Altura (Metros)",
                        labelStyle: TextStyle(color: Colors.white)),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black, fontSize: 25.00),
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Insira Sua Altura";
                      }
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(5.00, 15.00, 5.00, 15.00),
                    child: Container(
                      height: 50.00,
                      child:
                          // ignore: deprecated_member_use
                          RaisedButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            _calcular();
                          }
                        },
                        color: Colors.black,
                        child: Text(
                          "Calcular",
                          style:
                              TextStyle(color: Colors.white, fontSize: 25.00),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    _info,
                    style: TextStyle(color: Colors.white, fontSize: 25.00),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            )));
  }
}
