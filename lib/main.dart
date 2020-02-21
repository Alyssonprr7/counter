import 'package:flutter/material.dart'; // Sempre vamos importar isso para usar nos Apps

void main() {
  runApp(MaterialApp(
    title: "Contador de Pessoas", //Interno, nao veremos em lugar nenhum no App
    home: Home() 
  ));
}


class Home  extends StatefulWidget { //Criando um Widget Statefull 
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home > {
  
  int _people = 0;
  String _infotext = "Pode Entrar";

  void _changePeople(int delta) {
    setState(() { //para mudar o estado e refazer a tela 
      _people += delta;

      if(_people <0) {
        _infotext = "Tá me Gastando?"; 
      } else if (_people <=10){
        _infotext = "Pode Entrar";
      } else {
        _infotext = "Está Lotado";
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "images/restaurant.jpg",
          fit: BoxFit.cover, // Ficar a tela toda cheia 
          height: 1000.0,),
        Column(
      mainAxisAlignment: MainAxisAlignment.center, // Alinhar o texto no centro do eixo principal (vertical)
      children: <Widget>[
        Text
        ("Pessoas: $_people",
        style: TextStyle(
          color: Colors.white, 
          fontWeight: FontWeight.bold),),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10.0), //Padding em todos os lados igualmente
              child: FlatButton(
                child: Text("+1", style: TextStyle (
                  fontSize: 40.0,
                  color: Colors.white
                )) ,
                onPressed: () {
                  _changePeople(1);} ,),
            ),

            Padding(
              padding: EdgeInsets.all(10.0), //Padding em todos os lados igualmente
              child: FlatButton(
                child: Text("-1", style: TextStyle (
                  fontSize: 40.0,
                  color: Colors.white
                )) ,
                onPressed: () {
                  _changePeople(-1);
                } ,),
            ),  
          ],
        ), 

        Text
        (_infotext,
        style: TextStyle(
          color: Colors.white, 
          fontStyle: FontStyle.italic,
          fontSize: 30.0,))
      ],
    )
      ],
    );
  }
}