import 'dart:convert';

//TODO: FIX NULL ERROR for all values.

List<Face> faceFromJson(String str) => List<Face>.from(json.decode(str).map((x) => Face.fromJson(x)));

String faceToJson(List<Face> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Face {
  Face({
    required this.faceId,
    required this.faceRectangle,
    required this.faceAttributes,
  });

  String faceId;
  FaceRectangle faceRectangle;
  FaceAttributes faceAttributes;

  factory Face.fromJson(Map<String, dynamic> json) => Face(
    faceId: json["faceId"],
    faceRectangle: FaceRectangle.fromJson(json["faceRectangle"]),
    faceAttributes: FaceAttributes.fromJson(json["faceAttributes"]),
  );

  Map<String, dynamic> toJson() => {
    "faceId": faceId,
    "faceRectangle": faceRectangle.toJson(),
    "faceAttributes": faceAttributes.toJson(),
  };
}

class FaceAttributes {
  FaceAttributes({
    required this.gender,
    required this.age,
    required this.emotion,
  });

  String gender;
  double age;
  Emotion emotion;

  factory FaceAttributes.fromJson(Map<String, dynamic> json) => FaceAttributes(
    gender: json["gender"],
    age: json["age"],
    emotion: Emotion.fromJson(json["emotion"]),
  );

  Map<String, dynamic> toJson() => {
    "gender": gender,
    "age": age,
    "emotion": emotion.toJson(),
  };
}

class Emotion {
  Emotion({
    required this.anger,
    required this.contempt,
    required this.disgust,
    required this.fear,
    required this.happiness,
    required this.neutral,
    required this.sadness,
    required this.surprise,
  });

  double anger;
  double contempt;
  double disgust;
  double fear;
  double happiness;
  double neutral;
  double sadness;
  double surprise;

  factory Emotion.fromJson(Map<String, dynamic> json) => Emotion(
    anger: json["anger"],
    contempt: json["contempt"],
    disgust: json["disgust"],
    fear: json["fear"],
    happiness: json["happiness"],
    neutral: json["neutral"],
    sadness: json["sadness"],
    surprise: json["surprise"],
  );

  Map<String, dynamic> toJson() => {
    "anger": anger,
    "contempt": contempt,
    "disgust": disgust,
    "fear": fear,
    "happiness": happiness,
    "neutral": neutral,
    "sadness": sadness,
    "surprise": surprise,
  };
}

class FaceRectangle {
  FaceRectangle({
    required this.top,
    required this.left,
    required this.width,
    required this.height,
  });

  int top;
  int left;
  int width;
  int height;

  factory FaceRectangle.fromJson(Map<String, dynamic> json) => FaceRectangle(
    top: json["top"],
    left: json["left"],
    width: json["width"],
    height: json["height"],
  );

  Map<String, dynamic> toJson() => {
    "top": top,
    "left": left,
    "width": width,
    "height": height,
  };
}
