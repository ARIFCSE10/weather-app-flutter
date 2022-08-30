import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          const Icon(
            Icons.error,
            color: Colors.red,
            size: 48,
          ),
          const SizedBox(height: 32),
          Text(
            error,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Colors.redAccent.shade200,
                ),
          ),
          const SizedBox(height: 32),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            width: Get.width,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35),
                  ),
                  elevation: 0,
                  minimumSize: const Size.fromHeight(48),
                  primary: Colors.greenAccent.shade100,
                  shadowColor: Colors.transparent),
              onPressed: onRetry,
              child: Text('Retry',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.blueGrey.shade600,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
