import 'package:flutter/material.dart';

class LoaderWidget extends StatelessWidget {
  const LoaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          CircularProgressIndicator.adaptive(),
          SizedBox(height: 16),
          Text(
            'Fetching weather...',
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
