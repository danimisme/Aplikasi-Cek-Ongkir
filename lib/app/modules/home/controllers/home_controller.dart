import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:ongkir/app/data/models/city_model.dart';
import 'package:ongkir/app/data/models/province_model.dart';

class HomeController extends GetxController {
  Future<List<Province>> fetchProvince(String filter) async {
    try {
      var response =
          await Dio().get('https://api.rajaongkir.com/starter/province',
              options: Options(headers: {
                'key': '0ae702200724a396a933fa0ca4171a7e',
              }));
      print("Response: ${response.data}");
      return Province.fromJsonList(response.data['rajaongkir']['results']);
    } on DioException catch (e) {
      print(e);
      if (e.response != null) {
        Get.snackbar('Error', e.response!.data['rajaongkir']['message']);
      } else {
        Get.snackbar('Error', 'Connection error');
      }
      rethrow;
    }
  }

    Future<List<City>> fetchCity(String filter) async {
    try {
      var response =
          await Dio().get('https://api.rajaongkir.com/starter/city?province=$provAsalId',
              options: Options(headers: {
                'key': '0ae702200724a396a933fa0ca4171a7e',
              }));
      return City.fromJsonList(response.data['rajaongkir']['results']);
    } on DioException catch (e) {
      print(e);
      if (e.response != null) {
        Get.snackbar('Error', e.response!.data['rajaongkir']['message']);
      } else {
        Get.snackbar('Error', 'Connection error');
      }
      rethrow;
    }
  }

  RxList<Province> provinces = <Province>[].obs;
  RxList<City> cities = <City>[].obs;

  RxString provAsalId = "0".obs;
  RxString cityAsalId = "0".obs;
  RxString provTujuanId = "0".obs;
  RxString cityTujuanId = "0".obs;


  @override
  void onInit() {
    super.onInit();
    fetchProvince('').then((value) {
      provinces.value = value;
    });
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
