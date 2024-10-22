// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:sr_ui/core/core.dart';

class VPanelItem {
  final String? id;
  final String title;
  final List<String> items;
  VPanelItem({
    this.id,
    required this.title,
    required this.items,
  });

  @override
  bool operator ==(covariant VPanelItem other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        listEquals(other.items, items);
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ items.hashCode;
}

class VExpansionPanelList extends StatefulWidget {
  final List<VPanelItem> items;
  final bool multiselect;
  final String? selected;
  const VExpansionPanelList({
    Key? key,
    required this.items,
    this.selected,
    this.multiselect = false,
  }) : super(key: key);

  @override
  State<VExpansionPanelList> createState() => _VExpansionPanelListState();
}

class _VExpansionPanelListState extends State<VExpansionPanelList> {
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
    return Column(
        children: widget.items.mapIndexed(
      (index, e) {
        return VExpansionPanel(
          onTap: () => _onTap(e, index),
          expanded: _selected(e, index),
          title: e.title,
          items: e.items,
        );
      },
    ).toList());
  }
}
