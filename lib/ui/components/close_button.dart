import 'package:flutter/material.dart';

class AppCloseButton extends StatefulWidget {
  final VoidCallback onTap;
  final DraggableScrollableController controller;
  const AppCloseButton(
      {super.key, required this.onTap, required this.controller});

  @override
  State<AppCloseButton> createState() => _AppCloseButtonState();
}

class _AppCloseButtonState extends State<AppCloseButton> {
  int _currentIndex = 1;

  @override
  void initState() {
    widget.controller.addListener(_updateCurrentIndex);
    super.initState();
  }

  void _closeSheet() {
    if (_currentIndex == 0) {
      Navigator.of(context).pop();
    } else {
      widget.controller.animateTo(
        0.1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _updateCurrentIndex() {
    double size = double.parse(widget.controller.size.toStringAsFixed(2));


    int newIndex;
    if (size == 0.10) {
      newIndex = 0;
    } else if (size == 0.50) {
      newIndex = 1;
    } else {
      newIndex = 2;
    }

    if (newIndex != _currentIndex) {
      setState(() {
        _currentIndex = newIndex;
      });
    }
  }

  @override
  void dispose() {
    widget.controller.removeListener(_updateCurrentIndex);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height / 10,
      color: _currentIndex == 0 ? Colors.grey : Colors.transparent,
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(top: 8, left: 16),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
          ),
          onPressed: _closeSheet,
          child: Icon(
            _currentIndex == 0 ? Icons.close : Icons.keyboard_arrow_down,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
