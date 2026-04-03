import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class RoundedSearchBar extends StatefulWidget {
  const RoundedSearchBar({super.key, this.title = 'Search here.....'});

  final String title;

  @override
  State<RoundedSearchBar> createState() => _RoundedSearchBarState();
}

class _RoundedSearchBarState extends State<RoundedSearchBar> {
  final TextEditingController _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _search(String text) {
    if (kDebugMode) {
      print('Searching for: $text');
    }
    _textController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          const Icon(Icons.search, color: Colors.grey, size: 20),
          const SizedBox(width: 5),
          Expanded(
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: widget.title,
                border: InputBorder.none,
                contentPadding: const EdgeInsets.only(bottom: 10),
              ),
              onSubmitted: _search,
            ),
          ),
        ],
      ),
    );
  }
}
