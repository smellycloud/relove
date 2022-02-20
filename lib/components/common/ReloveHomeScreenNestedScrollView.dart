import 'package:flutter/material.dart';
import 'package:relove/components/common/ReloveSliverAppBar.dart';

class ReloveHomeScreenNestedScrollView extends StatelessWidget {
  const ReloveHomeScreenNestedScrollView({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          const ReloveSliverAppBar(),
        ];
      },
      body: child
    );
  }
}

// CustomScrollView(
// slivers: [
// SliverList(
// delegate: SliverChildListDelegate(
// children,
// ),
// ),
// ],
// ),