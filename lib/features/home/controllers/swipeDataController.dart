import 'dart:convert';

import 'package:chat_box/features/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:chat_box/features/home/models/swipeDataModel.dart';
import 'package:chat_box/shared/sharedPref/sharedPrefStore.dart';
import 'package:chat_box/utils/service_config.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class SwipeDataController extends GetxController {
  final swipeDataList = RxList<Data>();
  final allData = SwipeDataListModel().obs;
  final profileInfoData = UserData().obs;
  var isLoading = RxBool(false);
  var dio = Dio();
  final scrollController = ScrollController();
  var pageNumber = RxInt(1);
  getSwipeList() async {
    try {
      isLoading.value = true;
      // pageNumber.value++;
      var sharedPref = await SharedPreferences.getInstance();
      var _userId = sharedPref.get(userId);
      final res = await dio.get(baseUrl + '/Get-friend/1?page=$pageNumber');

      final List<Data> data = res.data['message']['data']
          .map((json) => Data.fromJson(json))
          .toList()
          .cast<Data>();
      print(res.realUri);

      if (res.statusCode == 200) {
        swipeDataList.clear();

        swipeDataList.addAll(data);
        isLoading.value = false;
      }
    } catch (e) {
      isLoading.value = false;

      print(e);
    }
  }

  loadSwipeData() async {
    try {
      isLoading.value = true;
      pageNumber.value++;
      var sharedPref = await SharedPreferences.getInstance();
      var _userId = sharedPref.get(userId);
      final res = await dio.get(baseUrl + '/Get-friend/1?page=$pageNumber');

      final List<Data> data = res.data['message']['data']
          .map((json) => Data.fromJson(json))
          .toList()
          .cast<Data>();
      print(res.realUri);

      print(res.data);
      if (res.statusCode == 200) {
        if (data.length > 0) {
          swipeDataList.clear();

          swipeDataList.addAll(data);
          isLoading.value = false;
          Get.offAll(BottomNavigationBarScreen());
          // scrollController.animateTo(
          //   scrollController.offset + 750,
          //   duration: Duration(seconds: 1),
          //   curve: Curves.easeInOut,
          // );
        } else {
          isLoading.value = false;

          print('---No More Data---');
          // snackBarWidget(
          //   message: '---No More Data---',
          //   isRed: false,
          // );
        }
      }
    } catch (e) {
      isLoading.value = false;

      print(e);
    }
  }

  Future<SwipeDataListModel>? getAllSwipeData() async {
    var _data = await fetchApi();

    return allData.value = _data;
  }

  Future<SwipeDataListModel> fetchApi() async {
    var sharedPref = await SharedPreferences.getInstance();
    var _userId = sharedPref.get(userId);
    var url = baseUrl + '/Get-friend/$_userId';

    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var dataResponse = jsonDecode(response.body);
      var data = SwipeDataListModel.fromJson(dataResponse);

      return data;
    } else {
      throw Exception('Failed Get API');
    }
  }
}
