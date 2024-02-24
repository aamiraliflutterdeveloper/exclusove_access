import 'package:exclusive_access/features/Settings/Terms_And_Conditions/controller/terms_condition_controller.dart';
import 'package:get/get.dart';

class TermsConditionBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<TermsConditionController>(TermsConditionController());
  }
}