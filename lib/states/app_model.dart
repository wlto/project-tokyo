import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class Photo {
  String id;
  String url;
  String owner;
  String link;

  Photo({this.id, this.url, this.owner, this.link});
}

class AppModel extends ChangeNotifier {
  int _tabIndex = 0;
  final String _apiEndpoint = 'https://api.unsplash.com/photos/random/?query=Tokyo&client_id=KdP__9meM9XZHEZW_XOqjVkoOSC8mGvqUz2u-TdZRls';
  
  Photo _currentPhoto = Photo(
    id: '',
    url: 'https://images.unsplash.com/photo-1536098561742-ca998e48cbcc?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1362&q=80',
    owner: '',
    link: ''
  );
  
  List<Photo> _savedPhotos = [];

  int get tabIndex => _tabIndex;
  List<Photo> get savedPhotos => _savedPhotos;

  Photo get currentPhoto => _currentPhoto;

  set tabIndex(int newTabIndex) {
    this._tabIndex = newTabIndex;
    notifyListeners();
  }

  AppModel() {
    updateCurrentPhoto();
  }

  void updateCurrentPhoto() async {
    // 1. Get image from Unsplash API and update currentImageUrl
    var response = await http.get(this._apiEndpoint);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      
      this._currentPhoto = Photo(
        id: jsonResponse['id'],
        url: jsonResponse['urls']['regular'],
        owner: jsonResponse['user']['username'],
        link: jsonResponse['links']['html']
      );

    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    // 2. Notify listeners
    notifyListeners();
  }

  void savePhoto() {
    if (this.currentPhotoIsSaved()) {
      _savedPhotos.removeWhere((element) => element.id == _currentPhoto.id);
    } else {
      _savedPhotos.add(
        Photo(
          id: this._currentPhoto.id,
          url: this._currentPhoto.url,
          owner: this._currentPhoto.owner,
          link: this._currentPhoto.link
        )
      );
    }
    notifyListeners();
  }

  bool currentPhotoIsSaved() {
    return _savedPhotos.singleWhere((element) => element.id == _currentPhoto.id, orElse: () => null) != null;
  }
}