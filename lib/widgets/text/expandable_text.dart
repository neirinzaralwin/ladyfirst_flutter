import 'package:flutter/material.dart';

class ExpandableText extends StatefulWidget {
  final String text;

  const ExpandableText({super.key, required this.text});

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  late String _visibleText;
  late String _hiddenText;

  @override
  void initState() {
    super.initState();
    _splitText();
  }

  bool get isExceedWordsLimit => widget.text.characters.length > 50;

  void _splitText() {
    // Handle emoji and new lines
    final characters = widget.text.characters;
    final words =
        characters.toString().split(' '); // Split by words, retaining emojis
    if (isExceedWordsLimit) {
      _visibleText = words.take(50).join(' ');
      _hiddenText = words.skip(50).join(' ');
    } else {
      _visibleText = widget.text;
      _hiddenText = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedSize(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: Stack(
            children: [
              Text.rich(
                TextSpan(
                  text: _isExpanded ? widget.text : _visibleText,
                  style: const TextStyle(height: 1.5),
                ),
              ),
              if (!_isExpanded && _hiddenText.isNotEmpty)
                Positioned.fill(
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.white.withValues(alpha: 0),
                          Colors.white,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
        if (_hiddenText.isNotEmpty && isExceedWordsLimit)
          Align(
            alignment: Alignment.centerRight,
            child: TextButton.icon(
              onPressed: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
              label: Text(
                _isExpanded ? 'See less' : 'See more',
              ),
              icon: Icon(
                _isExpanded
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down,
              ),
            ),
          ),
      ],
    );
  }
}
