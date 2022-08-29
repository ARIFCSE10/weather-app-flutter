import 'package:flutter/material.dart';

class ResponseErrorWidget extends StatelessWidget {
  const ResponseErrorWidget(
      {Key? key, required this.onRetry, this.error = 'Something went wrong'})
      : super(key: key);
  final VoidCallback? onRetry;
  final String error;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            error,
            style: Theme.of(context).textTheme.headline6,
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
