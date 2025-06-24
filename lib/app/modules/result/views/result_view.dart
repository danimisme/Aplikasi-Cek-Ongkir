import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/result_controller.dart';

class ResultView extends GetView<ResultController> {
  const ResultView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ongkos Kirim'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Dari: ${controller.origins['city_name']}, ${controller.origins['province']}",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  "Tujuan : ${controller.rajaongkir['destination_details']['city_name']}, ${controller.rajaongkir['destination_details']['province']}",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  "Kurir: ${controller.rajaongkir['results'][0]['name'].toUpperCase()}",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(height: 12),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: controller.rajaongkir['results'][0]['costs'].length,
            itemBuilder: (context, index) {
              var cost = controller.rajaongkir['results'][0];
              return ListTile(
                title: Text("Service: ${cost['costs'][index]['service']}"),
                leading: Icon(Icons.local_shipping),
                subtitle: Text(
                  "${cost['costs'][index]['description']} (Estimasi: ${cost['costs'][index]['cost'][0]['etd']} hari)" +
                  "\nHarga: Rp. ${cost['costs'][index]['cost'][0]['value']}, ",
                ),
                trailing: Text(
                  "${cost['costs'][index]['note'] ?? ''}",
                  style: TextStyle(color: Colors.grey),
                ),
              );
            }
          ),
        ],
      )
    );
  }
}
