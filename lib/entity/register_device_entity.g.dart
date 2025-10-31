// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_device_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterDeviceEntity _$RegisterDeviceEntityFromJson(
        Map<String, dynamic> json) =>
    RegisterDeviceEntity(
      action: json['action'] as String?,
      deviceRegister: json['deviceRegister'] == null
          ? null
          : DeviceRegister.fromJson(
              json['deviceRegister'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RegisterDeviceEntityToJson(
        RegisterDeviceEntity instance) =>
    <String, dynamic>{
      'action': instance.action,
      'deviceRegister': instance.deviceRegister,
    };

DeviceRegister _$DeviceRegisterFromJson(Map<String, dynamic> json) =>
    DeviceRegister(
      deviceModel: json['deviceModel'] as String?,
      deviceFingerprint: json['deviceFingerprint'] as String?,
      deviceBrand: json['deviceBrand'] as String?,
      deviceId: json['deviceId'] as String?,
      deviceName: json['deviceName'] as String?,
      deviceManufacturer: json['deviceManufacturer'] as String?,
      deviceProduct: json['deviceProduct'] as String?,
      deviceSerialNumber: json['deviceSerialNumber'] as String?,
    );

Map<String, dynamic> _$DeviceRegisterToJson(DeviceRegister instance) =>
    <String, dynamic>{
      'deviceModel': instance.deviceModel,
      'deviceFingerprint': instance.deviceFingerprint,
      'deviceBrand': instance.deviceBrand,
      'deviceId': instance.deviceId,
      'deviceName': instance.deviceName,
      'deviceManufacturer': instance.deviceManufacturer,
      'deviceProduct': instance.deviceProduct,
      'deviceSerialNumber': instance.deviceSerialNumber,
    };
