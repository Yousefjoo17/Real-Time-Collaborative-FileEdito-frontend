import 'dart:core';

class UserModel {
  final String vendorId;
  final String vendorName;
  final String vendorAddress;
  final String vendorPhoneNumber;

  UserModel({
    required this.vendorId,
    required this.vendorName,
    required this.vendorAddress,
    required this.vendorPhoneNumber,
  });

  factory UserModel.fromJson(json) {
    return UserModel(
      vendorId: json["vendorId"],
      vendorName: json["vendorName"],
      vendorAddress: json["vendorAddress"],
      vendorPhoneNumber: json["vendorPhoneNumber"],
    );
  }
}
