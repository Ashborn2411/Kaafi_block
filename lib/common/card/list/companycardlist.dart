import '/exports/data_paths.dart';

import 'package:flutter/material.dart';

import '../../../data/models/courses_data_class.dart';
import '../shopcard.dart';

class ShopCardList extends StatefulWidget {
  const ShopCardList({
    super.key,
    required this.autoscroll,
    this.isSemibold = false,
    this.applyrating = false,
    required this.list,
  });

  final bool autoscroll;
  final bool isSemibold;
  final bool applyrating;
  final List<Course> list;

  @override
  State<ShopCardList> createState() => _ShopCardListState();
}

class _ShopCardListState extends State<ShopCardList> {
  late final ScrollController _scrollController;
  bool _autoscroll = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _autoscroll = widget.autoscroll;
    if (_autoscroll) {
      _scheduleScrollLoop();
    }
  }

  @override
  void didUpdateWidget(covariant ShopCardList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.autoscroll != widget.autoscroll) {
      _autoscroll = widget.autoscroll;
      if (_autoscroll) {
        _scheduleScrollLoop();
      }
    }
  }

  Future<void> _scheduleScrollLoop() async {
    await Future.delayed(const Duration(milliseconds: 500));

    while (mounted && _autoscroll) {
      final maxScrollExtent = _scrollController.position.maxScrollExtent;
      if (maxScrollExtent > 0) {
        await _scrollController.animateTo(
          maxScrollExtent,
          duration: const Duration(seconds: 20),
          curve: Curves.linear,
        );
        if (!mounted || !_autoscroll) break;
        await _scrollController.animateTo(
          0.0,
          duration: const Duration(seconds: 20),
          curve: Curves.easeIn,
        );
      } else {
        await Future.delayed(const Duration(seconds: 1));
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: ListView.separated(
        shrinkWrap: true,
        controller: _scrollController,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        scrollDirection: Axis.horizontal,
        cacheExtent: 5,
        itemBuilder: (context, index) => ShopCard(
          isnetworkimg: true,
          imgurl: widget.list[index].thumbnail,
          title: widget.list[index].title,
        ),
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemCount: widget.list.length,
      ),
    );
  }
}
