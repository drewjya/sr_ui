// class SecondPercobaan extends StatelessWidget {
//   const SecondPercobaan({
//     super.key,
//     required this.scrollController,
//   });

//   final ScrollController scrollController;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(top: context.top),
//       child: NestedScrollView(
//           physics: AlwaysScrollableScrollPhysics(
//             parent: BouncingScrollPhysics(),
//           ),
//           // controller: scrollController,
//           headerSliverBuilder: (context, innerBoxIsScrolled) {
//             return [
//               SliverPersistentHeader(
//                 pinned: true,
//                 floating: false,
//                 delegate: PersistentHeader(
//                   child: HomeAppbar(),
//                   maxExtend: 64,
//                   minExtend: 64,
//                 ),
//               ),
//               CupertinoSliverRefreshControl(
//                 onRefresh: () async {
//                   await Future.delayed(Duration(milliseconds: 5000), () {});
//                   log("Refresh Profile");
//                 },
//                 builder: (context, refreshState, pulledExtent,
//                     refreshTriggerPullDistance, refreshIndicatorExtent) {
//                   return Padding(
//                     padding: const EdgeInsets.only(top: 100),
//                     child: Center(child: CircularProgressIndicator()),
//                   );
//                 },
//               ),
//               SliverPersistentHeader(
//                 pinned: true,
//                 floating: false,
//                 delegate: PersistentHeader(
//                   maxExtend: 230,
//                   minExtend: 210,
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(vertical: 20),
//                     child: PortofolioCard(
//                       controller: scrollController,
//                     ),
//                   ),
//                 ),
//               ),
//             ];
//           },
//           body: RefreshIndicator(
//             onRefresh: () async {
//               log("Refresh List");
//             },
//             child: Container(
//               decoration: ShapeDecoration(
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.vertical(
//                     top: Radius.circular(20),
//                   ),
//                 ),
//                 color: context.appColor.backgroundCard,
//               ),
//               child: Builder(
//                 builder: (context) {
//                   return CustomScrollView(
//                     physics: AlwaysScrollableScrollPhysics(
//                       parent: BouncingScrollPhysics(),
//                     ),
//                     controller: scrollController,
//                     slivers: [
//                       SliverPersistentHeader(
//                         pinned: true,
//                         floating: false,
//                         delegate: PersistentHeader(
//                           maxExtend: 72,
//                           minExtend: 72,
//                           child: Container(
//                             height: 72,
//                             width: double.infinity,
//                             padding: EdgeInsets.only(
//                               top: 15,
//                               left: 20,
//                               bottom: 15,
//                             ),
//                             decoration: ShapeDecoration(
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.vertical(
//                                   top: Radius.circular(20),
//                                 ),
//                               ),
//                               color: context.appColor.backgroundCard,
//                             ),
//                             child: ListView.builder(
//                               itemCount: 5,
//                               scrollDirection: Axis.horizontal,
//                               itemBuilder: (context, index) {
//                                 final items = [
//                                   "Watchlist",
//                                   "My Stocks",
//                                   "Top Gainers",
//                                   "Top Losers",
//                                   "Top Volume"
//                                 ];
//                                 return Container(
//                                   padding: EdgeInsets.symmetric(
//                                     horizontal: 15,
//                                     vertical: 10,
//                                   ),
//                                   decoration: BoxDecoration(
//                                       border: Border(
//                                     bottom: BorderSide(
//                                       color: index == 0
//                                           ? context.appColor.primary
//                                           : context.appColor.divider,
//                                     ),
//                                   )),
//                                   child: VText(
//                                     items[index],
//                                     color: index == 0
//                                         ? Colors.white
//                                         : context.appColor.grey,
//                                     fontSize: 16,
//                                     fontWeight: index == 0
//                                         ? FontWeight.bold
//                                         : FontWeight.w500,
//                                   ),
//                                 );
//                               },
//                             ),
//                           ),
//                         ),
//                       ),
//                       SliverList.builder(
//                         itemBuilder: (context, index) => ListTile(
//                           title: Text("Index $index"),
//                         ),
//                         itemCount: 20,
//                       ),
//                     ],
//                   );
//                 },
//               ),
//             ),
//           )),
//     );
//   }
// }

// class Percobaan1 extends StatelessWidget {
//   const Percobaan1({
//     super.key,
//     required this.scrollController,
//     required this.maxExtend,
//   });

//   final ScrollController scrollController;
//   final ValueNotifier<double> maxExtend;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         // controller: scrollController,
//         children: [
//           Gap(context.top),
//           HomeAppbar(),
//           Gap(20),
//           Expanded(
//             child: RefreshIndicator(
//               onRefresh: () async {},
//               child: CustomScrollView(
//                 controller: scrollController,
//                 physics: AlwaysScrollableScrollPhysics(
//                     parent: BouncingScrollPhysics()),
//                 slivers: [
//                   SliverPersistentHeader(
//                     pinned: true,
//                     floating: false,
//                     delegate: PersistentHeader(
//                       minExtend: 330,
//                       child: Column(
//                         children: [
//                           PortofolioCard(
//                             controller: scrollController,
//                           ),
//                           Gap(20),
//                           Container(
//                             height: 72,
//                             width: double.infinity,
//                             padding:
//                                 EdgeInsets.only(top: 15, left: 20, bottom: 15),
//                             decoration: ShapeDecoration(
//                               color: context.appColor.backgroundCard,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.vertical(
//                                   top: Radius.circular(30),
//                                 ),
//                               ),
//                             ),
//                             child: ListView.builder(
//                               itemCount: 5,
//                               scrollDirection: Axis.horizontal,
//                               itemBuilder: (context, index) {
//                                 final items = [
//                                   "Watchlist",
//                                   "My Stocks",
//                                   "Top Gainers",
//                                   "Top Losers",
//                                   "Top Volume"
//                                 ];
//                                 return Container(
//                                   padding: EdgeInsets.symmetric(
//                                     horizontal: 15,
//                                     vertical: 10,
//                                   ),
//                                   decoration: BoxDecoration(
//                                       border: Border(
//                                     bottom: BorderSide(
//                                       color: index == 0
//                                           ? context.appColor.primary
//                                           : context.appColor.divider,
//                                     ),
//                                   )),
//                                   child: VText(
//                                     items[index],
//                                     color: index == 0
//                                         ? Colors.white
//                                         : context.appColor.grey,
//                                     fontSize: 16,
//                                     fontWeight: index == 0
//                                         ? FontWeight.bold
//                                         : FontWeight.w500,
//                                   ),
//                                 );
//                               },
//                             ),
//                           ),
//                         ],
//                       ),
//                       maxExtend: maxExtend.value,
//                     ),
//                   ),
//                   SliverList(
//                       delegate: SliverChildListDelegate(List.generate(
//                           100,
//                           (e) => ListTile(
//                                 title: Text("Index $e"),
//                               ))))
//                 ],
//               ),
//             ),
//           ),

//           // SliverList(
//           //     delegate: SliverChildListDelegate([
//           //   ...List.generate(
//           //     100,
//           //     (index) {
//           //       return ListTile(
//           //         title: Text("$index Ties"),
//           //       );
//           //     },
//           //   )
//           // ],
//           // ),
//           // ),
//         ],
//       ),
//     );
//   }
// }
