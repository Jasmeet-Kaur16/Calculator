import 'dart:math';
import 'package:flutter/material.dart';
import 'package:calculator/splash.dart';
import 'package:math_expressions/math_expressions.dart';

void main(){

  runApp(
      const MaterialApp(
        home: const Splash(),
      )
  );
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  String sum="0",res="0",exp1="",exp2="";
  double fontsize1=40,fontsize2=50;
  @override
  Widget build(BuildContext context) {
    double h=MediaQuery.of(context).size.height,
        w=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(sum,style: TextStyle(color: Colors.white,fontSize: fontsize1,fontWeight: FontWeight.bold),),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(res,style: TextStyle(color: Colors.white,fontSize: fontsize2,fontWeight: FontWeight.bold),),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              botton("C", Colors.black, Colors.amber,w*0.2 ),
              botton("(", Colors.black, Colors.amber,w*0.2 ),
              botton(")", Colors.black, Colors.amber,w*0.2 ),
              botton("÷", Colors.black,Colors.amber,w*0.2 ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              botton("7", Colors.white, Colors.grey,w*0.2),
              botton("8", Colors.white, Colors.grey,w*0.2 ),
              botton("9", Colors.white, Colors.grey,w*0.2 ),
              botton("×", Colors.black, Colors.amber,w*0.2 ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              botton("4", Colors.white, Colors.grey,w*0.2 ),
              botton("5", Colors.white, Colors.grey,w*0.2 ),
              botton("6", Colors.white, Colors.grey,w*0.2 ),
              botton("-", Colors.black, Colors.amber,w*0.2 ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              botton("1", Colors.white, Colors.grey,w*0.2 ),
              botton("2", Colors.white, Colors.grey,w*0.2 ),
              botton("3", Colors.white, Colors.grey,w*0.2 ),
              botton("+", Colors.black, Colors.amber,w*0.2 ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              botton("0", Colors.white, Colors.grey,w*0.2 ),
              botton(".", Colors.white, Colors.grey,w*0.2 ),
              botton("%", Colors.white, Colors.grey,w*0.2 ),
              botton("=", Colors.black, Colors.amber,w*0.2 ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              botton("AC", Colors.black, Colors.amber,w*0.90),
            ],
          ),
        ],
      ),
    );
  }
  // here will make botton design widget
  Widget botton(String text,Color fontcolor,Color _color,double w1){
    double h=MediaQuery.of(context).size.height,
        w=MediaQuery.of(context).size.width;
    return InkWell(
      onTap: (){
       if(text=="="){
          try{
            exp1=sum;
            exp1=exp1.replaceAll("×", "*");
            exp1=exp1.replaceAll("÷", "/");
            exp1=exp1.replaceAll("%", "/100");
            exp1=exp1.replaceAll("exp1(exp1)","exp1×(exp1)");

            Parser P=Parser();
            Expression exp2=P.parse(exp1);
            ContextModel con=ContextModel();
            res="${exp2.evaluate(EvaluationType.REAL, con)}";
            sum=res;

            fontsize2=45;
            fontsize1=35;
            setState(() {});
          }catch(e){
            fontsize2=45;
            fontsize1=35;
            res="ERROR";
            setState(() {});
          }
        }else if(text=="AC"){
          fontsize2=45;
          fontsize1=35;
          sum="0";
          res="0";
          setState(() {});
        }else if(text=="C"){
          fontsize2=35;
          fontsize1=45;
          if(sum.length==1){
            sum="0";
            setState(() {
            });
          }else{
            sum=sum.substring(0,sum.length-1);
            setState(() {});
          }
        }else{
          fontsize2=35;
          fontsize1=45;
          if(sum=="0"){
            sum=text;
            setState(() {});
          }else{
            sum+=text;
            setState(() {});
          }
        }
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        alignment: Alignment.center,
        height: h*0.09,
        width: w1,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(150),
          color: _color,
        ),
        child: Text(text,style: TextStyle(color: fontcolor,fontSize: 30,fontWeight: FontWeight.bold),),
      ),
    );
  }
}