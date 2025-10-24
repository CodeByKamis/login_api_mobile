import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiAll extends StatefulWidget {
  const ApiAll({super.key});

  @override
  State<ApiAll> createState() => _ApiPageState();
}

class _ApiPageState extends State<ApiAll> {
  //A LÓGICA E AQUI:V
  List<dynamic>? value; //variavel que vai armazenar o valor
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
        value = data["products"];
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
          child: ListView.builder(itemCount: value!.length, //item é a quantidade de itens a ser construido
          itemBuilder: (context, index){
            final item = value![index];//value[0]
            return Container(
              width: 150,
              height: 150,
              color: Colors.blue,
              child: Center(
                child: Text(("${item["name"]}")),
              ) ,
            );
          },//é o componente que você vai construir para cada linha da lista
          )
        ),
      ),
    );
  }
}