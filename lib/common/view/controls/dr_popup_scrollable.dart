import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../theme.dart';

typedef ScrollableWidgetBuilder = Widget Function(BuildContext context, ScrollController parentScrollController);

class DrPopupScrollable extends StatefulWidget {
  final Widget header;
  final ScrollableWidgetBuilder builder;

  const DrPopupScrollable({
    Key key,
    @required this.header,
    @required this.builder,
  }) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<DrPopupScrollable> {
  ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            backgroundColor: DrColors.bgLight,
            pinned: true,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(DrSizes.popupRounding),
              topRight: const Radius.circular(DrSizes.popupRounding),
            )),
            flexibleSpace: widget.header,
            toolbarHeight: DrSizes.pageHeaderToolbarHeight,
            collapsedHeight: 64,
            expandedHeight: 64,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(DrSizes.screenPaddingStandard, 2, 0, DrSizes.screenPaddingStandard),
              child: widget.builder(context, _scrollController),
            ),
          ),
        ],
      ),
    );
  }
}
