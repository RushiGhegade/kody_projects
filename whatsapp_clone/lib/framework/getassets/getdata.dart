

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/framework/localStoreage/shared_preferance.dart';

import '../../ui/view/calls_screen.dart';
import '../../ui/view/chat_screen.dart';
import '../../ui/view/communities_screen.dart';
import '../../ui/view/update_screen.dart';
import '../../ui/widgets/myappbar.dart';
import '../model/call_modele.dart';
import '../model/communitymodel.dart';
import '../model/floatingactionbutton.dart';
import '../model/message.dart';
import '../model/userdetails.dart';
import 'getColors.dart';
import 'images.dart';

class Data {
  // channel information
  static List<CommunitiesInfo> channel = [
    CommunitiesInfo(
      title: "Job's Portal",
      subTitle: "You Followed the channel 'Job's Portal'",
      image:
          "https://i.pinimg.com/736x/0e/4d/a0/0e4da0e0a003c9446b35ec65909c5d33.jpg",
      isImage: true,
      date: "8/6/25",
    ),
    CommunitiesInfo(
      title: "Academy",
      subTitle: "practice Everyday on Ground",
      image:
          "https://i.pinimg.com/736x/b8/06/1c/b8061cf61dbbdea6c9c5972c3f54edba.jpg",
      isImage: true,
      date: "1/2/25",
    ),
    CommunitiesInfo(
      title: "English Academy",
      subTitle: "practice english Everyday",
      isImage: true,
      image:
          "https://i.pinimg.com/736x/8e/f8/55/8ef855f46702650f9c4f529d537d7d97.jpg",
      date: "1/2/25",
    ),
    CommunitiesInfo(
      title: "Job's",
      subTitle: "find jobs in this channel",
      image:
          "https://i.pinimg.com/736x/32/d4/c2/32d4c29a3aa50f95d5aae29de8e9ef62.jpg",
      isImage: true,
      date: "1/2/25",
    ),
    CommunitiesInfo(
      title: "Hindi Academy",
      subTitle: "practice Hindi Everyday",
      image: GetImages.community,
      date: "1/2/25",
    ),
    CommunitiesInfo(
      title: "Learn Things",
      subTitle: "Learn new things Everyday",
      image:
          "https://i.pinimg.com/736x/e5/12/c5/e512c541c494f8002cd28598d086114c.jpg",
      isImage: true,
      date: "1/2/25",
    ),
    CommunitiesInfo(
      title: "Job's Portal",
      subTitle: "You Followed the channel 'Job's Portal'",
      image: GetImages.community,
      date: "8/6/25",
    ),
    CommunitiesInfo(
      title: "English Academy",
      subTitle: "practice english Everyday",
      image:
          "https://i.pinimg.com/736x/ea/5e/4d/ea5e4d9f1629a680e8b6d3fd427f8e6e.jpg",
      isImage: true,
      date: "1/2/25",
    ),
  ];

  // communities Info
  static List<CommunityModel> community = [
    CommunityModel(
      communityName: "Zeal It Dept 2024-25",
      communities: [
        CommunitiesInfo(
          title: "Announcement",
          subTitle: "HOD added the groups \"Be IT (A) Official 2025-26\" ",
          date: "7/22/25",
        ),
        CommunitiesInfo(
          title: "Be IT (A) Official 2025-26",
          subTitle: "AJ : Hello EveryOne Submit the Above form",
          image: GetImages.zeal,
          isImage: true,
          date: "7:35 Am",
        ),
      ],
    ),

    CommunityModel(
      communityName: "Kody Technolab PVT",
      communities: [
        CommunitiesInfo(
          title: "Announcement",
          subTitle: "HR added the groups \"Kody Technolab Ltd - Interns\" ",
          date: "8/6/25",
        ),
        CommunitiesInfo(
          title: "Kody Technolab Ltd - Interns",
          subTitle: "HR : Hello EveryOne Kindly Check the email",
          image: GetImages.kody,
          isImage: true,
          date: "4:25 Pm",
        ),
        CommunitiesInfo(
          title: "Kody Technolab Ltd",
          subTitle: "HR : Hello EveryOne Kindly Check the email",
          image: GetImages.kody,
          isImage: true,
          date: "4:25 Pm",
        ),
      ],
    ),

    CommunityModel(
      communityName: "SPPU ENGINEERING UNOFFICIAL",
      communities: [
        CommunitiesInfo(
          title: "Announcement",
          subTitle: "+8530321810: Welcome to the community",
          date: "5/1/24",
        ),
        CommunitiesInfo(
          title: "Unofficial Sppu 2rd Group",
          subTitle: "Request to Join",
          image: GetImages.sppu,
          isImage: true,
          date: "2:25 Am",
        ),
        CommunitiesInfo(
          title: "Unofficial Sppu 3rd Group",
          subTitle: "Request to Join",
          image: GetImages.sppu1,
          isImage: true,
          date: "1:25 Pm",
        ),
        CommunitiesInfo(
          title: "Unofficial Sppu 4rd Group",
          subTitle: "Request to Join",
          image: GetImages.sppu,
          isImage: true,
          date: "1:25 Pm",
        ),
      ],
    ),

    CommunityModel(
      communityName: "ENGINEER'S KATTA",
      communities: [
        CommunitiesInfo(
          title: "Announcement",
          subTitle: "+8530321810: Welcome to the community",
          date: "2/9/24",
        ),
        CommunitiesInfo(
          title: "ENGINEER'S KATTA Official",
          subTitle: "Request to Join",
          date: "2:25 Am",
          image: GetImages.kata,
          isImage: true,
        ),
        CommunitiesInfo(
          title: "ENGINEER'S KATTA Official1",
          subTitle: "Request to Join",
          date: "1:25 Pm",
          image: GetImages.kata1,
          isImage: true,
        ),
      ],
    ),
  ];

  //call info
  static List<CallDetails> call = [
    CallDetails(
      userName: "Shriram Khade",
      dataTime: "Jun 14,4:31 Pm",
      isComing: false,
      isCall: true,
    ),
    CallDetails(
      userName: "Rushikesh Bhate",
      dataTime: "Jun 8, 1:31 Pm",
      isComing: true,
      isCall: true,
    ),
    CallDetails(
      userName: "Abhay Gaikwad",
      dataTime: "Jun 1, 5:31 Am",
      isComing: true,
      isCall: true,
    ),
    CallDetails(
      isMissedCall: true,
      userName: "Kunal Sontakke",
      dataTime: "July 23, 1:14 Pm",
      isComing: false,
      isCall: false,
    ),
    CallDetails(
      userName: "Ashish Ghegade",
      dataTime: "july 20, 12:33 Am",
      isComing: true,
      isCall: true,
    ),
    CallDetails(
      userName: "Rutik Ghegade",
      dataTime: "july 1, 5:16 Am",
      isComing: true,
      isCall: false,
    ),
    CallDetails(
      isMissedCall: true,
      userName: "Rushikesh Ghegade",
      dataTime: "August 4, 5:31 Pm",
      isComing: true,
      isCall: true,
    ),
    CallDetails(
      userName: "Yash Saindane",
      dataTime: "August 2, 2:11 Am",
      isComing: true,
      isCall: false,
    ),
    CallDetails(
      userName: "Bhushan chaudhari",
      dataTime: "August 1, 3:31 Pm",
      isComing: false,
      isCall: true,
    ),
    CallDetails(
      isMissedCall: true,
      userName: "Kiran shelke",
      dataTime: "Jun 24, 3:31 Am",
      isComing: false,
      isCall: true,
    ),
  ];

  // getUsersMessage
  static void getUsersMessage()async{
    for(int i=0;i<Data.users.length;i++){
      Data.users[i].messageList!.addAll(await StoreDataLocally.getMessage(Data.users[i].userName));
    }

  }

  // users
  static List<UserDetails> users = [
    UserDetails(
      id: '6',
      addCategory: ["All", "Unread", "Favorites", "Groups"],
      messageList: [
        Message(name: "Hii", isSending: true, time: "7:30 Am"),
        Message(name: "Hello", isSending: false, time: "7:10 Am"),
      ],
      userStatus: "online",
      pendingMessage: 2,

      userName: "Rutik Ghegade",
      status:
          "https://i.pinimg.com/1200x/6e/d9/1b/6ed91bf62cabc57b11b3f083f824647d.jpg",
    ),
    UserDetails(
      id: '8',
      addCategory: ["All"],
      messageList: [
        Message(name: "Hii", isSending: false, time: "7:30 Am"),
        Message(name: "Hello", isSending: true, time: "7:10 Am"),
      ],
      pendingMessage: 15,
      userStatus: "last seen sat 12:21 pm ",
      userName: "Shriram Khade",
      status:
          "https://i.pinimg.com/1200x/f7/7d/8a/f77d8af9640497c2061c3057c944ed84.jpg",
    ),

    UserDetails(
      id: '11',
      addCategory: ["All", "Unread","Groups"],
      messageList: [
        Message(name: "Hii", isSending: false, time: "7:30 Am"),
        Message(name: "Hello", isSending: true, time: "7:10 Am"),
      ],
      userStatus: "Abhi, Pavan, Prashant, Rushi",
      pendingMessage: 3,
      isCommunity: true,
      profileImage: GetImages.pass,
      userName: "2025 Passing Batch",
    ),

    UserDetails(
      id: '9',
      messageList:[],
      addCategory: ["All", "Unread",],
      pendingMessage: 5,
      userName: "Rushikesh Bhate",
      // userStatus: "last seen sat 12:21 pm ",
      status:
          "https://i.pinimg.com/736x/34/e1/f8/34e1f8b78b57b238e2c665773d865b41.jpg",
    ),

    UserDetails(
      id: '10',
      addCategory: ["All"],
      messageList: [],
      userName: "Abhay Gaikwad",
      status:
          "https://i.pinimg.com/736x/61/f5/38/61f53884e346762c134dc4e333dead7f.jpg",
    ),

    UserDetails(
      id: '12',
      addCategory: ["All","Groups"],
      messageList: [
        Message(name: "Hii", isSending: false, time: "7:30 Am"),
        Message(name: "Hello", isSending: true, time: "7:10 Am"),
      ],
      userStatus: "Prashant, Rushi, Abhi, Pavan",
      pendingMessage: 1,
      isCommunity: true,
      profileImage: GetImages.zeal,
      userName: "Zeal IT Dept 2024-25",
    ),

    UserDetails(
      id: '1',
      messageList:[],
      addCategory: ["All", "Favorites"],
      userStatus: "Message Yourself",
      userName: "Rushikesh Ghegade",
      status:
          "https://i.pinimg.com/736x/c6/67/4c/c6674c64e4c1ad0e34a62994cd7f680c.jpg",
    ),
    UserDetails(
      id: '2',
      messageList:[],
      addCategory: ["All", "Unread", "Favorites"],
      userStatus: "last seen sat 12:21 pm ",
      pendingMessage: 4,
      userName: "Yash Saindane",

      status:
          "https://i.pinimg.com/736x/d5/26/6f/d5266fe4c7d0800240cc46fefca49f2e.jpg",
    ),

    UserDetails(
      id: '13',
      addCategory: ["All", "Unread", "Groups"],
      messageList: [
        Message(name: "Hii", isSending: false, time: "7:30 Am"),
        Message(name: "Hello", isSending: true, time: "7:10 Am"),
      ],
      userStatus: "Prashant, Rushi, Abhi, Pavan",
      pendingMessage: 3,
      isCommunity: true,
      userName: "BE IT Unofficial",
      profileImage: GetImages.zeal,
    ),

    UserDetails(
      id: '3',
      messageList:[],
      addCategory: [ "Favorites"],
      userName: "Bhushan chaudhari",
      userStatus: "last seen sat 12:21 pm ",
      status:
          "https://i.pinimg.com/736x/18/65/c9/1865c96bea8915336cadc2a5d2228579.jpg",
    ),
    UserDetails(
      id: '4',
      addCategory: ["All", "Unread", "Favorites", "Groups"],
      messageList: [],
      userStatus: "online",
      userName: "Kunal Sontakke",
      status:
          "https://i.pinimg.com/736x/d9/46/de/d946de1a28fe0480e1ba72ea3463883f.jpg",
    ),
    UserDetails(
      id: '5',
      addCategory: ["All", "Unread", "Favorites", "Groups"],
      messageList: [
        Message(name: "Hii", isSending: false, time: "7:30 Am"),
        Message(name: "Hello", isSending: true, time: "7:10 Am"),
      ],
      userStatus: "online",
      pendingMessage: 10,
      userName: "Ashish Ghegade",
      status:
          "https://i.pinimg.com/1200x/a5/ab/36/a5ab36e1a83e3ebcde49f0a62a9cc8bb.jpg",
    ),
    UserDetails(
      id: '7',
      addCategory: ["All", "Unread", "Favorites", "Groups"],
      messageList: [],
      userStatus: "online",
      userName: "Kiran shelke",
      status:
          "https://i.pinimg.com/1200x/6e/d9/1b/6ed91bf62cabc57b11b3f083f824647d.jpg",
    ),
  ];

  // floatingActionButtonInfo
  static List<FloatingInfo> buttonInfo = [
    FloatingInfo(
      isShowIcon: true,
      isShowIcon1: true,
      icon: Icon(Icons.add_comment, color: GetColors.white),
      widget: Image.asset(GetImages.metaAi),
    ),
    FloatingInfo(
      isShowIcon: true,
      isShowIcon1: true,
      icon: Icon(Icons.add_a_photo_rounded, color: GetColors.white),
      widget: Icon(Icons.edit, color: GetColors.black),
    ),
    FloatingInfo(
      isShowIcon: false,
      isShowIcon1: false,
      icon: Icon(Icons.add, color: GetColors.white),
    ),
    FloatingInfo(
      isShowIcon: false,
      isShowIcon1: true,
      icon: Icon(Icons.add_ic_call_rounded, color: GetColors.white),
    ),
  ];

  // screen that show
  static List<Widget> screens = [
    ChatScreen(),
    UpdateScreen(),
    CommunitiesScreen(),
    CallsScreen(),
  ];

  // appBar Info
  static List<MyAppBar> showAppBar = [
    MyAppBar(
      title: "WhatsApp",
      fontWeight: FontWeight.w700,
      color: GetColors.colorOriginal,
      icon: Icons.camera_alt_outlined,
    ),
    MyAppBar(
      title: "Updates",
      fontWeight: FontWeight.w500,
      color: GetColors.black,
      icon: Icons.search,
    ),
    MyAppBar(
      title: "Communities",
      fontWeight: FontWeight.w500,
      color: GetColors.black,
    ),
    MyAppBar(
      title: "Calls",
      fontWeight: FontWeight.w500,
      color: GetColors.black,
      icon: Icons.search,
    ),
  ];

  // CategoryText
  static List<String> categoryText = ["All", "Unread", "Favorites", "Groups"];
}
