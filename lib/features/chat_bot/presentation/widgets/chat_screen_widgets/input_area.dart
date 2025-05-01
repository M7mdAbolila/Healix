import 'package:flutter/material.dart';

class InputArea extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSend;
  final VoidCallback onImagePick;

  const InputArea({
    super.key,
    required this.controller,
    required this.onSend,
    required this.onImagePick,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Color.fromARGB(23, 255, 48, 48),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: controller,
              onFieldSubmitted: (_) => onSend(),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xffFF3030)),
                  borderRadius: BorderRadius.circular(50),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xffFF3030)),
                  borderRadius: BorderRadius.circular(50),
                ),
                label: const Text("Ask Healix..."),
              ),
            ),
          ),
          const SizedBox(width: 5),
          IconButton(
            icon: const Icon(Icons.image),
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(const Color(0xffFF3030)),
              foregroundColor: WidgetStateProperty.all(Colors.white),
              shape: WidgetStateProperty.all(const CircleBorder()),
            ),
            onPressed: onImagePick,
          ),
          const SizedBox(width: 5),
          IconButton(
            icon: const Icon(Icons.send),
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(const Color(0xffFF3030)),
              foregroundColor: WidgetStateProperty.all(Colors.white),
              shape: WidgetStateProperty.all(const CircleBorder()),
            ),
            onPressed: onSend,
          ),
        ],
      ),
    );
  }
}
