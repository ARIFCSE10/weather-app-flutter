import 'package:flutter/material.dart';

class ResponseErrorWidget extends StatelessWidget {
  const ResponseErrorWidget({Key? key, required this.onRetry})
      : super(key: key);
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Something went wrong',
            style: TextStyle(color: Colors.redAccent, fontSize: 18),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: onRetry,
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}
