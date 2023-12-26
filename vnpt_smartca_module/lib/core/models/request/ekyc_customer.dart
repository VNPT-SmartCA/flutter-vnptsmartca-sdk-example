import 'dart:convert';
import 'dart:io';

class EkycCustomerRequest {
  final dynamic deviceId;
  final dynamic fullName;
  final dynamic nearPortrait;
  final dynamic farPortrait;
  final dynamic idFront;
  final dynamic idBack;
  final dynamic idFrontFull;
  final dynamic idBackFull;
  final dynamic uid;
  final dynamic identityId;
  final dynamic faceVideo;
  final dynamic ocrIdVideo;
  final List<File> dkkdImages;
  final File? dkkdVideo;
  //final dynamic userType;

  EkycCustomerRequest({
    required this.nearPortrait,
    required this.farPortrait,
    required this.idFront,
    required this.idBack,
    required this.idFrontFull,
    required this.idBackFull,
    required this.uid,
    required this.faceVideo,
    required this.ocrIdVideo,
    required this.dkkdImages,
    required this.dkkdVideo,
    this.identityId,
    this.fullName,
    this.deviceId
    //this.userType,
  });
  Map<String, dynamic> toMap() {
    return {
      'nearPortrait': nearPortrait,
      'farPortrait': farPortrait,
      'idFront': idFront,
      'idBack': idBack,
      'idFrontFull': idFrontFull,
      'idBackFull': idBackFull,
      'uid': uid,
      'faceVideo': faceVideo,
      'ocrIdVideo': ocrIdVideo,
      'dkkdImages': dkkdImages,
      'dkkdVideo': dkkdImages,
      'identityId': dkkdImages,
    };
  }

  String toJson() => json.encode(toMap());
}
