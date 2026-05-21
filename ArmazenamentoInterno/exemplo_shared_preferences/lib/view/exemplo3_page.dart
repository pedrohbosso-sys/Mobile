import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Exemplo3Page extends StatefulWidget {
  const Exemplo3Page({super.key});

  @override
  State<Exemplo3Page> createState() => _Exemplo3PageState();
}

class _Exemplo3PageState extends State<Exemplo3Page> {
  List<String> _tarefas = []; //Armazena as tarefas
  final TextEditingController _inputTarefa = 
  TextEditingController(); //Controla o input das tarefas

  late SharedPreferences _prefs;
  String nome = "";



  //metodos
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadTarefas();
  }

  Future<void> _loadTarefas() async{
    //Conectar o app shared
    _prefs = await SharedPreferences.getInstance();
    nome = _prefs.getString("nome") ?? ""; //Verificar de nulidade 
    
    setState(() {
      _tarefas = _prefs.getStringList("tarefas+$nome") ?? [];
    });
    
  }

  //Salvar dados no shared
  void _savePreferences() async{
    _prefs = await SharedPreferences.getInstance();
    nome = _prefs.getString("nome") ?? "";
    //Salvar as preferencias 
    await _prefs.setStringList("tarefas+$nome", _tarefas);

    setState(() {

    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lista de tarefas do $nome"),),
      body: Padding(padding: EdgeInsets.all(8),
      child: Column(
        children: [
          TextField(
            controller: _inputTarefa,
            decoration: InputDecoration(labelText: "Digite a terfas..."),
          ),
          ElevatedButton(
            onPressed: (){
              setState(() {
                _tarefas.add(_inputTarefa.text.trim());//Adicionar a tarefa no vetor
                _savePreferences();
            });
          }, 
          child: Text("Adicionar")),
          SizedBox(height: 20,),
          //Listar as tarefas
          Expanded(
            child: ListView.builder(
              itemCount: _tarefas.length, //Tamanho do vetor de tarefas
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_tarefas[index]),
                  onLongPress: () {
                    setState(() {
                      _tarefas.removeAt(index); //remove a tarefa
                      _savePreferences(); //Slava no shared
                    });
                  },
                );
              },
          ))
        ],
      ),
      ),
    );
  }
}