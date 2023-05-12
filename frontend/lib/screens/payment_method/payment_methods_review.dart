import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/widgets/appbar/app_bar_return.dart';

class PaymentMethodsReview extends StatefulWidget {
  const PaymentMethodsReview({super.key});

  @override
  State<PaymentMethodsReview> createState() => _PaymentMethodsReview();
}

class _PaymentMethodsReview extends State<PaymentMethodsReview> {
  final _infoTarjetas = [
    [
      "4617400492615371",
      "MyBank",
    ],
    ["379831825742753", "Bankito"],
    ["5479009451749305", "HCBS"]
  ];

  Widget iconoTarjeta(String numero) {
    switch (numero[0]) {
      case '3':
        return SvgPicture.asset('assets/icons/american_express.svg');
      case '4':
        return SvgPicture.asset('assets/icons/visa.svg');
      case '5':
        return SvgPicture.asset('assets/icons/master_card.svg');
    }
    return Icon(
      Icons.credit_card,
      weight: 20,
      color: Colors.black,
    );
  }

  @override
  Widget build(BuildContext contex) {
    List<Widget> _tarjetas = [];

    for (int i = 0; i < _infoTarjetas.length; i++) {
      _tarjetas.add(
        //Esta es la parte que tiene que generarse dinamicamente
        ElevatedButton(
          onPressed: () {
            print(
                _infoTarjetas[i][0].substring(_infoTarjetas[i][0].length - 3));
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFEBE7E7),
              elevation: 1,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0))),
          child: Row(
            children: [
              SizedBox(
                  width: 65.0,
                  height: 65.0,
                  child: iconoTarjeta(_infoTarjetas[i][0])),
              const SizedBox(
                width: 10.0,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _infoTarjetas[i][1],
                    style: const TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  Text(
                    "Tarjeta terminada en ${_infoTarjetas[i][0].substring(_infoTarjetas[i][0].length - 3)}",
                    style: const TextStyle(
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                        color: Colors.black),
                  )
                ],
              ),
            ],
          ),
        ),
      );
      _tarjetas.add(
        SizedBox(
          height: 15,
        ),
      );
    }

    return Scaffold(
      appBar: const AppBarReturn(
        title: "Tarjetas",
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              //Tarjetas
              const Text(
                "Tarjetas",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: _tarjetas,
              ),

              //Agregar tarjeta
              ElevatedButton(
                onPressed: () {
                  print("Agregar");
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFEBE7E7),
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0))),
                child: Row(
                  children: [
                    Icon(
                      Icons.add_circle_outlined,
                      color: Colors.green.shade600,
                      size: 55.0,
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    const Expanded(
                        child: Text("Agregar tarjeta",
                            style: TextStyle(
                                fontSize: 18, 
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              )
                        )
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
