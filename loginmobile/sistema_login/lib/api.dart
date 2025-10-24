import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiPage extends StatefulWidget {
  const ApiPage({super.key});

  @override
  State<ApiPage> createState() => _ApiPageState();
}

class _ApiPageState extends State<ApiPage> {
  //A LÓGICA E AQUI:V
  String? value; //variavel que vai armazenar o valor
  @override //precisa do override para subscrever o valor anterior
  void initState(){ //funcao responsavel por auxilia a resetar o estado da pagina toda vez que entrar nela
  super.initState();//super == sempre rodar esta funcao
  getvalue(); //funcao que busca o valor

  }
//async serve porque estamos esperando o dado vir de algum luugar
  void getvalue() async{//funcao que busca o valor
    final response = await http.get(Uri.parse("http://dummyjson.com/products")); //uri é https mais reduzido
    if (response.statusCode == 200){//se o status da requisicao for OK
      final data = jsonDecode(response.body);
      
      setState(() {
        value = data["products"][0]["title"];
      });
    }
  }

  //a logica é SEMPREEEEEEEEEEEEEEEEEEEEE antes do segundo override
  @override
  //é aqui que vamos criar a pagina agoraaa
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: value==null? CircularProgressIndicator() : 
        Center(
          child: Text("$value"),
        ),
      ),
    );
  }
}