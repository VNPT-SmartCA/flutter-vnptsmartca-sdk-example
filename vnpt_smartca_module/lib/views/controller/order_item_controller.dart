import 'package:get/get.dart';
import '../../../core/models/response/order_cert_model.dart';
import '../../../views/controller/base_controler.dart';

class OrderItemController extends BaseController {
  Rx<OrderCertModel?> currentOrderCertModel = Rx(null);

  OrderItemController(OrderCertModel orderCertModel) {
    currentOrderCertModel.value = orderCertModel;
  }
}