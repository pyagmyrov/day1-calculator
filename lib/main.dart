import 'package:flutter/material.dart';
import 'softButton.dart';
import 'package:neumorphic/neumorphic.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculator(),
    );
  }
}





class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  int firnum;
  int secondnum;
  String texttodisplay = "";
  String res;
  String operationperform;

void btnclicked(String btntext){

 if(btntext == "CLEAR"){
   texttodisplay = "";
   firnum  = 0;
   secondnum = 0;
   res = "";
 }else if (btntext == "+" || btntext == "-" || btntext == "/" || btntext == "*"){
   firnum = int.parse(texttodisplay);
   res = "";
   operationperform = btntext;
 }
 else if (btntext == "="){
   secondnum = int.parse(texttodisplay);
   if(operationperform == "+"){
     res = (firnum + secondnum).toString();
   }
   if(operationperform == "-"){
     res = (firnum - secondnum).toString();
   }
   if(operationperform == "/"){
     res = (firnum ~/ secondnum).toString();
   }
   if(operationperform == "*"){
     res = (firnum * secondnum).toString();
   }
 }else{
   res = int.parse(texttodisplay + btntext).toString();
 }

setState(() {
  texttodisplay = res;
});

}

Widget CustomButton(String btnval){
  return NeuButton(
     
      padding: EdgeInsets.all(25),
      decoration: NeumorphicDecoration(
        color: Color(0xffE7F0Ff),
        shape: BoxShape.circle,
      ),
      onPressed: () => btnclicked(btnval),
      child: Text(
        "$btnval",
        style: TextStyle(
            color: Colors.black45,
            fontSize: 22,
            decoration: TextDecoration.none),
      ),
    ); 
}

Widget ControlButton(String btnval){
  return NeuButton(
      padding: EdgeInsets.all(15),
      decoration: NeumorphicDecoration(
        color: Color(0xffE7F0Ff),
        shape: BoxShape.circle,
      ),
      onPressed: () => btnclicked(btnval),
      
      child: Text(
        "$btnval",
        style: TextStyle(
          
      
            color: Colors.black54,
            fontSize: 22,
            
            decoration: TextDecoration.none
      ),
    ),
    );
}

Widget ClearEqualButton(String btnval){
  return Container(
      margin: EdgeInsets.only(left: 10,right: 10),
height: 45,
          child: NeuButton(
        padding: EdgeInsets.all(15),
        decoration: NeumorphicDecoration(
          color: Color(0xffE7F0Ff),
          shape: BoxShape.rectangle,

        borderRadius: BorderRadius.circular(20)
        ),
        onPressed: () => btnclicked(btnval),
        child: Text(
          "$btnval",
          style: TextStyle(
              color: Colors.black45,
              fontSize: 15,
              decoration: TextDecoration.none),
        ),
      ),
    );
}


  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      backgroundColor: Color(0xffE7F0FF),
      body: Container(
          margin: EdgeInsets.only(
            left: 25,
            right: 25,
            top: 75,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 85.0,
                decoration: BoxDecoration(
                  color: Color(0xffE7F0FF),
                  borderRadius: BorderRadius.circular(40),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(4, 4),
                        blurRadius: 6),
                    BoxShadow(
                        color: Colors.white,
                        offset: Offset(-4, -4),
                        blurRadius: 6),
                  ],
                ),
                child: Center(
                  child: Container(
                    alignment: Alignment.centerRight,
                    margin: const EdgeInsets.only(left: 15, right: 20),
                    child: Text(
                      "$texttodisplay",
                      style: TextStyle(
                        
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        color: Colors.black54,
                        ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: CustomButton('1'),
                  ),
                  Expanded(
                    child: CustomButton('2'),
                  ),
                  Expanded(
                    child: CustomButton('3'),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: CustomButton('4'),
                  ),
                  Expanded(
                   child: CustomButton('5'),
                  ),
                  Expanded(
                    child: CustomButton('6'),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                   child: CustomButton('7'),
                  ),
                  Expanded(
                   child: CustomButton('8'),
                  ),
                  Expanded(
                    child: CustomButton('9'),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: CustomButton('0'),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ControlButton('+'),
                    ),
                    Expanded(
                      child: ControlButton('-'),
                    ),
                    Expanded(
                      child: ControlButton('/'),
                    ),
                    Expanded(
                      child: ControlButton('*'),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                margin: EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ClearEqualButton(
                        'CLEAR',
                      ),
                    ),
                    Expanded(
                      child: ClearEqualButton(
                        '=',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

