import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:smart_city/modules/home/cubit/cubit.dart';
import 'package:smart_city/modules/home/cubit/states.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context,) {
    RefreshController _refreshController = RefreshController();
    bool _hasInternet =false;
    ConnectivityResult result = ConnectivityResult.none;
    var tempController= TextEditingController();
    double temperature = 7;
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<HomeCubit, HomeStates>(
      listener:(context,state){
        if(state is ParkingSuccessHomeState){
          if(state.homeModel.status){
            var model = HomeCubit.get(context).homeModel;
            tempController.text =model.data.temp;

          }

        }
      } ,
      builder: (context,state){
        return Scaffold(
          body: SmartRefresher(
            onRefresh:() async {
              await Future.delayed(Duration(microseconds: 500));
              _refreshController.refreshFailed();
              //Restart.restartApp();

              _hasInternet=await InternetConnectionChecker().hasConnection ;
              final color = _hasInternet ? Colors.green :Colors.red;

              result= await Connectivity().checkConnectivity();

              if(_hasInternet){
                HomeCubit.get(context).getHomeData();

              }
            },
            onLoading:() async {
              await Future.delayed(Duration(microseconds: 500));
              _refreshController.refreshFailed();
            },
            //  enablePullUp: true,
            controller: _refreshController,
            child: Column(children: [
              SizedBox(height: 20),
              Text(
                'Today',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w200,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: SleekCircularSlider(
                        appearance: CircularSliderAppearance(
                          /* customColors: CustomSliderColors(
                            trackColor: Colors.black12,
                            dotColor: Colors.blueGrey[600],
                            progressBarColor: Colors.blueGrey[300],
                          ),*/
                          startAngle: 0,
                          angleRange: 360,
                          size: 300,


                          customWidths:
                          CustomSliderWidths(progressBarWidth: 0, handlerSize:0),
                        ),

                        initialValue: temperature,
                        onChangeEnd: (_value) => _value,
                        innerWidget: (percentage) => Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Center(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 7,
                                    spreadRadius: 8,
                                  ),
                                ],
                              ),
                              child: Container(
                                margin: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.blueGrey,
                                    width: 1,
                                  ),
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: Center(

                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 60,
                                      ),
                                      Text(
                                        '${tempController.text}°C',
                                        style: TextStyle(
                                          fontSize: 12 + (22 * 683 / size.height),
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        'Temperature',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.black,
                                        ),
                                      ),

                                    ],
                                  ),

                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: SleekCircularSlider(
                        appearance: CircularSliderAppearance(
                          customColors: CustomSliderColors(
                            trackColor: Colors.black12,
                            dotColor: Colors.blueGrey[600],
                            progressBarColor: Colors.blueGrey[300],
                          ),
                          startAngle: 130.0,
                          angleRange: 280.0,
                          size: 300,


                          customWidths:
                          CustomSliderWidths(progressBarWidth: 5, handlerSize: 10),
                        ),
                        min: 0,
                        max: 30,
                        initialValue: temperature,
                        onChangeEnd: (_value) => _value,
                        innerWidget: (percentage) => Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Center(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 7,
                                    spreadRadius: 8,
                                  ),
                                ],
                              ),
                              child: Container(
                                margin: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.blueGrey,
                                    width: 1,
                                  ),
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: Center(

                                  child:
                                  Column(
                                    children: [
                                      SizedBox(
                                        height: 75,
                                      ),
                                      Text(
                                        '90',
                                        style: TextStyle(
                                          fontSize: 10 + (22 * 683 / size.height),
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        'Gas',
                                        style: TextStyle(
                                          fontSize: 9 + (22 * 683 / size.height),
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),


              ),
            ]),
          ),
        );
      },
    );

  }
}
