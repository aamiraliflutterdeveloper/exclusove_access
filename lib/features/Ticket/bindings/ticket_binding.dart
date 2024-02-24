import 'package:exclusive_access/features/Ticket/controller/ticket_controller.dart';
import 'package:get/get.dart';

class TicketBinding extends Bindings {
  @override
  void dependencies() {
     Get.put<TicketController>(TicketController());
  }
}




