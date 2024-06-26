
class DataModel  {
  String? id;
  String? name;
  String? code;
  String? orderIndex;
  String? imgUrl;
  String? imgUrlPath;
  String? parentId;
  String? parent;
  String? tType;
  String? remarks;
  String? active;
  String? companyId;
  String? branchId;
  String? faId;
  String? userId;
  String? updateDate;
  String? isDelete;

  DataModel(
      {this.id,
      this.name,
      this.code,
      this.orderIndex,
      this.imgUrl,
      this.imgUrlPath,
      this.parentId,
      this.parent,
      this.tType,
      this.remarks,
      this.active,
      this.companyId,
      this.branchId,
      this.faId,
      this.userId,
      this.updateDate,
      this.isDelete});

  DataModel.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    name = json['Name'];
    code = json['Code'];
    orderIndex = json['OrderIndex'];
    imgUrl = json['ImgUrl'];
    imgUrlPath = json['ImgUrlPath'];
    parentId = json['ParentId'];
    parent = json['Parent'];
    tType = json['TType'];
    remarks = json['Remarks'];
    active = json['Active'];
    companyId = json['CompanyId'];
    branchId = json['BranchId'];
    faId = json['FaId'];
    userId = json['UserId'];
    updateDate = json['UpdateDate'];
    isDelete = json['IsDelete'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['Name'] = name;
    data['Code'] = code;
    data['OrderIndex'] = orderIndex;
    data['ImgUrl'] = imgUrl;
    data['ImgUrlPath'] = imgUrlPath;
    data['ParentId'] = parentId;
    data['Parent'] = parent;
    data['TType'] = tType;
    data['Remarks'] = remarks;
    data['Active'] = active;
    data['CompanyId'] = companyId;
    data['BranchId'] = branchId;
    data['FaId'] = faId;
    data['UserId'] = userId;
    data['UpdateDate'] = updateDate;
    data['IsDelete'] = isDelete;
    return data;
  }
}
