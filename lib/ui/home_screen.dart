import 'package:flutter/material.dart';
import 'package:tma_test/ui/components/app_bottom_sheet.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: const Text(
            'TMA clone',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                enableDrag: false,
                isDismissible: false,
                context: context,
                isScrollControlled: true,
                useSafeArea: true,
                barrierColor: Colors.transparent,
                builder: (context) {
                  return AppBottomSheet(
                    statusBarHeight: MediaQuery.of(context).padding.top,
                  );
                },
              );
            },
            child: const Text('Show bottom sheet'),
          ),
        ),
      ),
    );
  }
}
