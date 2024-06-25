import 'dart:convert';
import 'dart:io';

import 'package:animalswale_app/data/model/message_model.dart';
import 'package:animalswale_app/presentation/screens/auth/otp/otp_model.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:image_picker/image_picker.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../core/constants/my_strings.dart';
import '../../utils/utils.dart';
import '../data_source/remote/api_client.dart';
import '../data_source/remote/api_endpoints_url.dart';

class AuthRepo extends ApiClient{

  AuthRepo();

  var token;
  UserData? userData;

  getFcmToken() async {
    if (Platform.isIOS) {
      token = (await FirebaseMessaging.instance.getAPNSToken())!;
      await Utils.saveFCMToken(token);
    } else {
      token = (await FirebaseMessaging.instance.getToken())!;
      await Utils.saveFCMToken(token);
    }
  }

  getUserData()async{
    var userdata = await Utils.get("userData") ?? userData;
    userData = UserData.fromJson(json.decode(userdata));
  }

  ///Login Api
  Future<MessageModel> loginApi (String phone,context)async{
    await getFcmToken();

    var data = {
      MyStrings.phone: "91$phone",
      MyStrings.deviceToken: token,
    };

    var webData = {MyStrings.webData: jsonEncode(data)};


    try{
      final response = await postRequest(path: ApiEndpointsUrl.login,body: webData);
      if(response.statusCode == 200){
        var responseJson = json.decode(response.data);
        final responseData = MessageModel.fromJson(responseJson);
        return responseData;
      }else{
        MessageModel();
      }

    }on Exception catch(e){
      VxToast.show(context, msg: e.toString());
      MessageModel();
    }
    return MessageModel();
  }

  ///Register Api
  Future<MessageModel> registerApi (String name,String phone,String email,String password,XFile image,context)async{
    await getFcmToken();

    var data = {
      MyStrings.name: name,
      MyStrings.password: password,
      MyStrings.email: email,
      MyStrings.phone: "91$phone",
      MyStrings.deviceToken: token,
    };

    // Encode the image file to base64 string
    String base64Image = base64Encode(await image.readAsBytes());

// Add the base64 string to the data map
    data[MyStrings.profile_image] = base64Image;

    var webData = {MyStrings.webData: jsonEncode(data)};


    try{
      final response = await postRequest(path: ApiEndpointsUrl.register,body: webData);
      if(response.statusCode == 200){
        var responseJson = json.decode(response.data);
        final responseData = MessageModel.fromJson(responseJson);
        return responseData;
      }else{
        MessageModel();
      }

    }on Exception catch(e){
      VxToast.show(context, msg: e.toString());
      MessageModel();
    }
    return MessageModel();
  }

  ///User Profile Api
  Future<OtpModel> updateProfileApi (String name,String email,XFile? image,context)async{
    await getUserData();

    var data = {
      MyStrings.userId: userData!.id,
      MyStrings.name: name,
      MyStrings.email: email,
    };

    if(image == null){
      null;
    }else{
      // Encode the image file to base64 string
      String base64Image = base64Encode(await image.readAsBytes());
      // Add the base64 string to the data map
      data[MyStrings.profile_image] = base64Image;

    }
    var webData = {MyStrings.webData: jsonEncode(data)};

    try{
      final response = await postRequest(path: ApiEndpointsUrl.profile,body: webData,isTokenRequired: true);
      if(response.statusCode == 200){
        // var responseJson = json.decode(response.data);
        final responseData = OtpModel.fromJson(response.data);
        return responseData;
      }else{
        OtpModel();
      }

    }on Exception catch(e){
      VxToast.show(context, msg: e.toString());
      OtpModel();
    }
    return OtpModel();
  }

  ///OTP Api
  Future<OtpModel> otpApi (String phone,String otp,context)async{

    var data = {
      MyStrings.phone: "91$phone",
      MyStrings.otp: otp,
    };

    var webData = {MyStrings.webData: jsonEncode(data)};


    try{
      final response = await postRequest(path: ApiEndpointsUrl.verifyOtp,body: webData);
      if(response.statusCode == 200){
        var responseJson = json.decode(response.data);
        final responseData = OtpModel.fromJson(responseJson);
        return responseData;
      }else{
        OtpModel();
      }

    }on Exception catch(e){
      VxToast.show(context, msg: e.toString());
      OtpModel();
    }
    return OtpModel();
  }

  ///Logout Api
  Future<MessageModel> logoutApi (context)async{
    await getUserData();

    var data = {
      MyStrings.userId: userData!.id,
    };

    var webData = {MyStrings.webData: jsonEncode(data)};

    try{
      final response = await postRequest(path: ApiEndpointsUrl.logout,body: webData,isTokenRequired: true);
      if(response.statusCode == 200){
        // var responseJson = json.decode(response.data);
        final responseData = MessageModel.fromJson(response.data);
        return responseData;
      }else{
        MessageModel();
      }

    }on Exception catch(e){
      VxToast.show(context, msg: e.toString());
      MessageModel();
    }
    return MessageModel();
  }

}