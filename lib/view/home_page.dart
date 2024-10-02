import 'package:aula1invertexto/view/busca_cep_page.dart';
import 'package:aula1invertexto/view/localizar_ip_page.dart';
import 'package:aula1invertexto/view/por_extenso_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State <HomePage> createState() =>  HomePageState();
}

class  HomePageState extends State <HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/imgs/invertexto.png', fit: BoxFit.contain, height: 40),
          ],
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey,
      body: Padding(padding: EdgeInsets.all(10), 
      child: Column(
        children: <Widget>[
            GestureDetector(
              child: Row(
                children: <Widget>[
                  Icon(Icons.edit, color: Color.fromARGB(255, 0, 0, 0), size: 70),
                  Text(
                    "Por Extenso",
                    style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 22),
                  )
                ],
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => PorExtensoPage()));
              },
            ),
            GestureDetector(
              child: Row(
                children: <Widget>[
                  Icon(Icons.home, color: Color.fromARGB(255, 0, 0, 0), size: 70),
                  Text(
                    "Busca Cep",
                    style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 22),
                  )
                ],
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => BuscaCepPage()));
              },
            ),
            GestureDetector(
              child: Row(
                children: <Widget>[
                  Icon(Icons.home, color: Color.fromARGB(255, 0, 0, 0), size: 70),
                  Text(
                    "Localizar IP",
                    style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 22),
                  )
                ],
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => LocalizarIpPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}