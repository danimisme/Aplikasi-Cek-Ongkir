import 'package:flutter/material.dart';
import "package:dropdown_search/dropdown_search.dart";
import 'package:get/get.dart';
import 'package:ongkir/app/data/models/city_model.dart';
import '../../../data/models/province_model.dart';

import '../controllers/home_controller.dart';



class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cek Ongkir'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          DropdownSearch<Province>(
            compareFn: (item1, item2) => item1 == item2,
            items: (f , s) => controller.fetchProvince(f),
            itemAsString: (item) => item.province ?? '',
            popupProps: PopupProps.menu(
              fit: FlexFit.loose,
              showSelectedItems: true,
              showSearchBox: true,
              loadingBuilder: (context, searchEntry) => 
                const Center(child: CircularProgressIndicator()),   
              itemBuilder: (context, item, isDisabled , isSelected) {
                return ListTile(
                  title: Text(item.province ?? ''),
                );
              },
            ),
            decoratorProps: DropDownDecoratorProps(
              decoration: InputDecoration(
                labelText: "Provinsi Asal",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              )
            ),
            onChanged: (value) => controller.provAsalId.value = value?.provinceId ?? "0",
          ),
          SizedBox(height: 20),
          DropdownSearch<City>(
            compareFn: (item1, item2) => item1 == item2,
            items: (f , s) => controller.fetchCity(f),
            itemAsString: (item) => item.cityName ?? '',
            popupProps: PopupProps.menu(
              fit: FlexFit.loose,
              showSelectedItems: true,
              showSearchBox: true,
              loadingBuilder: (context, searchEntry) => 
                const Center(child: CircularProgressIndicator()),   
              itemBuilder: (context, item, isDisabled , isSelected) {
                return ListTile(
                  title: Text("${item.type} ${item.cityName}"),
                );
              },
            ),
            decoratorProps: DropDownDecoratorProps(
              decoration: InputDecoration(
                labelText: "Kota Asal",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              )
            ),
            onChanged: (value) => controller.cityAsalId.value = value?.cityId ?? "0",
          ),
          SizedBox(height: 20),
          DropdownSearch<Province>(
            compareFn: (item1, item2) => item1 == item2,
            items: (f , s) => controller.fetchProvince(f),
            itemAsString: (item) => item.province ?? '',
            popupProps: PopupProps.menu(
              fit: FlexFit.loose,
              showSelectedItems: true,
              showSearchBox: true,
              loadingBuilder: (context, searchEntry) => 
                const Center(child: CircularProgressIndicator()),   
              itemBuilder: (context, item, isDisabled , isSelected) {
                return ListTile(
                  title: Text(item.province ?? ''),
                );
              },
            ),
            decoratorProps: DropDownDecoratorProps(
              decoration: InputDecoration(
                labelText: "Provinsi Tujuan",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              )
            ),
            onChanged: (value) => controller.provTujuanId.value = value?.provinceId ?? "0",
          ),
          SizedBox(height: 20),
          DropdownSearch<City>(
            compareFn: (item1, item2) => item1 == item2,
            items: (f , s) => controller.fetchCity(f),
            itemAsString: (item) => item.cityName ?? '',
            popupProps: PopupProps.menu(
              fit: FlexFit.loose,
              showSelectedItems: true,
              showSearchBox: true,
              loadingBuilder: (context, searchEntry) => 
                const Center(child: CircularProgressIndicator()),   
              itemBuilder: (context, item, isDisabled , isSelected) {
                return ListTile(
                  title: Text("${item.type} ${item.cityName}"),
                );
              },
            ),
            decoratorProps: DropDownDecoratorProps(
              decoration: InputDecoration(
                labelText: "Kota Tujuan",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              )
            ),
            onChanged: (value) => controller.cityTujuanId.value = value?.cityId ?? "0",
          ),
          SizedBox(height: 20),
          DropdownSearch<Map<String, dynamic>>(
            items: (f,s) => [
              {"name": "JNE", "value": "jne"},
              {"name": "TIKI", "value": "tiki"},
              {"name": "POS Indonesia", "value": "pos"},
            ],
            compareFn: (item1, item2) => item1['value'] == item2['value'],
            itemAsString: (item) => item['name'] ?? '',
            popupProps: PopupProps.menu(
              fit: FlexFit.loose,
              showSelectedItems: true,
              itemBuilder: (context, item, isDisabled, isSelected) => 
                ListTile(
                  title: Text(item['name'] ?? ''),
                ),
            ),
            decoratorProps: DropDownDecoratorProps(
              decoration: InputDecoration(
                labelText: "Pilih Kurir",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                )
              )
            ),
          )
        ],
      ),
    );
  }
}
