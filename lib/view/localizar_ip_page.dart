import 'package:aula1invertexto/service/invertexto_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LocalizarIpPage extends StatefulWidget {
  const LocalizarIpPage({super.key});

  @override
  State<LocalizarIpPage> createState() => _LocalizarIpPageState();
}

class _LocalizarIpPageState extends State<LocalizarIpPage> {
  String? campo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/imgs/invertexto.png', fit: BoxFit.contain, height: 40),
          ],
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey,
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: "Digite o IP",
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              style: TextStyle(color: Colors.white, fontSize: 18),
              onSubmitted: (value) {
                setState(() {
                  campo = value;
                });
              },
            ),
            Expanded(
              child: FutureBuilder(
                future: localizaIp(campo),
                builder: (context, snapshot){
                  switch(snapshot.connectionState){
                    case ConnectionState.waiting:
                    case ConnectionState.none:
                      return Container(
                        width: 200.0,
                        height: 200.0,
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color> (Colors.white),
                          strokeWidth: 5.0,
                        ),
                      );
                    default:
                      if(snapshot.hasError){
                        return Container();
                      }else{
                        return exibeIp(context, snapshot);
                      }
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget exibeIp(BuildContext context, AsyncSnapshot snapshot){
    return Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: Column(
        children: <Widget> [
          TextField(        
            readOnly: true,
            decoration: InputDecoration(
            labelText: snapshot.data["city"],
            labelStyle: TextStyle(color: Colors.white),
            border: OutlineInputBorder(),
            ),
          ),
          TextField(        
            readOnly: true,
            decoration: InputDecoration(
            labelText: snapshot.data["state"],
            labelStyle: TextStyle(color: Colors.white),
            border: OutlineInputBorder(),
            ),
          ),
          TextField(        
            readOnly: true,
            decoration: InputDecoration(
            labelText: snapshot.data["state_code"],
            labelStyle: TextStyle(color: Colors.white),
            border: OutlineInputBorder(),
            ),
          ),
          TextField(        
            readOnly: true,
            decoration: InputDecoration(
            labelText: snapshot.data["country"],
            labelStyle: TextStyle(color: Colors.white),
            border: OutlineInputBorder(),
            ),
          ),
          TextField(        
            readOnly: true,
            decoration: InputDecoration(
            labelText: snapshot.data["country_code"],
            labelStyle: TextStyle(color: Colors.white),
            border: OutlineInputBorder(),
            ),
          ),
          TextField(        
            readOnly: true,
            decoration: InputDecoration(
            labelText: snapshot.data["continent"],
            labelStyle: TextStyle(color: Colors.white),
            border: OutlineInputBorder(),
            ),
          ),
          TextField(        
            readOnly: true,
            decoration: InputDecoration(
            labelText: snapshot.data["time_zone"],
            labelStyle: TextStyle(color: Colors.white),
            border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }
}