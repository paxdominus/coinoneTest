import 'package:flutter/material.dart';

import 'data_model.dart';

class DataListModel2 extends ChangeNotifier{

  static final DataListModel2 _dataListModel = DataListModel2._internal();

  factory DataListModel2() {
    return _dataListModel;
  }

  DataListModel2._internal();


  List<DataModel>? dataListModel2;

  void updateDataList(List<DataModel> list) {
    dataListModel2 = list;
    notifyListeners();
  }
}