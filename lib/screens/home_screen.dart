
import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import 'package:muslim/models/aya_of_the_day.dart';
import 'package:muslim/services/api_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   // ignore: prefer_final_fields
   ApiServices _apiServices=ApiServices();

  @override
  Widget build(BuildContext context) {

    var _size=MediaQuery.of(context).size;
    var _hijri=HijriCalendar.now();
    HijriCalendar.setLocal('ar');
    var day=DateTime.now();
    var format=DateFormat('EEE,d MMM yyyy');
    var formatted=format.format(day);

    return SafeArea(
        child: Scaffold(
          body: Column (
            children: [
              Container(
                height: _size.height*0.22,//22% of screen
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/background_img.jpg'),
                  )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      formatted,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                    RichText(
                        text:TextSpan(
                          children: <InlineSpan>[
                            WidgetSpan(
                                child:Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text( _hijri.hDay.toString(),
                                      style: const TextStyle(fontSize: 20,color: Colors.white)
                                  ),
                                ),

                            ),
                            WidgetSpan(
                                child:Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(_hijri.longMonthName,
                                      style: const TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold)
                                  ),
                                ),
                            ),
                            WidgetSpan(
                             child:  Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: Text( '${_hijri.hYear} AH',
                                   style: const TextStyle(fontSize: 20,color: Colors.white)

                               ),
                             ),
                               ),
                          ],
                        ),
                    ),
                  ],
                ),
              ),
               Expanded(
                child:SingleChildScrollView(
                  padding: const EdgeInsets.only(
                    top: 10,
                    bottom: 20
                  ),
                  child: Column(
                    children: [
                      FutureBuilder<AyaOfTheDay>(
                        future: _apiServices.getAyaOfTheDay(),
                        builder: (context, snapshot) {
                          switch(snapshot.connectionState){
                            case ConnectionState.none:
                              return const Icon(Icons.sync_problem);
                            case ConnectionState.waiting:
                            case ConnectionState.active:
                              return const CircularProgressIndicator();
                            case ConnectionState.done:
                              return  Container(
                                margin:const EdgeInsetsDirectional.all(16) ,
                                padding:const  EdgeInsetsDirectional.all(20),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(32),
                                  boxShadow: const [
                                    BoxShadow(
                                      blurRadius: 3,
                                      spreadRadius: 1,
                                      offset: Offset(0,1),
                                    )
                                  ]
                                ),
                                child: Column(
                                  children: [
                                    const Text  (
                                      'Quran Aya of the Day',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        fontSize: 18
                                      ),
                                    ),
                                    const Divider(
                                      color: Colors.black,
                                      thickness: 0.5,
                                    ),
                                    Text(
                                     snapshot.data!.arText!,
                                      style: const TextStyle(
                                        color: Colors.black45 ,
                                        fontSize: 18,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                    snapshot.data!.enTran!,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: Colors.black45 ,
                                        fontSize: 18
                                      ),
                                    ),
                                    RichText(
                                        text: TextSpan(
                                      children: <InlineSpan>[
                                        WidgetSpan(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                                snapshot.data!.surNumber!.toString(),
                                                style: const TextStyle(fontSize: 16),
                                            ),
                                          ),
                                        ),
                                        WidgetSpan   (
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              snapshot.data!.surEnName!,
                                              style: const TextStyle(fontSize: 16),
                                            ),
                                          ),
                                        ),

                                      ],
                                    )),
                                  ],
                                ),
                              );
                          }
                        }
                      ),


                    ],
                  ),
                ) ,
              ),
            ],
          ),
        )
    );
  }
}
