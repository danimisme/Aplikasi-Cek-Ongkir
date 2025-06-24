import 'package:get/get.dart';

class ResultController extends GetxController {
  final rajaongkir = Get.arguments;
  Map<String, dynamic> origins = Get.arguments['origin_details'];
  Map<String, dynamic> destinations = Get.arguments['destination_details'];
  List<dynamic> results = Get.arguments['results'];


  @override
  void onInit() {
    super.onInit(); 
  }
  @override
  void onReady() {
    super.onReady();
  }
  @override
  void onClose() {
    super.onClose();
  }
}
