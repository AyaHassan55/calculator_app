
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {


  @override
  State<Calculator> createState() => _CalculatorState();

}

class _CalculatorState extends State<Calculator> {
  String userInput="";
  String result="0";
  List<String> buttonList=[
    'AC','(',')','/','7','8','9','*','4','5','6','+','1','2','3','-',
    'C','0','.','=',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
 backgroundColor: Color(0xFF1d2630),
      body:   Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height ,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                Container(
                  padding:const EdgeInsets.all(70),
                  alignment: Alignment.centerRight,
                  child: Text(userInput,
                    style: TextStyle(
                    fontSize: 32,
                      color:Colors.white,


                    ),),
                ),
                   Container(
                      padding:EdgeInsets.all(10),
                      alignment: Alignment.centerRight,
                      child: Text(result,
                        style: TextStyle(
                        fontSize: 48,
                        color:Colors.white,
                          fontWeight: FontWeight.bold,
                      ),),
                    ),

                  Divider( color: Colors.white,),
                  Expanded(

                    child: Container(
                      padding:EdgeInsets.all(10),

                      child: GridView.builder(
                        itemCount: buttonList.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,crossAxisSpacing: 12,mainAxisSpacing: 12,
                          ), itemBuilder: (BuildContext context,int idx){
                          return CustomButton(buttonList[idx]);
                      }),
                    ),
                  )
              ],),
            ),
          ],
        ),


    );
  }
  Widget CustomButton(String text){
    return InkWell(
      splashColor:  Color(0xFF263238),
      onTap: (){
        setState(() {
          handleButtons(text);
        });
      },
      child: Ink(
        decoration: BoxDecoration(
          color: getBGColor(text),
          borderRadius: BorderRadius.circular(10),
          boxShadow:[
            BoxShadow(
              color: Colors.white.withOpacity(0.1),
              blurRadius: 4,
              spreadRadius: 0.5,
              offset: Offset(-3,-3),
            ),
          ],
        ),
        child: Center(
          child: Text(text,style: TextStyle(
            color:  getColor(text),
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
          ),
        ),
      ),
    );
  }

  getColor(String text){
     if(text=='/'||text=='*'||text=='-'||text=='+'||text=='C'||text=='('||text==')'){
      return Color(0xffF28F8F);
    }
     return Colors.white;
  }
  getBGColor(String text){
    if(text=='AC'){
      return Color(0xffF28F8F);
    }
    if(text=='='){
      return  Color(0xffF28F8F);
    }
    return Color(0xFF263238);
  }
  handleButtons(String text){
    if(text=="AC"){
      result="0";
      userInput="";
      return;
    }
    if(text=="C"){
      if(userInput.isNotEmpty){
        userInput=userInput.substring(0,userInput.length-1);
        return;
      }else{
        return null;
      }
    }
    if(text=="="){
      result=Calcc();
      userInput=result;
      if(userInput.endsWith(".0")){
        userInput=userInput.replaceAll(".0", "");
        return;
      }

      if(result.endsWith(".0")){
        result=result.replaceAll(".0", "");
        return;
      }
    }
    userInput =userInput+text;

  }
  String Calcc(){
    try{
      var equ=Parser().parse(userInput);
      var eval=equ.evaluate(EvaluationType.REAL, ContextModel());
      return eval.toString();
    }catch(e){
      return "Error";
    }
  }

  }


