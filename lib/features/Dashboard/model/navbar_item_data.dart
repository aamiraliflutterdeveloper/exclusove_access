import 'package:exclusive_access/utils/constants/app_images.dart';

class NavBarItemModel {
  final String title;
  final String image;
  NavBarItemModel({required this.title, required this.image});
}

List<NavBarItemModel> navBarItems = [
  NavBarItemModel(title: 'Home', image: AppImages.home_icon),
  NavBarItemModel(title: 'ticket', image: AppImages.ticket_icon),
  NavBarItemModel(title: 'Profile', image: AppImages.profile_icon),
  NavBarItemModel(title: 'Profile Settings', image: AppImages.more_icon),
];
