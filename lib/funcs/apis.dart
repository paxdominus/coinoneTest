
import 'package:dio/dio.dart';

import '../model/data_list_model.dart';
import '../model/data_list_model2.dart';
import '../model/data_model.dart';

class Apis {

  String baseUrl = "https://coinoneglobal.in/crm/";

  Future<void> getImagesData() async {
    try {

    final response = await Dio().get(
        "https://coinoneglobal.in/teresa_trial/webtemplate.asmx/FnGetTemplateCategoryList?PrmCmpId=1&PrmBrId=2");
       List dataList = response.data;
       List<DataModel> newList = dataList.map((e) => DataModel.fromJson(e),).toList();
       DataListModel().updateDataList(newList);
    } catch(e){
       DataListModel().updateDataList([]);

    }
  }
  Future<void> getImagesData2({required int id})async {

    try {

      final response = await Dio().get(
        "https://coinoneglobal.in/teresa_trial/webtemplate.asmx/FnGetTemplateSubCategoryList?PrmCmpId=1&PrmBrId=2&PrmCategoryId=${id.toString()}");
         List dataList = response.data;
       List<DataModel> newList = dataList.map((e) => DataModel.fromJson(e),).toList();
       DataListModel2().updateDataList(newList);
    } catch (e){
       DataListModel2().updateDataList([]);
    }
  }
}
