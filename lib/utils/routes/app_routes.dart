import 'package:exclusive_access/features/Auth/ChangePassword/bindings/change_p_binding.dart';
import 'package:exclusive_access/features/Auth/ChangePassword/view/change_p_view.dart';
import 'package:exclusive_access/features/Auth/ForgotPassword/bindings/forgot_p_bindings.dart';
import 'package:exclusive_access/features/Auth/ForgotPassword/view/forgot_p_view.dart';
import 'package:exclusive_access/features/Auth/Otp/bindings/otp_bindings.dart';
import 'package:exclusive_access/features/Auth/Otp/view/otp_view.dart';
import 'package:exclusive_access/features/Auth/Signin/bindings/signin_binding.dart';
import 'package:exclusive_access/features/Auth/Signin/view/signin_view.dart';
import 'package:exclusive_access/features/Auth/Signup/bindings/register_binding.dart';
import 'package:exclusive_access/features/Auth/Signup/view/register_view.dart';
import 'package:exclusive_access/features/Auth/SignupOtp/bindings/otp_bindings.dart';
import 'package:exclusive_access/features/Auth/SignupOtp/view/otp_view.dart';
import 'package:exclusive_access/features/Dashboard/bindings/dashboard_binding.dart';
import 'package:exclusive_access/features/Dashboard/view/dashboard_view.dart';
import 'package:exclusive_access/features/Home/AddCard/bindings/add_card_binding.dart';
import 'package:exclusive_access/features/Home/AddCard/view/add_card_view.dart';
import 'package:exclusive_access/features/Home/CartDetail/view/cart_detail_view.dart';
import 'package:exclusive_access/features/Home/ExclusiveDetail/bindings/exclusive_binding.dart';
import 'package:exclusive_access/features/Home/ExclusiveDetail/view/exclusive_detail_view.dart';
import 'package:exclusive_access/features/Notifications/bindings/notification_binding.dart';
import 'package:exclusive_access/features/Notifications/view/notification_view.dart';
import 'package:exclusive_access/features/Settings/PrivacyPolicy/bindings/privacy_bindings.dart';
import 'package:exclusive_access/features/Settings/PrivacyPolicy/view/privacy_view.dart';
import 'package:exclusive_access/features/Settings/Support/bindings/support_binding.dart';
import 'package:exclusive_access/features/Settings/Support/view/support_view.dart';
import 'package:exclusive_access/features/Settings/Terms_And_Conditions/binding/terms_condition_binding.dart';
import 'package:exclusive_access/features/Settings/Terms_And_Conditions/view/terms_conditions_view.dart';
import 'package:exclusive_access/features/Splash/bindings/splash_binding.dart';
import 'package:exclusive_access/features/Splash/view/spalsh_view.dart';
import 'package:exclusive_access/utils/routes/routes.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final appRoutes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.SIGNUP,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: Routes.SIGNIN,
      page: () => const SignInView(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 50),
      binding: SignInBindings(),
    ),
    GetPage(
      name: Routes.FORGOTPASSWORD,
      page: () => const ForgotPView(),
      binding: ForgotPBinding(),
    ),
    GetPage(
      name: Routes.OTP,
      page: () => const OtpView(),
      binding: OTPBindings(),
    ),
    GetPage(
      name: Routes.SIGNUPOTP,
      page: () => const SignUpOtpView(),
      binding: SignUpOTPBindings(),
    ),
    GetPage(
      name: Routes.CHANGEPASSWORD,
      page: () => const ChangePView(),
      binding: ChangePBinding(),
    ),
    GetPage(
      name: Routes.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: Routes.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: Routes.NOTIFICATIONS,
      page: () => const NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: Routes.EXCLUSIVEDETAIL,
      page: () => ExclusiveDetailView(),
      binding: ExclusiveBinding(),
    ),
    GetPage(
      name: Routes.CARTDETAIL,
      page: () => const CartDetailView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: Routes.ADDCARD,
      page: () => const AddCardView(),
      binding: AddCardBiding(),
    ),
    GetPage(
      name: Routes.SUPPORT,
      page: () => const SupportView(),
      binding: SupportBinding(),
    ),
    GetPage(
      name: Routes.PRIVACY,
      page: () => const PrivacyView(),
      binding: PrivacyBinding(),
    ),
    GetPage(
      name: Routes.TERMSCONDITION,
      page: () => const TermsConditionView(),
      binding: TermsConditionBinding(),
    ),
    // GetPage(
    //   name: Routes.HOME,
    //   page: () => const HomeView(),
    //   binding: HomeBindings(),
    // ),
    // GetPage(
    //   name: Routes.TICKET,
    //   page: () => const TicketView(),
    //   binding: TicketBinding(),
    // ),
    // GetPage(
    //   name: Routes.PROFILE,
    //   page: () => ProfileView(),
    //   binding: ProfileBindings(),
    // ),
    // GetPage(
    //   name: Routes.SETTING,
    //   page: () => SettingView(),
    //   binding: SettingBindings(),
    // ),
  ];
}










