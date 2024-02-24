import 'package:exclusive_access/features/Notifications/controller/notification_controller.dart';
import 'package:get/get.dart';

class NotificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<NotificationController>(NotificationController());
  }
}