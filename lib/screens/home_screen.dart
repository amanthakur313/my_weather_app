

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_weather_app/Models/weather_models.dart';
import 'package:my_weather_app/services/weather_services.dart';
import 'package:my_weather_app/widgets/weather_card.dart';
class HomeScreen extends StatefulWidget{

State<HomeScreen> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen>{
final WeatherServices _weatherServices = WeatherServices();

final TextEditingController _controller = TextEditingController();
bool _isLoading = false;

Weather? _weather;
void _getWeather() async{
  setState(() {
    _isLoading = true;
  });
  try{
    final weather = await _weatherServices.fetchWeather(_controller.text);
    setState(() {
      _isLoading = false;
      _weather = weather;

    });
  }catch(e){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Error fetching weather data")),
    );

  }
}

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: Container(
       width: double.infinity,
       height: double.infinity,

       decoration: BoxDecoration(
         gradient: _weather !=null && _weather!.description.toLowerCase().contains('rain')
             ? const LinearGradient(colors: [Colors.grey,Colors.blueGrey],
         begin: Alignment.topCenter,
           end: Alignment.bottomCenter
         ):
             _weather!=null && _weather!.description.toLowerCase().contains('clear')
             ?
                 LinearGradient(colors: [Colors.orangeAccent,
                 Colors.blueAccent],
                 begin: Alignment.topCenter,
                   end: Alignment.bottomCenter)
                 :
                 LinearGradient(colors: [Colors.grey,
                 Colors.lightBlueAccent],
                 begin:Alignment.topCenter,
                 end:Alignment.bottomCenter)
       ),
       child: SingleChildScrollView(

        child: Padding(padding: EdgeInsets.all(16.0),
          child: Column(
children: [
  SizedBox(
    height: 25,
  ),
  Text('Weather App',style: TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  ),),
  SizedBox(
    height: 25,
  ),
  TextField(
    controller: _controller,
      style: TextStyle(
        color: Colors.white,),
    decoration: InputDecoration(
      hintText:'Enter Your City',
      hintStyle: TextStyle(color: Colors.white70),
      filled: true,
      fillColor: Color.fromARGB(110,255,255,255),
      border:OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide.none
      )
    ),
  ),
  SizedBox(
    height: 20,
  ),
  ElevatedButton(onPressed: _getWeather, child:Text('_Get Weather',
    style: TextStyle(
    fontSize: 18,


  ),

  ),
    style: ElevatedButton.styleFrom(
      backgroundColor: Color.fromARGB(209,125,155,170),
foregroundColor: Colors.lightBlueAccent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      elevation: 1,
    ),
  ),
            if (_isLoading)
           Padding(
           padding: EdgeInsets.all(20),
       child: CircularProgressIndicator(color: Colors.white),
     ),
if(_weather != null)
  WeatherCard(weather: _weather!),
],
          ),),
       ),
     ),
   );
  }
}