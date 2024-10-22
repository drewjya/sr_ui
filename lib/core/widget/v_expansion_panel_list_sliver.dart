// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:sliver_tools/sliver_tools.dart';
import 'package:sr_ui/core/core.dart';

class VExpansionPanelListSliver extends StatefulWidget {
  final List<VPanelItem> items;
  final bool multiselect;
  final String? selected;
  final bool sticky;
  const VExpansionPanelListSliver({
    Key? key,
    required this.items,
    this.multiselect = false,
    this.selected,
    this.sticky = false,
  }) : super(key: key);

  @override
  State<VExpansionPanelListSliver> createState() =>
      _VExpansionPanelListSliverState();
}

class _VExpansionPanelListSliverState extends State<VExpansionPanelListSliver> {
  String? selected;
  List<String> selectedList = [];
  @override
  void initState() {
    selected = widget.selected;
    selectedList = widget.selected != null ? [widget.selected!] : [];
    super.initState();
  }

  bool _selected(VPanelItem item, int index) {
    if (widget.multiselect) {
      final findItem = selectedList.firstWhereOrNull(
          (element) => element == (item.id ?? (item.title + "$index")));
      return findItem != null;
    } else {
      return selected == (item.id ?? (item.title + "$index"));
    }
  }

  void _onTap(VPanelItem item, int index) {
    if (widget.multiselect) {
      if (_selected(item, index)) {
        var newList = [...selectedList];
        newList.remove((item.id ?? (item.title + "$index")));
        selectedList = [...newList];
        setState(() {});
      } else {
        selectedList.add((item.id ?? (item.title + "$index")));
        setState(() {});
      }
    } else {
      if (_selected(item, index)) {
        setState(() => selected = null);
      } else {
        setState(
          () => selected = (item.id ?? (item.title + "$index")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // return Column(
    //     children: widget.items.mapIndexed(
    //   (index, e) {
    //     return VExpansionPanel(
    //       onTap: () => _onTap(e, index),
    //       expanded: _selected(e, index),
    //       title: e.title,
    //       items: e.items,
    //     );
    //   },
    // ).toList());
    if (widget.sticky) {
      return MultiSliver(
          pushPinnedChildren: false,
          children: widget.items.mapIndexed(
            (index, e) {
              return VExpansionPanelSliver(
                pinned: true,
                onTap: () => _onTap(e, index),
                expanded: _selected(e, index),
                title: e.title,
                items: e.items,
              );
            },
          ).toList());
    }
    return SliverMainAxisGroup(
        slivers: widget.items.mapIndexed(
      (index, e) {
        return SliverToBoxAdapter(
          child: VExpansionPanel(
            onTap: () => _onTap(e, index),
            expanded: _selected(e, index),
            title: e.title,
            items: e.items,
          ),
        );
      },
    ).toList());
  }
}
