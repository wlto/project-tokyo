import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class SavedImage {
  String imageUrl;
  String imageOwner;
  String imageLink;

  SavedImage({this.imageUrl, this.imageOwner, this.imageLink});
}

class AppModel extends ChangeNotifier {
  int _tabIndex = 0;
  final String _apiEndpoint = 'https://api.unsplash.com/photos/random/?query=Tokyo&client_id=KdP__9meM9XZHEZW_XOqjVkoOSC8mGvqUz2u-TdZRls';
  String _currentImageUrl = 'https://images.unsplash.com/photo-1536098561742-ca998e48cbcc?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1362&q=80';
  String _currentImageOwner = '';
  List<SavedImage> _savedImages = [];

  int get tabIndex => _tabIndex;
  String get currentImageUrl => _currentImageUrl;
  String get currentImageOwner => _currentImageOwner;

  set tabIndex(int newTabIndex) {
    this._tabIndex = newTabIndex;
    notifyListeners();
  }

  AppModel() {
    updateCurrentImage();
  }

  void updateCurrentImage() async {
    // 1. Get image from Unsplash API and update currentImageUrl
    var response = await http.get(this._apiEndpoint);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      this._currentImageUrl = jsonResponse['urls']['regular'];
      this._currentImageOwner = jsonResponse['user']['username'];
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    // 2. Notify listeners
    notifyListeners();
  }

  void favouriteImage() {

  }
}