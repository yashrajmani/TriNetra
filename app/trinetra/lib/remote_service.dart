import 'dart:convert';
import 'package:TriNetra/face.dart';
import 'package:http/http.dart' as http;

class RemoteService
{
  String val="https://i.pinimg.com/originals/eb/f0/af/ebf0af38ebd7f3b41c3642cdb08e1487.jpg";
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
          '$val'
        }));

    // print(jsonDecode(response.body));
    // List data = jsonDecode(response.body);
    // print("THIS IS DATA :");
    // print(data);

    return faceFromJson(response.body);
  }
////////////////////////////////////////////////////////////////////////////////

}