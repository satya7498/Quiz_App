import 'package:flutter/material.dart';
import 'package:quiz_app/Questions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Quiz App",
      debugShowCheckedModeBanner: false,
      home:HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var counter=0;

  List qList =[
    Question("1.The human body has four lungs.", false),
    Question("2.Kelvin is a measure of temperature.", true),
    Question("3.The Atlantic Ocean is the biggest ocean on Earth.",false),
    Question("4.Sharks are mammals.",false),
    Question("5.The human skeleton is made up of less than 100 bones.",false),
    Question("6.Atomic bombs work by atomic fission.",true),
    Question("7.Molecules are chemically bonded.",true),
    Question("8.Spiders have six legs.",false),
    Question("9.Mount Kilimanjaro is the tallest mountain in the world.",false),
    Question("10.The study of plants is known as botany.",true),

  ];
  var score=0;

  checkWin(bool userChoice , BuildContext ctx )
  {


    if(userChoice==qList[counter].isCorrect)
    {
      print("correct");

      score= score+5;
      final snackBar = SnackBar(
        duration: Duration(milliseconds : 500),
        backgroundColor: Colors.green,
        content: Text("Correct!"),);
      Scaffold.of(ctx).showSnackBar(snackBar);
    }
    else
    {print("false");
    score = score+0;
    final snackBar = SnackBar(
      duration: Duration(milliseconds : 500),
      backgroundColor: Colors.red,
      content: Text("Incorrect!"),
    );
    Scaffold.of(ctx).showSnackBar(snackBar);
    }
    setState(() {

      if(counter<9)
      {
        counter = counter +1;
      }


    });


  }

  reset()
  {
    setState(() {
      counter = 0;
      score =0;
    });
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
       title: Text('Quiz Time',style: TextStyle(letterSpacing: 2,fontSize: 35,fontWeight: FontWeight.bold,fontStyle:FontStyle.italic,color: Colors.lightBlue,)),centerTitle: true,backgroundColor: Colors.yellow,
       elevation: 0,),

       body: Builder(
    builder : (BuildContext ctx) =>Container(
         color:Colors.white,
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [

             Container(
               width: MediaQuery.of(context).size.width,
               height: MediaQuery.of(context).size.height/2,

               decoration: BoxDecoration(
                 image: DecorationImage(
                   image: AssetImage("assets/quiz1.jpg"),
                   fit:BoxFit.fill,
                 )
               ),
             ),


             Container(
               height:25,
               width:400,
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   Padding(padding:EdgeInsets.only(left: 20,right: 20)),
                   Text("Total Questions:10", style: TextStyle(fontSize:15,fontWeight: FontWeight.bold),)
                 ],
               ),
             ),
             Container(
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: <Widget>[
                   Text("Score : $score /50",style: TextStyle(color : Colors.black ,
                       fontSize: 20,fontWeight: FontWeight.bold),),

                   InkWell(
                     child: Text("Reset Game",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
                     onTap: reset,
                   )

                 ],
               ),
             ),
           Padding(padding: EdgeInsets.only(top: 10)),

             Container(
               height: 80,
                width: 400,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(30),
                 color: Colors.yellow[400],
                 border: Border.all(color: Colors.lightBlue),
                 
               ),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: <Widget>[
                 FittedBox(
                child: Text(qList[counter].qText,style: TextStyle(fontSize: 18.0,)),)

                 ],

               ),
             ),
             Padding(padding: EdgeInsets.only(top: 15)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [

                   RaisedButton(color:Colors.lightBlue,onPressed: ()=> checkWin(true, ctx),padding: EdgeInsets.fromLTRB(50, 20, 50, 20),
                   child: Text("True",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20,),),
                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),),


                   RaisedButton(color:Colors.lightBlue,onPressed: ()=> checkWin(true, ctx),padding: EdgeInsets.fromLTRB(50, 20, 50, 20),
                     child: Text("False",style: TextStyle(fontWeight: FontWeight.bold
                       ,color: Colors.white,fontSize: 20,),),
                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25 )),),

                 ],

    ),


           ],

         )
       ),

    ),);
  }
}
