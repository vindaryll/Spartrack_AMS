import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class WysiwygEditor extends StatefulWidget {
  final QuillController controller;
  final double height;
  final bool readOnly;

  const WysiwygEditor({
    super.key,
    required this.controller,
    this.height = 200,
    this.readOnly = false,
  });

  @override
  State<WysiwygEditor> createState() => _WysiwygEditorState();
}

class _WysiwygEditorState extends State<WysiwygEditor> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        QuillSimpleToolbar(controller: widget.controller),
        const SizedBox(height: 8),
        Container(
          height: widget.height,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(3),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: QuillEditor.basic(
              controller: widget.controller,
              focusNode: _focusNode,
            ),
          ),
        ),
      ],
    );
  }
} 