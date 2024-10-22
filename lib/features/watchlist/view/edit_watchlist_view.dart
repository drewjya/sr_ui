// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:sliver_tools/sliver_tools.dart';
import 'package:sr_ui/core/core.dart';

class EditWatchlistView extends HookConsumerWidget {
  final String id;
  const EditWatchlistView({
    required this.id,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = useState(List.generate(100, (index) => "Item $index"));
    final selectedItem = useState(<String>[]);
    final selectAll = useState(false);
    return ScaffoldBasic(
      titleText: "EDIT WATCHLIST",
      onBack: () => ref.pop(),
      actions: [
        VDeleteButton(
          onTap: selectedItem.value.isNotEmpty
              ? () {
                  selectedItem.value = [];
                  selectAll.value = false;
                }
              : null,
        ),
        Gap(4.sp),
        VCheckbox(
          value: selectAll.value,
          onChange: (val) {
            selectAll.value = val;
            if (val) {
              selectedItem.value = item.value;
            } else {
              selectedItem.value = [];
            }
          },
        ),
      ],
      body: RefreshIndicator(
          onRefresh: () async {},
          child: Stack(
            children: [
              CustomScrollView(
                slivers: [
                  SliverPinnedHeader(
                    child: Padding(
                      padding: 20.horizontal.copyWith(bottom: 18.sp),
                      child: TextField(
                        decoration: InputDecoration(
                          fillColor: Colors.white.withOpacity(0.05),
                          hintText: "$id",
                          filled: true,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 15.sp,
                            vertical: 12.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SliverClip(
                    child: SliverReorderableList(
                      itemBuilder: (context, index) {
                        if (index == item.value.length) {
                          return Gap(
                            60.sp,
                            key: Key("$index"),
                          );
                        }
                        final curr = item.value[index];
                        final selected = selectedItem.value.firstWhereOrNull(
                          (element) => curr == element,
                        );
                        return EditWatchlistItem(
                          key: Key("$curr"),
                          selected: selected != null,
                          onChange: (value) {
                            if (selected != null) {
                              final item = [...selectedItem.value];
                              item.remove(curr);
                              log("${selectedItem.value}");
                              selectedItem.value = [];
                              selectedItem.value = item;
                              log("${selectedItem.value}");
                            } else {
                              selectedItem.value = [
                                ...selectedItem.value,
                                curr
                              ];
                            }
                            if (selectedItem.value.length ==
                                item.value.length) {
                              selectAll.value = true;
                            } else {
                              selectAll.value = false;
                            }
                          },
                          index: index,
                          isLast: index == item.value.length - 1,
                          item: curr,
                        );
                      },
                      itemCount: item.value.length + 1,
                      onReorder: (oldIndex, newIndex) {
                        return;
                      },
                    ),
                  )
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: 20.horizontal.copyWith(bottom: 15.sp),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Center(
                      child: Text("SAVE"),
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}

class EditWatchlistItem extends StatelessWidget {
  final String item;
  final int index;
  final bool isLast;
  final bool selected;
  final ValueChanged<bool> onChange;
  const EditWatchlistItem({
    Key? key,
    required this.item,
    required this.index,
    required this.isLast,
    required this.selected,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      key: Key(item),
      children: [
        VListTile(
          padding: EdgeInsets.symmetric(
            vertical: 10.sp,
            horizontal: 18.sp,
          ),
          leading: Padding(
            padding: EdgeInsets.only(right: 8.0.sp),
            child: VRow(
              gap: Gap(8.sp),
              children: [
                ReorderableDragStartListener(
                  child: Assets.icon.drag.svg(
                    height: 24.sp,
                    width: 24.sp,
                  ),
                  index: index,
                ),
                CircleAvatar(
                  radius: 25.r,
                  child: Image.network(
                    networkImage,
                  ),
                ),
              ],
            ),
          ),
          trailing: VCheckbox(
            value: selected,
            onChange: onChange,
          ),
          backgroundColor: Colors.transparent,
          title: VText("BBCA"),
          subtitle: VText("Digital Mediatama"),
        ),
        if (!isLast)
          Padding(
            padding: 18.horizontal,
            child: Divider(
              color: Colors.white.withOpacity(0.05),
              thickness: 2,
              height: 1,
            ),
          )
      ],
    );
  }
}
