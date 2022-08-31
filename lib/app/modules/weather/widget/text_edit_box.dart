import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextEditBox extends StatefulWidget {
  const TextEditBox({
    Key? key,
    required this.textController,
    required this.hintText,
    this.isEnabled = true,
    this.autofillHints = const [],
  }) : super(key: key);
  final TextEditingController textController;
  final String hintText;
  final bool isEnabled;
  final List<String> autofillHints;

  @override
  State<TextEditBox> createState() => _TextEditBoxState();
}

class _TextEditBoxState extends State<TextEditBox> {
  late final List<String> autofillHints;

  @override
  void initState() {
    super.initState();
  }

  String? error;
  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: widget.isEnabled,
      keyboardType: TextInputType.text,
      controller: widget.textController,
      onChanged: (String value) {
        setState(() {
          if (value.trim().isEmpty) {
            error = '${widget.hintText} is required';
          } else {
            error = null;
          }
        });
      },
      onTap: widget.autofillHints.isEmpty
          ? null
          : () {
              Get.bottomSheet(
                ListView.builder(
                  itemCount: widget.autofillHints.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        widget.autofillHints[index],
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      onTap: () {
                        widget.textController.text =
                            widget.autofillHints[index];
                        Get.back();
                      },
                    );
                  },
                ),
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                isScrollControlled: false,
                enableDrag: false,
                ignoreSafeArea: false,
              );
            },
      maxLines: 1,
      showCursor: widget.autofillHints.isEmpty ? true : false,
      decoration: InputDecoration(
        prefixIcon: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
        ),
        prefixIconConstraints:
            const BoxConstraints(maxHeight: 48, maxWidth: 48),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(width: 1.5, color: Colors.black45),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(width: 0.5, color: Colors.black38),
        ),
        contentPadding: EdgeInsets.zero,
        hintText: widget.hintText,
        hintStyle: Theme.of(context).textTheme.bodyText1,
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(width: 1, color: Colors.redAccent.shade200),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(width: 0.5, color: Colors.redAccent.shade200),
        ),
        errorText: error,
        errorMaxLines: 1,
        errorStyle: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }
}
