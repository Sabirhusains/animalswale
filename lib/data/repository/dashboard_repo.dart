import 'dart:convert';

import 'package:animalswale_app/data/data_source/remote/api_client.dart';
import 'package:animalswale_app/presentation/screens/auth/otp/otp_model.dart';
import 'package:animalswale_app/presentation/screens/general/dashboard/dashboard_model.dart';
import 'package:animalswale_app/presentation/screens/general/filter/filterPost_model.dart';
import 'package:animalswale_app/utils/utils.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../core/constants/my_strings.dart';
import '../data_source/remote/api_endpoints_url.dart';


class DashboardRepo extends ApiClient{

  var token;
  UserData? userData;

  getFcmToken() async {
    token = await Utils.getFCMToken();
  }

  getUserData()async{
    var userdata = await Utils.get("userData") ?? userData;
    userData = UserData.fromJson(json.decode(userdata));
  }

  //Dashboard Api
  Future<InitResponse> dashboardApi(context)async {
    await getFcmToken();
    await getUserData();
    var data = {
      MyStrings.deviceToken: token,
      MyStrings.userId: userData!.id,
    };

    var webData = {MyStrings.webData: jsonEncode(data)};


    try{
      final response = await postRequest(path: ApiEndpointsUrl.initialize,body: webData,isTokenRequired: true);
      if(response.statusCode == 200){
        final responseData = InitResponse.fromJson(response.data);
        return responseData;
      }else{
        InitResponse();
      }
    }on Exception catch(e){
      VxToast.show(context, msg: e.toString());
      InitResponse();
    }
    return InitResponse();
  }

  //Category Api
  Future<FilterPostModel> filterRateApi(String rate,context)async {
    await getFcmToken();

    var data = {
      MyStrings.rate: rate,
    };

    var webData = {MyStrings.webData: jsonEncode(data)};


    try{
      final response = await postRequest(path: ApiEndpointsUrl.shorting,body: webData,isTokenRequired: true);
      if(response.statusCode == 200){
        final responseData = FilterPostModel.fromJson(response.data);
        return responseData;
      }else{
        FilterPostModel();
      }
    }on Exception catch(e){
      VxToast.show(context, msg: e.toString());
      FilterPostModel();
    }
    return FilterPostModel();
  }



}