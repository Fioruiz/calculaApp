import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ),
  );
}



class MyApp extends StatefulWidget{
  
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

   
  double sliderAlturaValue = 0;
  double sliderPesoValue = 0;
  bool isBold = false;

   double imcValue=0;
  String valBajo="Bajo de Peso";
  String valNormal="Normal";
  String valsobrePeso="Sobrepeso";
  String valObesidad="Obesidad";

  String imcBajo="Usted se encuentra dentro del rango de peso insuficiente. Es necesario que mantenga una alimentación saludable.";
  String imcNormal="Usted se encuentra dentro del rango de peso saludable. Felicitaciones!!!";
  String imcSobrePeso="Usted se encuentra dentro del rango de sobrepeso. Es necesario que realice algún tipo de ejercicio.";
  String imcObesidad="Usted se encuentra dentro del rango de obesidad.Debería acudir a un especialista.";

  String mensajeIMC="";
  String valorIMC="";
  String imgIMC="assets/images/imgInicial.png";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Calcular MC"), backgroundColor: Colors.indigo,),
        body:Padding(
          padding: const EdgeInsets.all(16.0),
          child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                Text("Altura"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      sliderAlturaValue.toStringAsFixed(1),
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      "cm",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal
                      ),
                    ),
                  ],
                ),
                
                Slider(
                  value: sliderAlturaValue,
                  min: 0,
                  max: 2.5,
                  activeColor: Colors.blueAccent,
                  inactiveColor: Colors.grey,
                  thumbColor: Colors.blueAccent,
                  onChanged: (alturaimg) {
                    sliderAlturaValue = alturaimg;
                    setState(() {});
                },
              ),
              Text("Peso"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      sliderPesoValue.toStringAsFixed(1),
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      "kg",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal
                      ),
                    ),
                  ],
                ),
                
                Slider(
                  value: sliderPesoValue,
                  min: 0,
                  max: 200,
                  activeColor: Colors.blueAccent,
                  inactiveColor: Colors.grey,
                  thumbColor: Colors.blueAccent,
                  onChanged: (peso) {
                    sliderPesoValue = peso;
                    setState(() {});
                },
              ),
              ElevatedButton(
                onPressed: (){
                  imcValue = sliderPesoValue/(sliderAlturaValue*sliderAlturaValue);
                  datosIMC();
                 /* if(imcValue<18.5) { mensajeIMC=imcBajo; valorIMC=valBajo;}
                  if(imcValue>18.5 && imcValue<24.9) { mensajeIMC=imcNormal; valorIMC=valNormal;}
                  if(imcValue>25.0 && imcValue<29.9) { mensajeIMC=imcSobrePeso; valorIMC=valsobrePeso;}
                  if(imcValue>30.0) { mensajeIMC=imcObesidad; valorIMC=valObesidad;}*/
                  setState(() {});
                },
                child: Text("Calcular")
              ),
              Text(
                  imcValue.toStringAsFixed(1),
                    style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold
                    ),
              ),
              Text(
                valorIMC,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.normal,
                  color: Colors.blueAccent
                ),
              ),
               Text(
                mensajeIMC,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey,
                ),
              ),
              Image.asset(imgIMC),
            ],

            ),
        ),
       ),
     );
  }

  void datosIMC(){
    if(imcValue<18.5) { 
      mensajeIMC=imcBajo; 
      valorIMC=valBajo;
      imgIMC="assets/images/imgBajoPeso.png";
     }
    else if(imcValue>18.5 && imcValue<24.9) {
       mensajeIMC=imcNormal; 
       valorIMC=valNormal;
        imgIMC="assets/images/imgNormal.png";
    }else if(imcValue>25.0 && imcValue<29.9) { 
      mensajeIMC=imcSobrePeso; 
      valorIMC=valsobrePeso;
       imgIMC="assets/images/imgSobrepeso.png";
    }
    else  if(imcValue>30.0) {
       mensajeIMC=imcObesidad;
        valorIMC=valObesidad;
         imgIMC="assets/images/imgObesidad.png";
    }
      
  }
}

