import 'package:flutter/material.dart';

class ServicesScreen extends StatefulWidget {
  @override
  _ServicesScreenState createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Container(
        color: Colors.lightBlue,
        alignment: Alignment.center,
        padding: const EdgeInsets.only(
            left: 20.0, right: 20.0, top: 92.0, bottom: 64.0),
        constraints: BoxConstraints.expand(),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        image: DecorationImage(
                            image: AssetImage("assets/images/mecanico.png"),
                            fit: BoxFit.fill),
                      ),
                      child: InkWell(
                        onTap: () {
                          print("printa");
                        },
                      ),
                    ),
                    Text(
                      'Chame um Mecânico',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 30),
                Column(
                  children: [
                    Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        image: DecorationImage(
                            image: AssetImage("assets/images/compracarro.png"),
                            fit: BoxFit.fill),
                      ),
                      child: InkWell(
                        onTap: () {
                          print("printa");
                        },
                      ),
                    ),
                    Text(
                      'Chame um Avaliador',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        image: DecorationImage(
                            image: AssetImage("assets/images/guincho.jpg"),
                            fit: BoxFit.fill),
                      ),
                      child: InkWell(
                        onTap: () {
                          print("printa");
                        },
                      ),
                    ),
                    Text(
                      'Chame um Guincho',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 30),
                Column(
                  children: [
                    Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        image: DecorationImage(
                            image: AssetImage("assets/images/orcamento.png"),
                            fit: BoxFit.fill),
                      ),
                      child: InkWell(
                        onTap: () {
                          print("printa");
                        },
                      ),
                    ),
                    Text(
                      'Avalie um Orçamento',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        image: DecorationImage(
                            image: AssetImage("assets/images/bateria.jpg"),
                            fit: BoxFit.fill),
                      ),
                      child: InkWell(
                        onTap: () {
                          print("printa");
                        },
                      ),
                    ),
                    Text(
                      'Minha Bateria Acabou',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 30),
                Column(
                  children: [
                    Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        image: DecorationImage(
                            image: AssetImage("assets/images/pneu.png"),
                            fit: BoxFit.fill),
                      ),
                      child: InkWell(
                        onTap: () {
                          print("printa");
                        },
                      ),
                    ),
                    Text(
                      'Meu Pneu Furou',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
