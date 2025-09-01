

import 'message.dart';

class UserDetails {
  String id;
  String userName;
  String? profileImage;
  String? status;
  bool? isCommunity;
  int? pendingMessage;
  List<Message>? messageList;
  String? userStatus;
  bool? isViewStatus;
  bool? isStatusLike;
  String? prompt;
  final List<String>? addCategory;
  UserDetails({
    required this.id,
    this.addCategory,
    this.prompt="Hey there! i am using WhatsApp",
    this.messageList,
    this.isStatusLike=false,
    this.pendingMessage = 0,
    this.isViewStatus=false,
    this.isCommunity = false,
    this.status,
    required this.userName,
    this.profileImage = "assets/images/userLogo.jpg",
    this.userStatus="Business Account"
  });
}
