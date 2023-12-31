// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CityModel {
  final String dcity;
  final String acity;
  CityModel({
    required this.dcity,
    required this.acity,
  });

  CityModel copyWith({
    String? dcity,
    String? acity,
  }) {
    return CityModel(
      dcity: dcity ?? this.dcity,
      acity: acity ?? this.acity,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'dcity': dcity,
      'acity': acity,
    };
  }

  factory CityModel.fromMap(Map<String, dynamic> map) {
    return CityModel(
      dcity: map['dcity'] as String,
      acity: map['acity'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CityModel.fromJson(String source) => CityModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CityModel(dcity: $dcity, acity: $acity)';

  @override
  bool operator ==(covariant CityModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.dcity == dcity &&
      other.acity == acity;
  }

  @override
  int get hashCode => dcity.hashCode ^ acity.hashCode;
}
