class Province {
  String? provinceId;
  String? province;

  Province({
    this.provinceId,
    this.province,
  });

  Province.fromJson(Map<String, dynamic> json) {
    provinceId = json['province_id'];
    province = json['province'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['province_id'] = provinceId;
    data['province'] = province;
    return data;
  }

  static List<Province> fromJsonList(List? data){
    if (data == null || data.length == 0) return [];
    return data.map((e) => Province.fromJson(e)).toList();
  }

  @override
  String toString() => province!;
}
