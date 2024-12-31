import 'package:flutter/material.dart';
import 'package:medcall/util/color.dart';

class FAQItem {
  final String question;
  final String answer;

  FAQItem({required this.question, required this.answer});
}

class FAQWidget extends StatefulWidget {
  final FAQItem faq;

  const FAQWidget({Key? key, required this.faq}) : super(key: key);

  @override
  State<FAQWidget> createState() => _FAQWidgetState();
}

class _FAQWidgetState extends State<FAQWidget> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: const LinearGradient(
          colors: [ScreenColor.background, Colors.white70],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent, splashColor: Colors.transparent,),
        child: InkWell(
          highlightColor: Colors.transparent,
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: ExpansionTile(
            dense: false,
            maintainState: false,
            title: Text(
              widget.faq.question,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            trailing: Icon(
              _isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
              color: ScreenColor.color6,
            ),
            childrenPadding: EdgeInsets.zero,
            children: [
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: const LinearGradient(
                    colors: [ScreenColor.background, Colors.white70],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Text(
                  widget.faq.answer,
                  style: const TextStyle(fontSize: 14.0, height: 1.5),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}