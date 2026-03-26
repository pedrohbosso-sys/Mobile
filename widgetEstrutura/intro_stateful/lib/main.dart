import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intro_stateful/intro_exibicao/lib/main.dart';


void main(List<String> args) {
  runApp(MaterialApp(
    home: MyApp()
  ));
}

// importando as caracteristicas da página StateFul
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  // método para indentificar as mudanças de estado e chamar a reconstrução da janela
  @override //reescrita de um método existente
  State<MyApp> createState() => _MyAppState();
  //arrow Fucntion
}

//class para construção da lógica e da estrutura da janela
class _MyAppState extends State<MyApp>{
  //a classe normal da aplicação
  //atributos
  int contador = 0;

  //método build da tela (método Obrigatório)
  @override
  Widget build(BuildContext context){
    return Scaffold(
      //appBar - titulo do app
      appBar: AppBar(title: Text("Aplicativo com Stateful - contador")),
        //body
      //container para espa
      body: Padding(
        padding: EdgeInsets.all(8), //Espaçamento interno de 8 em todas as formas
        //Container para centralizar no meio da tela (esquerda e direita)
        child: Center(
          //|->e<-|
          //Column => permite adicionar mais de um elemento 
          child: Column(
            //Centraliza os elementos no Eixo principal da column  (y)
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Nº de Click $contador", style: TextStyle(fontSize: 20)),
              // adicioanr um botão => toda vez que for pressionado  vai criar uma ação ( uma mudança de Estado)
              ElevatedButton(onPressed: (){
                setState(() {
                  //Colocar uma modificação na tela
                  contador ++; //Adiciona 1 ao computador
                });

              }, child: Text("Adicionar +1"),)            
            ],
          ),
        ),
      )  
      );
  }

}