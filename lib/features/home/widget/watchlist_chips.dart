// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:sr_ui/core/core.dart';

final selectedWatchlistProvider = StateProvider<String>((ref) {
  return "Wathclist 1";
});

class WatchlistChips extends StatefulHookWidget {
  const WatchlistChips({
    super.key,
  });

  @override
  State<WatchlistChips> createState() => _WatchlistChipsState();
}

class _WatchlistChipsState extends State<WatchlistChips> {
  late MenuController menuController;
  List<String> dummy = [];
  @override
  void initState() {
    dummy = List.generate(
      10,
      (index) => "Wathclist ${index + 1}",
    );
    menuController = MenuController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget proxyDecorator(Widget child, int index, Animation<double> animation) {
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget? child) {
        log("$child");
        final double animValue = Curves.easeInOut.transform(animation.value);
        final double elevation = lerpDouble(0, 6, animValue)!;
        return Material(
          elevation: elevation,
          shadowColor: context.color.backgroundCard.withOpacity(0.1),
          child: child,
        );
      },
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDragged = useState(false);
    return Container(
      height: (34).sp,
      color: context.color.backgroundCard,
      child: Row(
        children: [
          Gap(20.sp),
          InkWell(
            onTap: () {
              context.showBottomSheet(
                constraints: BoxConstraints(),
                builder: (context) => DraggableScrollableSheet(
                    expand: false,
                    maxChildSize: 0.5, // Half screen max height
                    minChildSize: 0.45, // Minimum when there's little content
                    initialChildSize: 0.45,
                    builder: (context, scrollController) {
                      return CreateWatchlistSheet();
                    }),
              );
            },
            child: CircleAvatar(
              backgroundColor: context.color.primary,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Gap(8.sp),
          Expanded(
            child: ReorderableListView.builder(
              physics: BouncingScrollPhysics(),
              onReorder: (oldIndex, newIndex) {
                final currList = dummy;

                if (oldIndex < newIndex) {
                  newIndex -= 1;
                }

                final item = currList.removeAt(oldIndex);
                currList.insert(newIndex, item);
                dummy = [];
                setState(() {});
                dummy = currList;
                isDragged.value = false;
                setState(() {});
              },
              proxyDecorator: proxyDecorator,
              buildDefaultDragHandles: false,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ).copyWith(left: 0),
              itemCount: dummy.length,
              itemBuilder: (context, index) {
                final item = dummy[index];
                // return Gap(8.sp);
                return Consumer(
                  key: Key(item),
                  builder: (context, ref, child) {
                    return WatchlistChipItem(
                      index: index,
                      item: item,
                      onDoubleTap: () {
                        log("Doble click");
                        isDragged.value = false;
                      },
                      onTapDelete: () {
                        context.showBottomSheet(
                          constraints: BoxConstraints(),
                          builder: (context) => DraggableScrollableSheet(
                              expand: false,
                              maxChildSize: 0.4, // Half screen max height
                              minChildSize:
                                  0.4, // Minimum when there's little content
                              initialChildSize: 0.4,
                              builder: (context, scrollController) {
                                return DeleteSheet(
                                  message:
                                      "Do you really want to delete your\n$item ?",
                                );
                              }),
                        );
                      },
                      isDragged: isDragged.value,
                      onDragClick: () {
                        isDragged.value = true;
                      },
                      onTap: () {
                        log("CLICK ${DateTime.now()}");
                        if (isDragged.value) {
                          isDragged.value = false;
                          return;
                        }
                        ref
                            .read(selectedWatchlistProvider.notifier)
                            .update((state) => item);
                        log("CLICK ${DateTime.now()}");
                      },
                      end: index == dummy.length - 1,
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class WatchlistChipItem extends ConsumerWidget {
  final int index;
  final String item;

  final bool isDragged;
  final VoidCallback onTap;
  final VoidCallback onDoubleTap;
  final bool end;
  final VoidCallback onTapDelete;
  final VoidCallback onDragClick;
  const WatchlistChipItem({
    Key? key,
    required this.index,
    required this.item,
    required this.onTapDelete,
    required this.onDoubleTap,
    required this.isDragged,
    required this.onTap,
    required this.end,
    required this.onDragClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final active = ref.watch(selectedWatchlistProvider.select(
      (value) => value == item,
    ));
    log("REBUILD $item");
    log("REBUILD ${DateTime.now()}");
    return Container(
      color: context.color.backgroundCard,
      padding: EdgeInsets.only(right: end ? 0 : 8.sp),
      key: Key(item),
      child: MenuAnchor(
        alignmentOffset: Offset(5.sp, 2.5.sp),
        builder: (context, controller, child) {
          return GestureDetector(
            onTap: onTap,
            onDoubleTap: () {
              onDoubleTap();
              onTap();
            },
            child: AnimatedContainer(
              duration: Durations.short2,
              padding: EdgeInsets.symmetric(
                horizontal: 8.sp,
              ),
              decoration: BoxDecoration(
                color: active && !isDragged
                    ? context.color.chipFill
                    : Colors.black,
                borderRadius: BorderRadius.circular(20),
                border: active && !isDragged
                    ? Border.all(
                        color: context.color.primary,
                      )
                    : null,
              ),
              child: Row(
                children: [
                  Gap(6.sp),
                  AnimatedDefaultTextStyle(
                    duration: Durations.short2,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: active && !isDragged
                          ? FontWeight.bold
                          : FontWeight.w500,
                    ),
                    child: VText(
                      item,
                    ),
                  ),
                  if (isDragged)
                    ReorderableDragStartListener(
                      child: GestureDetector(
                        onDoubleTap: onDoubleTap,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 6.sp,
                          ),
                          child: Assets.icon.drag.svg(),
                        ),
                      ),
                      index: index,
                    )
                  else if (active)
                    GestureDetector(
                      onTap: () {
                        if (controller.isOpen) {
                          controller.close();
                        } else {
                          controller.open();
                        }
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 6.sp,
                        ),
                        child: Assets.icon.more.svg(),
                      ),
                    )
                  else
                    Gap(6.sp)
                ],
              ),
            ),
          );
        },
        style: MenuStyle(
            shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(
              color: Color(0xffFFFFFF).withOpacity(0.1),
              width: 3.sp,
            ),
          ),
        )),
        menuChildren: [
          MenuItemButton(
            child: VMenuItem(
              asset: Assets.icon.editWatchlist,
              label: "EDIT",
            ),
            onPressed: () {
              ref.router.push(Routes.goToWatchlist(item));
            },
          ),
          Divider(
            height: 1.sp,
            thickness: 2,
            color: Color(0xffFFFFFF).withOpacity(0.1),
          ),
          MenuItemButton(
            child: VMenuItem(
              asset: Assets.icon.drag,
              label: "DRAG",
            ),
            onPressed: onDragClick,
          ),
          Divider(
            height: 1.sp,
            thickness: 2,
            color: Color(0xffFFFFFF).withOpacity(0.1),
          ),
          MenuItemButton(
            onPressed: onTapDelete,
            child: VMenuItem(
              asset: Assets.icon.trash,
              label: "DELETE",
            ),
          ),
        ],
      ),
    );
  }
}

class VMenuItem extends StatelessWidget {
  final String label;

  final SvgGenImage asset;
  const VMenuItem({
    Key? key,
    required this.label,
    required this.asset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 14.sp, vertical: 8.sp),
      child: Row(
        children: [
          asset.svg(
            height: 24.sp,
            width: 24.sp,
          ),
          Gap(5.sp),
          VText(
            label,
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }
}
