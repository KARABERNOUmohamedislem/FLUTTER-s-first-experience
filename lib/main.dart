import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        primarySwatch: Colors.blueGrey,

      ),
      home: MyHomePage(title: 'Home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
var selectedfood='MEAT';
  @override
  Widget build(BuildContext context) {
    var x=40.0;
    
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView (
        children: <Widget>[
          Stack(
            children: <Widget>[
              ShaderMask(
                shaderCallback: (rect){
                  return LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black,
                      Colors.transparent
                    ]
                  ).createShader(Rect.fromLTRB(0, 0, rect.width,rect.height));
                },
                blendMode: BlendMode.dstIn,
                child: Image.asset('tokyo.jpg',
              height: 0.4* MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
               ),
              ),
              Positioned(
                    left: -15,
                    top: 0,
                   child: RotatedBox(
                    quarterTurns: 3 ,
                    child: Text('JAPAN',
                   
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.4),
                      fontWeight: FontWeight.w900,
                      fontSize: 80
                      
                      
                    ),
                    
                    ),
                ),
              ),

              
              Positioned(
                top: MediaQuery.of(context).size.height*0.26,
                left: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Welcome To '.toUpperCase(),
              
              textAlign: TextAlign.center,
              
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w400,

              ),

              ),
              Row(
                children: <Widget>[
                  Text('TOKYO',
              
              style: TextStyle(
                color: Color(0xFFE74C3C),
                fontSize: 50,

              ),
                ),
                Text(', JAPAN',
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                  fontStyle: FontStyle.normal,


                ),
                ),
                ],
              )
                  ],
                ),
              ),
              Positioned(
                left: 350,
                top: 15,
              child: FloatingActionButton(
                onPressed: (){
                  return null;
                },
                child: Icon(Icons.menu,
                color: Colors.black,
                ),
                hoverColor: Colors.amber,
                splashColor: Colors.black,
                backgroundColor: Colors.white,
                ),
              ),


            ],
          ),
          
          Padding(padding: EdgeInsets.symmetric(horizontal: 40,
          vertical: 5),
          child:Container(
            
            height: x,
            decoration: BoxDecoration(
              color: Colors.grey.shade800,
              borderRadius: BorderRadius.circular(10)
            

            ),
           child:TextField(
             textInputAction: TextInputAction.go,
             decoration: InputDecoration(
               border: InputBorder.none,
               prefixIcon: Icon( Icons.search,
               color: Colors.white.withOpacity(0.5),
               ),
                hintText: 'tap to search ...',
                hintStyle: TextStyle(
                  color: Colors.white.withOpacity(0.5)
                ),
                
                
             ),
             style: TextStyle(color: Colors.white),
             
             onSubmitted: (tap){
                selectedfood =tap;
             },
            
               
           )
          ) ,
          ),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buttonBuilder('garantita', Icons.sentiment_satisfied),
               _buttonBuilder('Meat', Icons.monetization_on),
                _buttonBuilder('Sushi', Icons.favorite_border),

            ],
          ),
           Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            
            children: <Widget>[
              _buttonBuilder('Noodles', Icons.stars),
               _buttonBuilder('Hrira', Icons.sentiment_dissatisfied),
                _buttonBuilder('Bourak', Icons.keyboard),

            ],
          ),
           Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            
            children: <Widget>[
              _buttonBuilder('Coffe', Icons.color_lens),
               _buttonBuilder('Tea', Icons.sentiment_satisfied),
                _buttonBuilder('Mlik Shake', Icons.sentiment_satisfied),

            ],
          )
          
        ],
       
      ),
    );
  }
  Widget _buttonBuilder(foodName,foodIcon){
    return InkWell(splashColor: Colors.transparent,
    onTap: (){
      setState(() {
        selectedfood = foodName;

      });

    },
    child: AnimatedContainer(
      curve: Curves.easeIn,
      duration: Duration(milliseconds: 300),
      height: (selectedfood==foodName ) ? MediaQuery.of(context).size.height*0.6/3:MediaQuery.of(context).size.height*0.5/3,
      width: (selectedfood==foodName ) ? MediaQuery.of(context).size.width/3:MediaQuery.of(context).size.width/3*0.75,
     
      color: (selectedfood==foodName )?Color(0xFFE74C3C):Colors.transparent,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
       
        Icon(foodIcon,color: Colors.white),
        SizedBox(height: 10,),
        Text(foodName,style: TextStyle(color: Colors.white),)

      ],
       
      ),
    ),
    );
  }
}
