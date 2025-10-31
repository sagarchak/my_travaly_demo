import 'package:get/get.dart';

snackbarMessage({String? title, String? message}) {
  Get.showSnackbar(GetSnackBar(
    title: title ?? "title",
    message: message ?? "message",
    duration: Duration(seconds: 2),
  ));
}
