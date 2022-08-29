import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/sliver_persistent_header.dart';

class SliverPinnedHeaderDelegate implements SliverPersistentHeaderDelegate {
  SliverPinnedHeaderDelegate({
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      alignment: Alignment.center,
      color: Colors.lightBlue,
      child: Text(
        "$overlapsContent , ${shrinkOffset ~/ 1}",
        style: const TextStyle(fontSize: 32.0),
      ),
    );
  }

  @override
  double get maxExtent => 180;

  @override
  double get minExtent => 120;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }

  @override
  PersistentHeaderShowOnScreenConfiguration? get showOnScreenConfiguration => null;

  @override
  FloatingHeaderSnapConfiguration? get snapConfiguration => null;

  @override
  OverScrollHeaderStretchConfiguration? get stretchConfiguration => null;

  @override
  TickerProvider? get vsync => null;
}
