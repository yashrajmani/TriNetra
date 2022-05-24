import 'dart:convert';
import 'package:TriNetra/face.dart';
import 'package:TriNetra/remote_service.dart';
import 'package:http/http.dart' as http;

class RemoteService
{

  ////////////////////// AZURE API ////////////////////////////////////////////////////////
  //TODO: HANDLE EXCEPTION HERE | OK:200
  Future<List<Face>?> getData() async {
    http.Response response = await http.post(
        Uri.parse(
            'https://yashfacerecog.cognitiveservices.azure.com/face/v1.0/detect?returnFaceId=true&returnFaceAttributes=emotion,age,gender&recognitionModel=recognition_04&returnRecognitionModel=false&detectionModel=detection_01&faceIdTimeToLive=86400'),
        headers: {
          "Ocp-Apim-Subscription-Key": "8a8001de4bc64983baea7fc0509d77e9",
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          'url':
          'https://static-ssl.businessinsider.com/image/56a7e43b58c32378008b55c8-734-550/mat_in_tibet-d4784s.jpeg'
        }));

    // print(jsonDecode(response.body));
    // List data = jsonDecode(response.body);
    // print("THIS IS DATA :");
    // print(data);

    return faceFromJson(response.body);
  }
////////////////////////////////////////////////////////////////////////////////

}