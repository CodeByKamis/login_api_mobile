import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sistema_login/api.dart';

void main() {
  runApp(const MyApp());
}
//chama esse login que é o myapp para poder navegar, ele e um intermediario entre as paginas, 
//void main -> myapp -> login -> api
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage()
    );
  }
}

//essa é a pagina de fazer login
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //essa variavel de baixo serve para espiar o que o usuario vai digitar e tudo o que o usuario digitar ele vai pegar para ele
  //user é o nome da variavel, antes disso é tipo tipagem
  TextEditingController user = TextEditingController(); //observa o nome
  TextEditingController password = TextEditingController(); //observa o password
//variaveis para logar
  String correctUser = "kamila";
  String correctPassword = "vitoria";
  //variavel para mostrar a mensagem de erro
  String erro = "";
//funcao para fazer login
  void login(){
    if(user.text == correctUser && password.text == correctPassword){
      Navigator.push(context, MaterialPageRoute(builder: (context)=> ApiPage()));
    }else{
      setState(() { //o setstate serve para permitir alterar o valor da variavel
        erro = "User ou Password incorreto";
      });
    }
  }

  //--------------------------------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        body: Center(

          child: Column(
          
            
            children: [
              const SizedBox(height: 150),
              
              Icon(Icons.person, size: 150, color: const Color.fromRGBO(233, 30, 99, 1),),
              const SizedBox(height: 90,),
              Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 80, vertical: 20),
                child: 
                TextField(//campo para o usuario digitar as informações -> é um input
                  controller: user,
                  style: TextStyle(color: Colors.white,),
                  decoration: InputDecoration(
                    hintText: "Insira o seu nome",
                    hintStyle: TextStyle(color: Colors.pink), //é o placeholder, ele é o texto de dica
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Colors.pink
                        )
                    )
                  ),
                ),
              ),
              

              Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 80, vertical: 20),
                child: 
                TextField(
                  controller: password,
                  style: TextStyle(color: Colors.white),
                  obscureText: true, //senha privada ********/
                  decoration: InputDecoration(
                    hintText: "Insira a sua senha",
                    hintStyle: TextStyle(color: Colors.pink),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Colors.pink
                      )
                    )
                  ),
                  
                ),
              ),
             
              Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 40, vertical: 9),
                child: 
                ElevatedButton(onPressed: login, child: Text("Login"), 
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                  backgroundColor: Colors.pink, 
                  foregroundColor:Colors.white,
                ),
                ), //botao
                
                
              ),
              ElevatedButton(onPressed: (){}, child: Text("Login"), 
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                  backgroundColor: Colors.pink, 
                  foregroundColor:Colors.white,
                )
                ), //botao
              const SizedBox(height: 30),
              Text("$erro", style: TextStyle(color: Colors.white, fontSize: 20),)
              
              
            ],
          ),
        ),
      ),
    );
  }
}