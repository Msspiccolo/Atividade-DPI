import 'dart:convert' show json;
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;


void main() => runApp(MyApp());
class MyApp extends StatelessWidget{
  @override

  Widget build(BuildContext context){
    return MaterialApp(
      title: 'App para consumo de API',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _HomePageState();

  }
}

class _HomePageState extends State<HomePage>{

  List<dynamic> products = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchPosts();
  }

Future<void> fetchPosts() async{

final response = await http.get(
  Uri.parse('https://app-uniara-eb91fc9ec7bf.herokuapp.com/list')
  
);
 if (response.statusCode == 200) 
 {
    setState((){
    String data =response.body;
    products = json.decode(data);

  });

 }else {
  throw Exception('Não consegui chamar o serviço que o Prof.Andre criou!');
 }
}}
 @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Lista de produtos'),
    ),
    body: ListView.separated(
      separatorBuilder: (BuildContext context, int index) => Divider(),  
      itemCount: product.length,
      itemBuilder: (BuildContext context, int index){
        return ListTile(
          title: Text(products[index]['description']), // Corrigir aqui
        );
      }
    )
  );
}
