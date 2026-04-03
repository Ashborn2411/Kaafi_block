import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../feature/screens/shop/home/bloc/home_cubit.dart';
import '../../feature/screens/shop/home/bloc/home_state.dart';
import '/exports/data_paths.dart';
import 'package:flutter/material.dart';

class HomePageCard extends StatelessWidget {
  const HomePageCard({
    super.key,
    this.title = '',
    this.subtitle = '',
    this.onTap,
    this.color = Colors.white,
    this.textcolor = Colors.black,
    this.autoscroll = false,
    this.showall = true,
    this.applyrating = false,
    this.isSemibold = false,
  });

  final String title;
  final String subtitle;
  final VoidCallback? onTap;
  final Color color;
  final Color textcolor;
  final bool autoscroll;
  final bool showall;
  final bool applyrating;
  final bool isSemibold;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final list = (state is HomeLoaded) ? state.data.courselist : <Course>[];
        return Container(
          color: color,
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          color: textcolor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        subtitle,
                        style: TextStyle(
                          color: textcolor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  if (showall) ShowAllButton(ontap: onTap),
                ],
              ),
              const SizedBox(height: 10),
              ProductCardList(
                autoscroll: autoscroll,
                isSemibold: isSemibold,
                applyrating: applyrating,
                list: list,
              ),
            ],
          ),
        );
      },
    );
  }
}

class ProductCardList extends StatefulWidget {
  const ProductCardList({
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
  State<ProductCardList> createState() => _ProductCardListState();
}

class _ProductCardListState extends State<ProductCardList> {
  late final ScrollController _scrollController = ScrollController();
  Timer? _scrollTimer;

  @override
  void initState() {
    super.initState();
    if (widget.autoscroll) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _startAutoscroll();
      });
    }
  }

  void _startAutoscroll() async {
    if (!mounted) return;

    // Simple autoscroll logic: scroll to end, then back to start
    while (mounted && widget.autoscroll) {
      if (_scrollController.hasClients) {
        final maxScroll = _scrollController.position.maxScrollExtent;
        if (maxScroll > 0) {
          await _scrollController.animateTo(
            maxScroll,
            duration: const Duration(seconds: 20),
            curve: Curves.linear,
          );
          if (!mounted) break;
          await _scrollController.animateTo(
            0.0,
            duration: const Duration(seconds: 20),
            curve: Curves.easeIn,
          );
        } else {
          await Future.delayed(const Duration(seconds: 1));
        }
      } else {
        await Future.delayed(const Duration(seconds: 1));
      }
    }
  }

  @override
  void dispose() {
    _scrollTimer?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return SizedBox(
      height: h * .26,
      child: ListView.separated(
        shrinkWrap: true,
        controller: _scrollController,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        scrollDirection: Axis.horizontal,
        cacheExtent: 10,
        itemBuilder: (context, index) => ProductCard(
          applyrating: widget.applyrating,
          isSemibold: widget.isSemibold,
          title: widget.list[index].title,
          subtitle: widget.list[index].instructorName,
          amount: '',
          reduced: false,
          newprice: widget.list[index].price.toString(),
          price: widget.list[index].price.toString(),
          imgurl: widget.list[index].thumbnail,
          isnetworkimg: true,
          id: widget.list[index].courseId,
          list: widget.list,
        ),
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemCount: widget.list.length,
      ),
    );
  }
}
