import 'package:flutter/material.dart';
import 'package:tma_test/ui/components/close_button.dart';

class DragArea extends StatelessWidget {
  final DraggableScrollableController draggableCntroller;
  final ScrollController scrollController;
  const DragArea({
    super.key,
    required this.draggableCntroller,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      child: AppCloseButton(
        onTap: () {},
        controller: draggableCntroller,
      ),
    );
  }
}
