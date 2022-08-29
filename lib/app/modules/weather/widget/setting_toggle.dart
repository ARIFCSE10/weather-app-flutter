import 'package:flutter/material.dart';

class SettingToggle extends StatefulWidget {
  const SettingToggle({
    Key? key,
    this.isChecked = false,
    required this.title,
    required this.onChange,
  }) : super(key: key);
  final bool isChecked;
  final String title;
  final VoidCallback onChange;

  @override
  State<SettingToggle> createState() => _SettingToggleState();
}

class _SettingToggleState extends State<SettingToggle> {
  bool _isChecked = false;

  @override
  void initState() {
    _isChecked = widget.isChecked;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Text(
          widget.title,
          style: Theme.of(context).textTheme.titleLarge!,
        ),
      ),
      onTap: () => setState(() {
        _isChecked = !_isChecked;
        widget.onChange.call();
      }),
      trailing: Switch.adaptive(
          value: _isChecked,
          onChanged: (bool toggle) {
            setState(() {
              _isChecked = toggle;
            });
            widget.onChange.call();
          }),
    );
  }
}
