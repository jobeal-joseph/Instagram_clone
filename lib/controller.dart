import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';



List<String> messages = [];
TextEditingController controller = TextEditingController();
TextEditingController idController = TextEditingController();
TextEditingController passController = TextEditingController();

class Login {
  // Signup — Save username and password
  Future<void> signup(String username, String password) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', username);
    await prefs.setString('password', password);
  }

  Future<bool> login(String username, String password) async {
    final prefs = await SharedPreferences.getInstance();
    final savedUsername = prefs.getString('username');
    final savedPassword = prefs.getString('password');

    if (username == savedUsername && password == savedPassword) {
      return true;
    } else {
      return false;
    }
  }
}

// class SharedPreferences {
//   static Future getInstance() async {}
// }

class Stories{
  final String name;
  final String dp;
  final String caption;
  final String like;
  final String comment;

  Stories({
    required this.name,
    required this.dp,
    required this.caption,
    required this.like,
    required this.comment,
  });
}

List<Stories> story= [
  Stories(name: 'Your story', dp: 'pic12.jpeg', caption: "h", like:"25", comment:"7"),
  Stories(name: 'call_meh_fam', dp: 'pic2.jpg', caption: " This feeling",like:"48", comment:"10"),
  Stories(name: 'die.hrader_sie', dp: 'pic3.jpeg', caption: " This is an Amazing post",like:"35", comment:"5"),
  Stories(name: 'verxin_ig', dp: 'pic4.png', caption: "Feels so good",like:"90", comment:"75"),
  Stories(name: 'king_leo', dp: 'pic5.jpg', caption: "Its so beautiful!!",like:"61", comment:"24"),
  Stories(name: 'wreck.it_half', dp: 'pic10.jpeg', caption: "h",like:"", comment:""),
  Stories(name: 'i_am_ken', dp: 'pic9.webp', caption: "h",like:"", comment:""),
];

List<String> posts = [
  'post3.jpg','post4.webp','post2.webp','post1.avif','pic16.jpg'
];

List<String> usernames = [
  'Your story','james', 'elena', 'rohit',
  'maria', 'ahmed', 'olivia', 'lucas', 'anika'
];

List<String> imageAssets = [
  'assets/john.jpg',
  'assets/james.jpg',
  'assets/elena.jpg',
  'assets/rohit.jpg',
  'assets/maria.jpg',
  'assets/ahmed.jpg',
  'assets/olivia.jpg',
  'assets/lucas.jpg',
  'assets/anika.jpg',
];

List<String> postUsernames = [
  'john', 'maria', 'rohit'
];

List<String> postProfilePics = [
  'assets/john.jpg',
  'assets/maria.jpg',
  'assets/rohit.jpg',
];

List<String> postImages = [
  'assets/post1.jpg',
  'assets/post3.jpg',
  'assets/post2.jpg',
];

List<String> postCaptions = [
  "Enjoying the sunny vibes!☀️",
  "Moments like these ✨",
  "Good times with friends!😎🤩",
];

// Chat List
List<String> chatNames = [
  'john', 'susan', 'james', 'elena', 'rohit', 'maria', 'anna'
];

List<String> chatImages = [
  'assets/pic11.webp',
  'assets/pic13.jpeg',
  'assets/pic8.webp',
  'assets/pic15.webp',
  'assets/pic2.jpg',
  'assets/pic1.jpg',
  'assets/pic3.jpeg',
];

List<String> chatMessages = [
  'Active now',
  'Sent a reel by babu.xyz',
  'Active now',
  'Sent 7h ago',
  'Active now',
  'Seen 6h ago',
  'Active now',
];

List<String> chatUsernames = [
  'max_verstappen',
  'susan_sky',
  'jamesthoughts',
  'elena.22',
  'rohit_live',
  'maria_luna',
  'ahmed.xd',
];


Map<String, List<Map<String, String>>> chatConversations = {
  'john': [
    {'sender': 'other', 'message': 'Yes of course!'},
    {'sender': 'me', 'message': 'Are you coming to the party?'},
    {'sender': 'me', 'message': 'Hey Max!'},
  ],
  'susan': [
    
    {'sender': 'me', 'message': 'what time?'},
    {'sender': 'me', 'message': 'yeah tmrw at cafe rose.'},
    {'sender': 'other', 'message': 'Lets meet up?'},
    {'sender': 'other', 'message': 'How was school?'},
  ],
  'james': [
    
    
    
    {'sender': 'me', 'message': 'lets get it from the zhang\'s'},
    {'sender': 'me', 'message': 'Yeah1 they have the best noodles!'},
    {'sender': 'other', 'message': 'Chinese?'},
    {'sender': 'me', 'message': ' lets have chinese chicken noodles'},
    {'sender': 'other', 'message': 'Shall we order dinner?'},
  ],
  'elena': [
    
    
    {'sender': 'me', 'message': 'The train starts at 8:30 am'},
    {'sender': 'other', 'message': 'what time is ur train?'},
    {'sender': 'me', 'message': 'I will probably reach by 12:30 pm'},
    {'sender': 'other', 'message': 'when should i come and pick u up?'},
  ],
  'maria': [
    {'sender': 'other', 'message': 'Loved your last story 😍'},
    {'sender': 'other', 'message': 'Hi!'},
    
    {'sender': 'me', 'message': 'Loved your post!'},
    {'sender': 'me', 'message': 'Hi Maria!'},
  ],
  'rohit': [
    {'sender': 'other', 'message': 'Let\'s catch up tomorrow.'},
    {'sender': 'other', 'message': 'Yo bro!'},
    {'sender': 'me', 'message': 'Yo bro!'},
  ],
  'ahmed': [
    {'sender': 'other', 'message': 'Good morning!'},
  ],
};


List<String> noteNames = ['your note','john', 'anna', 'maria', 'rohit'];
List<String> noteImages = [
  'assets/pic12.jpeg',
  'assets/pic11.webp',
  'assets/pic3.jpeg',
  'assets/pic1.jpg',
  'assets/pic2.jpg',
];

// True means message is unread
List<bool> isUnread = [
  true,
  false,
  true,
  false,
  true,
  false,
  true,
];



List<String> noteTexts = [
  'Share a note',
  'Feeling happy 😄',
  'Back to work 🧑‍💻',
  'Weekend plans?',
  'Don\'t forget to chill 🧊',
];




