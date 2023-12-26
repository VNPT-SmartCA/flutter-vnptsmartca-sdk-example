import 'dart:convert';
import '../../extensions/datetime.dart';

import '../response/certificate_model.dart';

class HistoryRequestModel {
  String? order;
  bool? isDesc;
  DateTime? fromDate;
  DateTime? toDate;
  String? keySearch;
  CertificateModel? certificateModel;
  int? page;
  int? pageSize;

  HistoryRequestModel(
      {this.order,
      this.isDesc,
      this.fromDate,
      this.toDate,
      this.keySearch,
      this.certificateModel,
      this.page,
      this.pageSize});

  Map<String, dynamic> toMap() {
    return {
      'order': order,
      'isDesc': isDesc,
      "fromDate": fromDate?.fromDate(),
      "toDate": toDate?.fromDate(),
      "keySearch": keySearch,
      "cerId": certificateModel?.id,
      "page": page,
      "pageSize": pageSize,
    };
  }

  String toJson() => json.encode(toMap());
}
