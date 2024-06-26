


import 'dart:convert';

import 'package:animalswale_app/data/data_source/remote/api_client.dart';
import 'package:animalswale_app/data/model/message_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../core/constants/my_strings.dart';
import '../../presentation/screens/auth/otp/otp_model.dart';
import '../../utils/utils.dart';
import '../data_source/remote/api_endpoints_url.dart';

class PostRepo extends ApiClient{

  UserData? userData;

  getUserData()async{
    var userdata = await Utils.get("userData") ?? userData;
    userData = UserData.fromJson(json.decode(userdata));
  }

  //ADD POST API

  //Dashboard Api
  Future<MessageModel> addPostApi(String animalTypId,String gender,String title,String description,String currentMilk,String highestMilk,String price,String age,String location,XFile? image,context)async {
    await getUserData();

    var data = {
      MyStrings.seller: userData!.id,
      MyStrings.animalType: animalTypId,
      MyStrings.gender: gender,
      MyStrings.title: title,
      MyStrings.description: description,
      MyStrings.currentMilk: currentMilk,
      MyStrings.highestMilk: highestMilk,
      MyStrings.price: price,
      MyStrings.age: age,
      MyStrings.location: location,
    };

    if(image == null){
      null;
    }else{
      // Encode the image file to base64 string
      String base64Image = base64Encode(await image.readAsBytes());
      // Add the base64 string to the data map
      data[MyStrings.image] = base64Image;
    }

    var webData = {MyStrings.webData: jsonEncode(data)};

    try{
      final response = await postRequest(path: ApiEndpointsUrl.addPosts,body: webData,isTokenRequired: true);
      if(response.statusCode == 200){
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