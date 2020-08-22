import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class CloudStorageService {
  static CloudStorageService instante = CloudStorageService();

  FirebaseStorage _storage;
  StorageReference _baseRef;

  String _profileImage = "profile_images";

  CloudStorageService() {
    _storage = FirebaseStorage.instance;
    _baseRef = _storage.ref();
  }

  Future<StorageTaskSnapshot> uploadUserImage(String _uid, File _image) {
    try {
      return _baseRef
          .child(_profileImage)
          .child(_uid)
          .putFile(_image)
          .onComplete;
    } catch (e) {
      print(e);
    }
  }
}