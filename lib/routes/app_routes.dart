import 'package:flutter/material.dart';
import '../views/splash/splash_screen.dart';
import '../views/onboarding/onboarding_screen.dart';
import '../views/auth/login_screen.dart';
import '../views/group/create_group_screen.dart';
import '../views/group/join_group_screen.dart';
import '../views/dashboard/group_dashboard.dart';
import '../views/contributions/contribution_screen.dart';
import '../views/notifications/notifications_screen.dart';
import '../views/tips/tips_screen.dart';
import '../views/auth/otp_screen.dart';
import '../views/auth/signup_screen.dart';
import '../views/payments/make_payment.dart';
import '../views/payments/bank_card.dart';
import '../views/payments/onemoney.dart';
import '../views/payments/mastercard.dart';
import '../views/payments/visa.dart';
import '../views/payments/ecocash.dart';
import '../views/dashboard/new_group_dashboard.dart';
import '../views/dashboard/overview_new.dart';
import '../views/chatbot/chatbot.dart';
import '../group_settings/change_contribution.dart';
import '../group_settings/change_cycle_type.dart';
import '../group_settings/edit_group_name.dart';
import '../group_settings/share_invite_link.dart';

class AppRoutes {
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String createGroup = '/create-group';
  static const String joinGroup = '/join-group';
  static const String dashboard = '/dashboard';
  static const String contribution = '/contribution';
  static const String notifications = '/notifications';
  static const String tips = '/tips';
  static const String otpVerification = '/otpVerification';
  static const String signup = '/signup';
  static const String payment = '/payment';
  static const String ecocash = '/ecocash';
  static const String bankcard = '/bankcard';
  static const String mastercard = '/mastercard';
  static const String visa = '/visa';
  static const String onemoney = '/onemoney';
  static const String qr = '/qr';
  static const String new_dashboard = '/new_dashboard';
  static const String new_overview = '/new_overview';
  static const String chatbot = '/chatbot';
  static const String change_contribution = '/changecontribution';
  static const String change_cycle_type = '/change_cycle_type';
  static const String edit_group_name = '/edit_group_name';
  static const String share_invite_link = '/share_link';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case onboarding:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
      case login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case createGroup:
        return MaterialPageRoute(builder: (_) => CreateGroupScreen());
      case joinGroup:
        return MaterialPageRoute(builder: (_) => JoinGroupScreen());
      case dashboard:
        return MaterialPageRoute(builder: (_) => GroupDashboard(groupId: ''));
      case contribution:
        return MaterialPageRoute(builder: (_) => ContributionScreen());
      case otpVerification:
        return MaterialPageRoute(builder: (_) => (OtpScreen(phoneNumber: '')));
      case notifications:
        return MaterialPageRoute(builder: (_) => NotificationScreen());
      case signup:
        return MaterialPageRoute(builder: (_) => SignupScreen());
      case tips:
        return MaterialPageRoute(builder: (_) => TipsScreen());
      case ecocash:
        return MaterialPageRoute(builder: (_) => EcoCashPaymentScreen());
      case onemoney:
        return MaterialPageRoute(builder: (_) => OneMoneyPaymentScreen());
      case visa:
        return MaterialPageRoute(builder: (_) => VisaPaymentScreen());
      case mastercard:
        return MaterialPageRoute(builder: (_) => MasterCardPaymentScreen());
      case bankcard:
        return MaterialPageRoute(builder: (_) => BankPaymentScreen());
      case new_dashboard:
        return MaterialPageRoute(builder: (_) => NewGroupDashboard());
      case payment:
        return MaterialPageRoute(builder: (_) => PaymentScreen());
      case new_overview:
        return MaterialPageRoute(builder: (_) => NewOverviewScreen());

      case change_contribution:
        return MaterialPageRoute(
          builder: (_) => ChangeContributionAmountScreen(),
        );
      case chatbot:
        return MaterialPageRoute(builder: (_) => Chatbot());
      case change_cycle_type:
        return MaterialPageRoute(builder: (_) => ChangeCycleTypeScreen());
      case edit_group_name:
        return MaterialPageRoute(
          builder:
              (_) => EditGroupNameScreen(currentGroupName: 'Zunde Dev Team'),
        );
      case share_invite_link:
        return MaterialPageRoute(
          builder:
              (_) => ShareGroupInviteLinkScreen(groupName: 'Zunde Dev Team'),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(body: Center(child: Text('Page not found'))),
        );
    }
  }
}
