import 'package:json_annotation/json_annotation.dart';
part 'register_device_entity.g.dart';

@JsonSerializable()
class RegisterDeviceEntity {
  String? action;
  DeviceRegister? deviceRegister;

  RegisterDeviceEntity({this.action, this.deviceRegister});

  factory RegisterDeviceEntity.fromJson(Map<String, dynamic> json) => _$RegisterDeviceEntityFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterDeviceEntityToJson(this);

  /* factory RegisterDeviceEntity.fromJson(Map<String, dynamic> json) {
    return RegisterDeviceEntity(
      action: json['action'] ?? "deviceRegister",
      deviceRegister: DeviceRegister.fromJson(json['deviceRegister']),
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['action'] = action;
    if (deviceRegister != null) {
      data['deviceRegister'] = deviceRegister!.toJson();
    }
    return data;
  }*/
}

@JsonSerializable()
class DeviceRegister {
  String? deviceModel;
  String? deviceFingerprint;
  String? deviceBrand;
  String? deviceId;
  String? deviceName;
  String? deviceManufacturer;
  String? deviceProduct;
  String? deviceSerialNumber;

  DeviceRegister(
      {this.deviceModel,
      this.deviceFingerprint,
      this.deviceBrand,
      this.deviceId,
      this.deviceName,
      this.deviceManufacturer,
      this.deviceProduct,
      this.deviceSerialNumber});

  factory DeviceRegister.fromJson(Map<String, dynamic> json) => _$DeviceRegisterFromJson(json);
  Map<String, dynamic> toJson() => _$DeviceRegisterToJson(this);

  /* factory DeviceRegister.fromJson(Map<String, dynamic> json) {
    return DeviceRegister(
      deviceModel: json['deviceModel'],
      deviceFingerprint: json['deviceFingerprint'],
      deviceBrand: json['deviceBrand'],
      deviceId: json['deviceId'],
      deviceName: json['deviceName'],
      deviceManufacturer: json['deviceManufacturer'],
      deviceProduct: json['deviceProduct'],
      deviceSerialNumber: json['deviceSerialNumber'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'deviceModel': deviceModel,
      'deviceFingerprint': deviceFingerprint,
      'deviceBrand': deviceBrand,
      'deviceId': deviceId,
      'deviceName': deviceName,
      'deviceManufacturer': deviceManufacturer,
      'deviceProduct': deviceProduct,
      'deviceSerialNumber': deviceSerialNumber,
    };
  }*/
}
