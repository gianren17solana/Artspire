import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/svg.dart';
import 'package:artspire/widgets/searcbar.dart';
import 'package:artspire/models/chatItem.dart';
import 'package:artspire/components/chat_section.dart';
import 'package:artspire/apiService.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({super.key});

  @override
  State<MessagesPage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagesPage> {
  int selectedIndex = 0;
  late Future<List<ChatItem>> _chatsFuture;

  @override
  void initState() {
    super.initState();
    _chatsFuture = ApiService.fetchChats();
  }

  void _updateCategory(index) {
    setState(() {
      selectedIndex = index;
    });
  }

  List<ChatItem> filteredItems(List<ChatItem> chats) {
    if (selectedIndex == 0)
      return chats;
    else
      return chats.where((e) => e.isRequested).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF21212E),
      body: FutureBuilder<List<ChatItem>>(
        future: _chatsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                "Failed to load messages",
                style: GoogleFonts.poppins(color: Colors.white70),
              ),
            );
          }

          final chats = snapshot.data!;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MessageHeader(),
              ChatType(selectedIndex: selectedIndex, onSelected: _updateCategory),
              ChatTree(chats: filteredItems(chats)),
            ],
          );
        },
      ),
    );
  }
}

class ChatType extends StatefulWidget {
  final int selectedIndex;
  final void Function(int) onSelected;

  const ChatType({
    super.key,
    required this.selectedIndex,
    required this.onSelected,
  });

  @override
  State<ChatType> createState() => _ChatTypeState();
}

class _ChatTypeState extends State<ChatType> {
  static const List<String> msgcategs = ["All", "My Requests"];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 12),
      child: Row(
        children: List.generate(msgcategs.length, (index) {
          final isSelected = index == widget.selectedIndex;

          return Padding(
            padding: EdgeInsets.only(
              right: index == msgcategs.length - 1 ? 0 : 10,
            ),
            child: GestureDetector(
              onTap: () => widget.onSelected(index),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 13,
                  vertical: 3,
                ),
                decoration: isSelected
                    ? BoxDecoration(
                        color: const Color(0xFF7A88F2),
                        borderRadius: BorderRadius.circular(8),
                      )
                    : BoxDecoration(
                        border: Border.all(
                          color: const Color(0xFF383843),
                          width: 1,
                          style: BorderStyle.solid,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                child: Text(
                  msgcategs[index],
                  style: GoogleFonts.poppins(
                    fontSize: isSelected ? 14 : 13,
                    fontWeight: isSelected
                        ? FontWeight.w500
                        : FontWeight.normal,
                    color: isSelected ? Colors.white : const Color(0xFFC5C2D2),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class MessageHeader extends StatelessWidget {
  const MessageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 42),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Messages",
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          Searchbar(hintMsg: "Search direct messages"),
        ],
      ),
    );
  }
}
