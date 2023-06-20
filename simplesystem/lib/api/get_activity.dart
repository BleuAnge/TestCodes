import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/cupertino.dart';

import '../pages/home/bloc/home_bloc.dart';
import '../pages/home/models/activities_model.dart';

FutureOr<void> homeIntializedEvent(
  HomeIntializedEvent event, 
  Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    try {
      List<Map<String, dynamic>?> activityList = [];
      for(int i = 0; i < 10; i++) {
        String url = "https://www.boredapi.com/api/activity";
        http.Response res = await http.get(Uri.parse(url));
        if(res.statusCode == 200) {
          dynamic responseBody = res.body;

          Map<String, dynamic>? parsedBody;

          if (responseBody is String) {
            parsedBody = jsonDecode(responseBody);
          }

          activityList.add(parsedBody);
        } //end if
      } // end for

      if(activityList.isNotEmpty) {
        emit(HomeLoadSuccessState(
          activities: activityList.map(
            (e) => ActivityModel(
                    activity: e!['activity'], 
                    type: e['type'], 
                    participants: e['participants'], 
                    price: e['price'], 
                    link: e['link'], 
                    key: e['key'], 
                    accessability: e['accessibility'])
                  ).toList()
          )
        );
      }
      
    }
    catch(e) {
      debugPrint(e.toString());
    }
}
