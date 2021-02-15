import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'page_header_widget.dart';
import 'theme.dart';

typedef SliverBlocsBuilder = List<Widget> Function(Key key);
typedef DrRefreshCallback = Future<void> Function(BuildContext context, {bool isForcedByUser});

class DrSliverPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final DrRefreshCallback modelRefresher;
  final SliverBlocsBuilder sliverBlocsBuilder;
  final Widget roundButtonIcon;
  final BuildContextCallback onTapRoundButton;

  const DrSliverPage({
    @required this.title,
    @required this.subtitle,
    @required this.modelRefresher,
    @required this.sliverBlocsBuilder,
    @required this.onTapRoundButton,
    this.roundButtonIcon,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    modelRefresher(context, isForcedByUser: false);

    return SafeArea(
      child:
          Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [Expanded(child: _buildContent(context))]),
    );
  }

  Widget _buildContent(BuildContext context) {
    return RefreshIndicator(
      displacement: 40 + DrSizes.pageHeaderSize,
      onRefresh: () => modelRefresher(context, isForcedByUser: true),
      child: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: DrColors.bgLight,
            pinned: true,
            stretch: true,
            snap: true,
            floating: true,
            flexibleSpace: _SliverPageHeaderWidget(
              title: title,
              subtitle: subtitle,
              maxHeight: DrSizes.pageHeaderSize,
              minHeight: DrSizes.pageHeaderSizeCollapsed,
              roundButtonIcon: roundButtonIcon,
              onTapRoundButton: onTapRoundButton,
            ),
            toolbarHeight: DrSizes.pageHeaderToolbarHeight,
            collapsedHeight: DrSizes.pageHeaderSizeCollapsed,
            expandedHeight: DrSizes.pageHeaderSize,
          ),
          ...sliverBlocsBuilder(key),
        ],
      ),
    );
  }
}

class _SliverPageHeaderWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final double maxHeight;
  final double minHeight;
  final Widget roundButtonIcon;
  final BuildContextCallback onTapRoundButton;

  const _SliverPageHeaderWidget({
    Key key,
    @required this.title,
    @required this.subtitle,
    @required this.maxHeight,
    @required this.minHeight,
    @required this.onTapRoundButton,
    this.roundButtonIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final expandRatio = _calculateExpandRatio(constraints);
        final animation = AlwaysStoppedAnimation(expandRatio);

        return PageHeaderWidget(
          title: title,
          subtitle: subtitle,
          animation: animation,
          icon: roundButtonIcon,
          onTapRoundButton: onTapRoundButton,
        );
      },
    );
  }

  double _calculateExpandRatio(BoxConstraints constraints) {
    var expandRatio = (constraints.maxHeight - minHeight) / (maxHeight - minHeight);

    if (expandRatio > 1.0) expandRatio = 1.0;
    if (expandRatio < 0.0) expandRatio = 0.0;

    return expandRatio;
  }
}
