import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:smart_city/modules/home/home_screen.dart';
import 'package:smart_city/modules/parking/parking_screen.dart';
import 'package:smart_city/shared/components/components.dart';

class CategoryScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    RefreshController _refreshController = RefreshController();
    bool _hasInternet = false;
    bool lighted = false;
    ConnectivityResult result = ConnectivityResult.none;
    return Scaffold(
      appBar: AppBar(
        title: Text('Category'),
      ),
      body: SmartRefresher(
        onRefresh: () async {
          await Future.delayed(Duration(microseconds: 500));
          _refreshController.refreshFailed();
          _hasInternet = await InternetConnectionChecker().hasConnection;

          result = await Connectivity().checkConnectivity();

          if (_hasInternet) {
           // HomeCubit.get(context).getHomeData();
          }
        },
        onLoading: () async {
          await Future.delayed(Duration(microseconds: 500));
          _refreshController.refreshFailed();
        },
        //  enablePullUp: true,
        controller: _refreshController,
        child:  Center(


          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
              children: [



            Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: SingleChildScrollView(


                      child: InkWell(
                        onTap: (){
                          navigateTo(context, ParkingScreen());
                        },
                        child: Container(
                          width: 180,
                          height: 160,
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20))),
                            elevation: 40,
                            shadowColor: Colors.black,
                            child: Column(
                              children: [
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 20,
                                    ),


                                    Text(
                                      'Parking',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )),
                ),

                Padding(
                  padding: EdgeInsets.all(20),
                  child: SingleChildScrollView(
                      child: InkWell(
                        onTap: (){
                          navigateTo(context, HomeScreen());
                        },
                        child: Container(
                          height: 160,
                          width: 180,
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20))),
                            elevation: 40,
                            shadowColor: Colors.black,
                            child: Column(
                              children: [
                                Column(
                                  children: [

                                    Text(
                                      'Home',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),

                              ],
                            ),
                          ),
                        ),
                      )),
                ),
              ],
            )
          ]),
        ),
   ),
    );
  }
}
