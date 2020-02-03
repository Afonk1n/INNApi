import 'package:flutter/material.dart';
import 'package:flutter_api/post_result_model.dart';
import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'post_result_model.dart';


void main() {
  runApp(MaterialApp(
    title: 'Flutter',
    home: FirstScreen(),
  ));
}

class FirstScreen extends StatefulWidget {

  @override

  _FirstScreenState createState() {
    return _FirstScreenState();
  }
}

class _FirstScreenState extends State<FirstScreen> {
  String inn;

  PostResult postResult = null;
  final _textStyleYellow =  TextStyle(
      color: Colors.yellow[500],
      letterSpacing: 2.0,
      fontSize: 16.0,
      fontWeight: FontWeight.bold
  );
  TextEditingController textInnController = TextEditingController();
  @override


  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        title: Text('INN Checker',
          style: TextStyle(
            color: Colors.grey[600],
          ),),
        centerTitle: true,
        backgroundColor: Colors.yellow[500],
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 1.0),
            TextFormField(controller: textInnController,
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.yellow[500], width: 3.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.yellow[500], width: 3.0),
                ),
                labelText: 'INN',
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
              maxLines: 1,),
            SizedBox(height: 20.0),
            RaisedButton(
              child: Text(
                'Check',
                style: TextStyle(fontSize: 24,
                    color: Colors.grey[800]),
              ),
              color: Colors.yellow[500],
              onPressed: () {
                inn = textInnController.text;
                PostResult.connectToAPI(inn).then((value) {
                  postResult = value;
                  setState(() {
                  });
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}





