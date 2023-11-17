import 'package:flutter/material.dart';

class MessageTextfield extends StatelessWidget {
  final VoidCallback onTap;
  final TextEditingController controller;
  final ValueChanged<String>? onSubmitted;
  final ValueChanged<String>? onChanged;
  final String replyingText;
  const MessageTextfield(
      {super.key,
      required this.onTap,
      required this.controller,
      required this.onChanged,
      this.onSubmitted,
      required this.replyingText});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 650),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          color: const Color(0xfff5f5f5),
          borderRadius: replyingText.isEmpty
              ? BorderRadius.circular(50)
              : BorderRadius.circular(8)),
      child: Column(
        children: [
          replyingText.isEmpty
              ? const SizedBox.shrink()
              : Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(8)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                            alignment: Alignment.topRight,
                            child: InkWell(
                                onTap: () {},
                                child: const Icon(Icons.clear, size: 15))),
                        const Text(
                          'Victor',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        const Text('replyingText'),
                      ],
                    ),
                  ),
                ),
          SizedBox(
            height: 50,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    onChanged: onChanged,
                    textInputAction: TextInputAction.send,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500),
                    onSubmitted: onSubmitted,
                    textCapitalization: TextCapitalization.sentences,
                    decoration: InputDecoration(
                        hintText: 'Message...',
                        fillColor: const Color(0xfff5f5f5),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(50)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(50))),
                  ),
                ),
                IconButton(
                    onPressed: onTap,
                    icon: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Image.asset(
                        'assets/images/send.png',
                        color: controller.text.isEmpty
                            ? Colors.grey
                            : Colors.black,
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
/*

 IconButton(
                  onPressed: onTap,
                  icon: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Image.asset(
                      'assets/images/send.png',
                      color:
                          controller.text.isEmpty ? Colors.grey : Colors.black,
                    ),
                  )),


 alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xfff5f5f5),
        borderRadius: BorderRadius.circular(50),
      ),

*/