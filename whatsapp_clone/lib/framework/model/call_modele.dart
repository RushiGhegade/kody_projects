class CallDetails{

  final String userName;
  final bool isComing;
  final bool isCall;
  final String? profileImage;
  final String dataTime;
  final bool? isMissedCall;

  const CallDetails({this.isMissedCall=false,required this.dataTime,required this.userName,required this.isComing,required this.isCall,this.profileImage="assets/images/userLogo.jpg"});

}