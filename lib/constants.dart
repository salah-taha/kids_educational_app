import 'package:flutter/material.dart';

class Constants {
  // Colors
  static const Color darkBlueColor = Color(0xFF1D3557);
  static const Color darkGreenColor = Color(0xFF457B9D);
  static const Color midGreenColor = Color(0xFFA8DADC);
  static const Color greenColor = Color(0xFFF1FAEE);
  static const Color redColor = Color(0xFFE63946);
  static const Color whiteColor = Color(0xFFFFFFFF);

  // Text Styles
  static const TextStyle largeTitleTextStyle = TextStyle(
    color: redColor,
    fontSize: 52,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle titleTextStyle = TextStyle(
    color: redColor,
    fontSize: 32,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle subTitleTextStyle = TextStyle(
    color: redColor,
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  // insets
  static const EdgeInsets defaultPadding = EdgeInsets.all(16);
  static const EdgeInsets verticalPadding = EdgeInsets.symmetric(vertical: 16);
  static const EdgeInsets horizontalPadding =
      EdgeInsets.symmetric(horizontal: 16);

  static const List<String> arabicLetters = [
    "ا",
    "ب",
    "ت",
    "ث",
    "ج",
    "ح",
    "خ",
    "د",
    "ذ",
    "ر",
    "ز",
    "س",
    "ش",
    "ص",
    "ض",
    "ط",
    "ظ",
    "ع",
    "غ",
    "ف",
    "ق",
    "ك",
    "ل",
    "م",
    "ن",
    "ه",
    "و",
    "ي",
  ];

  static const List<String> words = [
    'ارنب',
    'بطيخة',
    'تفاحة',
    'ثعلب',
    'جمل',
    'حصان',
    'خروف',
    'ديك',
    'ذئب',
    'رمان',
    'زرافة',
    'سمكة',
    'شمس',
    'صقر',
    'ضفدع',
    'طائرة',
    'ظبي',
    'عصفور',
    'غراب',
    'فيل',
    'قطار',
    'كلب',
    'ليمون',
    'موز',
    'نملة',
    'هدهد',
    'وردة',
    'يد',
  ];

  static String? getYoutubeThumbnail(String videoUrl) {
    final uri = Uri.tryParse(videoUrl);
    if (uri == null) {
      return null;
    }

    return 'https://img.youtube.com/vi/${uri.queryParameters['v']}/0.jpg';
  }

  static List<Story> stories = [
    Story(
        title: 'قصة سيدنا ادم عليه السلام',
        url:
            'https://www.youtube.com/watch?v=lfHl_v1YIiE&list=PLc6oCbxjAwY6RYpPKN7VRcjiss02sJZn2&index=1'),
    Story(
        title: 'قصة سيدنا ادريس عليه السلام',
        url:
            'https://www.youtube.com/watch?v=MzzELS8CfWU&list=PLc6oCbxjAwY6RYpPKN7VRcjiss02sJZn2&index=2'),
    Story(
        title: 'قصة سيدنا نوح عليه السلام',
        url:
            'https://www.youtube.com/watch?v=BzcfE6tDyA0&list=PLc6oCbxjAwY6RYpPKN7VRcjiss02sJZn2&index=3'),
    Story(
        title: 'قصة سيدنا صالح عليه السلام',
        url:
            'https://www.youtube.com/watch?v=v1JEjFBhhYE&list=PLc6oCbxjAwY6RYpPKN7VRcjiss02sJZn2&index=4'),
    Story(
        title: 'قصة سيدنا هود عليه السلام',
        url:
            'https://www.youtube.com/watch?v=lcXSyqoZg0U&list=PLc6oCbxjAwY6RYpPKN7VRcjiss02sJZn2&index=5'),
    Story(
        title: 'قصة سيدنا لوط عليه السلام',
        url:
            'https://www.youtube.com/watch?v=29K7cTDqHK0&list=PLc6oCbxjAwY6RYpPKN7VRcjiss02sJZn2&index=6'),
    Story(
        title: 'قصة سيدنا ابراهيم عليه السلام',
        url:
            'https://www.youtube.com/watch?v=QTn3ZwMYKac&list=PLc6oCbxjAwY6RYpPKN7VRcjiss02sJZn2&index=7'),
    Story(
        title: 'قصة سيدنا اسحاق عليه السلام',
        url:
            'https://www.youtube.com/watch?v=ojwYJxJbn7U&list=PLc6oCbxjAwY6RYpPKN7VRcjiss02sJZn2&index=8'),
    Story(
        title: 'قصة سيدنا يعقوب عليه السلام',
        url:
            'https://www.youtube.com/watch?v=nDeY4Qv8xBs&list=PLc6oCbxjAwY6RYpPKN7VRcjiss02sJZn2&index=9'),
    Story(
        title: 'قصة سيدنا يوسف عليه السلام',
        url:
            'https://www.youtube.com/watch?v=JX_KcC8eY2g&list=PLc6oCbxjAwY6RYpPKN7VRcjiss02sJZn2&index=10'),
    Story(
        title: 'قصة سيدنا شعيب عليه السلام',
        url:
            'https://www.youtube.com/watch?v=nzUjKIiXPd4&list=PLc6oCbxjAwY6RYpPKN7VRcjiss02sJZn2&index=11'),
    Story(
        title: 'قصة سيدنا أيوب عليه السلام',
        url:
            'https://www.youtube.com/watch?v=IzrqOJXwkTw&list=PLc6oCbxjAwY6RYpPKN7VRcjiss02sJZn2&index=12'),
    Story(
        title: 'قصة سيدنا ذو الكفل عليه السلام',
        url:
            'https://www.youtube.com/watch?v=rwpn6XzzbcM&list=PLc6oCbxjAwY6RYpPKN7VRcjiss02sJZn2&index=13'),
    Story(
        title: 'قصة سيدنا يونس عليه السلام',
        url:
            'https://www.youtube.com/watch?v=Ix2BPeLqkCI&list=PLc6oCbxjAwY6RYpPKN7VRcjiss02sJZn2&index=14'),
    Story(
        title: 'قصة سيدنا موسى عليه السلام',
        url:
            'https://www.youtube.com/watch?v=xbxPKIESzHE&list=PLc6oCbxjAwY6RYpPKN7VRcjiss02sJZn2&index=15'),
    Story(
        title: 'قصة سيدنا هارون عليه السلام',
        url:
            'https://www.youtube.com/watch?v=l6PNcMSX2ts&list=PLc6oCbxjAwY6RYpPKN7VRcjiss02sJZn2&index=16'),
    Story(
        title: 'قصة سيدنا الياس عليه السلام',
        url:
            'https://www.youtube.com/watch?v=9yah_gYT94g&list=PLc6oCbxjAwY6RYpPKN7VRcjiss02sJZn2&index=17'),
    Story(
        title: 'قصة سيدنا داوود عليه السلام',
        url:
            'https://www.youtube.com/watch?v=71fA3fmU82Y&list=PLc6oCbxjAwY6RYpPKN7VRcjiss02sJZn2&index=18'),
    Story(
        title: 'قصة سيدنا سليمان عليه السلام',
        url:
            'https://www.youtube.com/watch?v=SRp7-S6fPKw&list=PLc6oCbxjAwY6RYpPKN7VRcjiss02sJZn2&index=19'),
    Story(
        title: 'قصة سيدنا عيسى عليه السلام',
        url:
            'https://www.youtube.com/watch?v=-Y5Ir52F7vE&list=PLc6oCbxjAwY6RYpPKN7VRcjiss02sJZn2&index=20'),
    Story(
        title: 'قصة سيدنا زكريا ويحيى عليهما السلام',
        url:
            'https://www.youtube.com/watch?v=BeLGOIsVtcg&list=PLc6oCbxjAwY6RYpPKN7VRcjiss02sJZn2&index=21'),
    Story(
        title: 'قصة سيدنا محمد صلى الله عليه وسلم',
        url: 'https://www.youtube.com/watch?v=67VgFvJ18Hk'),
  ];
}

class Story {
  String title;
  String url;

  Story({required this.title, required this.url});
}
