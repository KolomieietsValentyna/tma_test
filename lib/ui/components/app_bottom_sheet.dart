import 'package:flutter/material.dart';
import 'package:tma_test/ui/components/app_web_view.dart';
import 'package:tma_test/ui/components/drag_area.dart';

class AppBottomSheet extends StatefulWidget {
  final double statusBarHeight;
  const AppBottomSheet({required this.statusBarHeight, super.key});

  @override
  State<AppBottomSheet> createState() => _AppBottomSheetState();
}

class _AppBottomSheetState extends State<AppBottomSheet> {
  final DraggableScrollableController _controller =
      DraggableScrollableController();

  final List<double> _snapSizes = [0.1, 0.5, 1.0];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      shouldCloseOnMinExtent: false,
      controller: _controller,
      initialChildSize: 0.5,
      minChildSize: 0.1,
      maxChildSize: 1.0,
      snap: true,
      expand: false,
      snapSizes: _snapSizes,
      builder: (context, scrollController) {
        return Container(
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          child: Stack(
            children: [
              AppWebView(
                url: 'https://flutter.dev',
                statusBarHeight: widget.statusBarHeight,
              ),
              DragArea(
                scrollController: scrollController,
                draggableCntroller: _controller,
              ),
            ],
          ),
        );
      },
    );
  }
}
