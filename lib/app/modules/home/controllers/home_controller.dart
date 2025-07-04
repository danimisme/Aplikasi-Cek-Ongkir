import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ongkir/app/data/models/city_model.dart';
import 'package:ongkir/app/data/models/province_model.dart';
import 'package:ongkir/app/routes/app_pages.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class HomeController extends GetxController {
  TextEditingController beratC = TextEditingController();
  RxBool isLoading = false.obs;
  final String baseUrl = dotenv.env['BASE_URL'] ?? '';
  final String apiKey = dotenv.env['API_KEY'] ?? '';

  Future<List<Province>> fetchProvince(String filter) async {
    print("Base URL: $baseUrl");
    try {
      var response =
          await Dio().get('$baseUrl/province',
              options: Options(headers: {
                'key': '$apiKey',
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

  Future<List<City>> fetchCity(String filter, String provId) async {
    try {
      var response =
          await Dio().get('$baseUrl/city?province=$provId',
              options: Options(headers: {
                'key': '$apiKey',
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
 
  void cekOngkir() async {
    isLoading.value = true;
    if (provAsalId.value != "0" && cityAsalId.value != "0" && provTujuanId.value != "0" && cityTujuanId.value != "0" && codeKurir.value != "" && beratC.text.isNotEmpty) {
      try {
        var response = await Dio().post("$baseUrl/cost",
          options: Options(headers: {
            'key': '$apiKey',
          }),
          data: {
            "origin": int.parse(cityAsalId.value),
            "destination": int.parse(cityTujuanId.value),
            "weight": beratC.text, // berat dalam gram
            "courier": codeKurir.value,
          }
        );
        isLoading.value = false;
        var rajaongkir = response.data['rajaongkir']; 
        Get.toNamed(Routes.RESULT, arguments: rajaongkir);
      } catch (e) {
        isLoading.value = false;
        print("Error: $e");
      }
      
    } else {
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Pastikan semua data sudah terisi",
      );
    }
  }

  RxList<Province> provinces = <Province>[].obs;
  RxList<City> cities = <City>[].obs;

  RxString provAsalId = "0".obs;
  RxString cityAsalId = "0".obs;
  RxString provTujuanId = "0".obs;
  RxString cityTujuanId = "0".obs;
  RxString codeKurir = "".obs;


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
