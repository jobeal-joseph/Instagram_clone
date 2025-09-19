import 'dart:io';
import 'package:flutter/material.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instagram_clone_/controller.dart';

class ChatPage extends StatefulWidget {
  final String name;
  final String img;
  final String username;

  const ChatPage({super.key, required this.name, required this.img, required this.username});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
final List<Map<String, String>> message = [];
  bool _showEmojiPicker = false;

  void toggleEmojiPicker() {
    setState(() {
      _showEmojiPicker = !_showEmojiPicker;
    });
  }

  @override
  void initState() {
    super.initState();
    final conversation = chatConversations[widget.name.toLowerCase()] ?? [];
    message.addAll(conversation);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        elevation: 0.3,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            CircleAvatar(
              

              backgroundImage: AssetImage(widget.img),
              

              radius: 20,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  widget.username,
                  style: const TextStyle(color: Colors.black, fontSize: 12),
                ),
              ],
            ),
          ],
        ),
        actions: const [
          Icon(Icons.call_outlined, color: Colors.black, size: 28),
          SizedBox(width: 20),
          Icon(Icons.videocam_outlined, color: Colors.black, size: 28),
          SizedBox(width: 12),
        ],
      ),

      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                reverse: true,
                itemCount: message.length,
                itemBuilder: (context, index) {
                  final msg = message[index];
                  final  content =  msg["message"] ?? "";
                  if (content.endsWith('.jpg') || content.endsWith('.png')) {
                    return Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.file(File(content), width: 200),
                        ),
                      ),
                    );
                  } else {
                    final  isMe = msg["sender"] == "me";
                    final cleanMsg = msg["message"] ?? "";

                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 4,
                      ),
                      child: Row(
                        mainAxisAlignment: isMe
                            ? MainAxisAlignment.end
                            : MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          if (!isMe)
                            CircleAvatar(
                              radius: 16,
                              backgroundImage: AssetImage(widget.img),
                            ),
                          if (!isMe) const SizedBox(width: 8),
                          Flexible(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 14,
                              ),
                              decoration: BoxDecoration(
                                color: isMe
                                    ? const Color.fromARGB(255, 82, 6, 213)
                                    : const Color.fromARGB(255, 240, 240, 240),
                                borderRadius: BorderRadius.only(
                                  topLeft: const Radius.circular(16),
                                  topRight: const Radius.circular(16),
                                  bottomLeft: isMe
                                      ? const Radius.circular(16)
                                      : const Radius.circular(0),
                                  bottomRight: isMe
                                      ? const Radius.circular(0)
                                      : const Radius.circular(16),
                                ),
                              ),
                              child: Text(
                                cleanMsg,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: isMe ? Colors.white : Colors.black,
                                ),
                              ),
                            ),
                          ),
                          if (isMe) const SizedBox(width: 8),
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
        
            /// Emoji Picker
            if (_showEmojiPicker)
              SizedBox(
                height: 250,
                child: EmojiPicker(
                  onEmojiSelected: (category, emoji) {
                    setState(() {
                      controller.text += emoji.emoji;
                    });
                  },
                  config: Config(
                    emojiViewConfig: EmojiViewConfig(
                      emojiSizeMax: 28,
                      columns: 7,
                      backgroundColor: const Color(0xFFF2F2F2),
                    ),
                    categoryViewConfig: CategoryViewConfig(
                      indicatorColor: const Color.fromARGB(255, 71, 20, 192),
                      iconColor: Colors.grey,
                      iconColorSelected:  const Color.fromARGB(255, 71, 20, 192),
                      backspaceColor:  const Color.fromARGB(255, 71, 20, 192),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),

      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF1F1F1),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor:  const Color.fromARGB(255, 71, 20, 192),
                        radius: 20,
                        child: Center(
                          child: IconButton(
                            icon: const Icon(Icons.camera_alt,
                                color: Colors.white),
                            onPressed: () {},
                          ),
                        ),
                      ),
                     SizedBox(width: 5,),
                      Expanded(
                        child: TextField(
                          controller: controller,
                          style: const TextStyle(color: Colors.black),
                          decoration: const InputDecoration(
                            hintText: "Message...",
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                                color: Colors.grey, fontSize: 15),
                          ),
                        ),
                      ),
                       IconButton(
                        icon: FaIcon(FontAwesomeIcons.microphone, color: Colors.black54, size: 21,),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.image, color: Colors.black54),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.emoji_emotions_outlined,
                            color: Colors.black54),
                        onPressed: toggleEmojiPicker,
                      ), 
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 6),
              CircleAvatar(
                radius: 22,
                backgroundColor: const Color.fromARGB(255, 71, 20, 192),
                child: IconButton(
                  icon: const Icon(Icons.send, color: Colors.white),
                  onPressed: () {
                    if (controller.text.isNotEmpty) {
                      setState(() {
                        message.insert(0, {
                          "sender": "me",
                          "message": controller.text,
                        });
                        controller.clear();
                      });
                       chatConversations[widget.name.toLowerCase()] = List.from(message);
  
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
