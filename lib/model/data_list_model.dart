import 'package:flutter/material.dart';

import 'data_model.dart';

class DataListModel extends ChangeNotifier {
  static final DataListModel _dataListModel = DataListModel._internal();

  factory DataListModel() {
    return _dataListModel;
  }

  DataListModel._internal();

  List<DataModel>? dataListModel;
  void updateDataList(List<DataModel> list) {
    dataListModel = list;
    notifyListeners();
  }
}
