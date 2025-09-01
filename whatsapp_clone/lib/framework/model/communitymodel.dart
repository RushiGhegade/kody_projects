



import '../getassets/images.dart';

class CommunityModel{
  final String communityName;
  final String? communityImage;
  List<CommunitiesInfo> communities;
  CommunityModel({required this.communityName,this.communityImage = GetImages.community,required this.communities});
}


class CommunitiesInfo{

    final String title;
    final String? image;
    final String subTitle;
    final String? date;
    final bool? isImage;
    const CommunitiesInfo({required this.title,this.isImage=false,this.image=GetImages.announcement,required this.subTitle, this.date});
}