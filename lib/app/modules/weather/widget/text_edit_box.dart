import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextEditBox extends StatelessWidget {
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
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return TextField(
      enabled: isEnabled,
      keyboardType: TextInputType.text,
      controller: textController,
      onTap: autofillHints.isEmpty
          ? null
          : () {
              Get.bottomSheet(
                ListView.builder(
                  itemCount: autofillHints.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        autofillHints[index],
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      onTap: () {
                        textController.text = autofillHints[index];
                        Get.back();
                      },
                    );
                  },
                ),
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                isScrollControlled: !isPortrait,
                enableDrag: false,
                ignoreSafeArea: false,
              );
            },
      maxLines: 1,
      showCursor: autofillHints.isEmpty ? true : false,
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(width: 1.5, color: Colors.black45),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(width: 0.5, color: Colors.black38),
        ),
        contentPadding: const EdgeInsets.all(8),
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.bodyText1,
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(width: 1, color: Colors.redAccent.shade200),
        ),
      ),
    );
  }
}
