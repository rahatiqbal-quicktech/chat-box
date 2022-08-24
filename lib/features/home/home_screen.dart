import 'package:chat_box/all_controllers.dart';
import 'package:chat_box/dummy/dummy_data.dart';
import 'package:chat_box/features/home/widgets/card_bottom_sheet_widget.dart';
import 'package:chat_box/shared/widgets/buy_coins_bottom_sheet.dart';
import 'package:chat_box/shared/widgets/horizontal_space.dart';
import 'package:chat_box/shared/widgets/vertical_space.dart';
import 'package:chat_box/utils/app_config.dart';
import 'package:chat_box/utils/service_config.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:swipe_cards/draggable_card.dart';
import 'package:swipe_cards/swipe_cards.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with AllControllers {
  MatchEngine _matchEngine = MatchEngine();
  final List<SwipeItem> _swipeItems = <SwipeItem>[];
  // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    swipeDataC.getSwipeList();

    swipeDataC.scrollController.addListener(() {
      if (swipeDataC.scrollController.position.atEdge) {
        if (swipeDataC.scrollController.position.pixels == 0) {
        } else {
          swipeDataC.loadSwipeData();
          print('Bottom');
          print(swipeDataC.pageNumber.value);
        }
      }
    });
    for (var i = 0; i < swipeDataC.swipeDataList.length; i++) {
      _swipeItems.add(SwipeItem(
          content: Container(
            color: Colors.red,
            height: 100,
            // width: double.infinity,
          ),
          likeAction: () {
            Fluttertoast.showToast(
              msg: "Liked",
              backgroundColor: themeColor,
            );
          },
          nopeAction: () {
            Fluttertoast.showToast(
              msg: "Nope",
              backgroundColor: themeColor,
            );
          },
          superlikeAction: () {
            Fluttertoast.showToast(
              msg: "Superlike",
              backgroundColor: themeColor,
            );
          },
          onSlideUpdate: (SlideRegion? region) async {
            debugPrint("Region $region");
          }));
    }
    _matchEngine = MatchEngine(swipeItems: _swipeItems);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size / 100;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [
            Image(
              image: AssetImage(appLogoIcon),
              height: 30,
            ),
            HorizontalSpace(width: 10),
            Text(
              "Chat Box",
              style: TextStyle(
                color: themeColor,
              ),
            ),
          ],
        ),
        // const Image(
        //   image: AssetImage(appLogoIcon),
        //   height: 40,
        // ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.payment,
              color: Colors.blue,
            ),
            onPressed: () {
              showModalBottomSheet<void>(
                isScrollControlled: true,
                isDismissible: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                backgroundColor: Colors.pink,
                context: context,
                builder: (BuildContext context) {
                  return BuyCoinsBottomSheet(size: size);
                },
              );
            },
          )
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        primary: false,
        // controller: swipeDataC.scrollController,
        children: [
          const VerticalSpace(height: 5),
          Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            width: Get.width,
            child: Stack(
              children: [
                SizedBox(
                  height: size.height * 80,
                  child: Obx(
                    () => swipeDataC.isLoading.value == true
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : swipeDataC.swipeDataList.isEmpty
                            ? Center(
                                child: Text('no data!!!'),
                              )
                            : SwipeCards(
                                matchEngine: _matchEngine,
                                onStackFinished: () {
                                  setState(() {
                                    swipeDataC.loadSwipeData();
                                    print(swipeDataC.swipeDataList.length);
                                  });
                                },
                                itemBuilder: (BuildContext context, int i) {
                                  final item = swipeDataC.swipeDataList[i];
                                  return Stack(
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        // child: _swipeItems[index].content,
                                        // width: 300,
                                        // height: 100,
                                        decoration: BoxDecoration(
                                          // color: Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.network(
                                            item.image1 == null
                                                ? image
                                                : imageBaseUrl +
                                                    '/' +
                                                    item.image1.toString(),
                                            height: Get.height,
                                            fit: BoxFit.fitHeight,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: size.height * 10.9,
                                        child: SizedBox(
                                          width: size.width * 95,
                                          child: ListTile(
                                            // contentPadding: EdgeInsets.zero,
                                            horizontalTitleGap: 0,
                                            visualDensity: const VisualDensity(
                                                horizontal: 0, vertical: -1),
                                            leading: const Text(
                                              "Audrey Hepburn (90)",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 19,
                                              ),
                                            ),
                                            trailing: IconButton(
                                                onPressed: () {
                                                  Get.bottomSheet(
                                                    CardBottomSheetWidget(
                                                        size: size),
                                                  );
                                                },
                                                icon: const Icon(
                                                  Icons.info,
                                                  color: Colors.white,
                                                )),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                                upSwipeAllowed: true,
                                fillSpace: true,
                              ),
                  ),
                ),
                Positioned(
                  bottom: size.height * 3,
                  child: Container(
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          width: Get.size.width * 0.9,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 45,
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.grey.shade800,
                                ),
                                child: const Icon(
                                  Icons.replay_outlined,
                                  color: Colors.orange,
                                ),
                              ),
                              Container(
                                height: 45,
                                padding: const EdgeInsets.only(
                                  left: 30,
                                  right: 30,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.grey.shade800,
                                ),
                                child: Icon(
                                  Icons.cancel_outlined,
                                  color: Colors.grey.shade300,
                                ),
                              ),
                              Container(
                                height: 45,
                                padding: const EdgeInsets.only(
                                  left: 30,
                                  right: 30,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.grey.shade800,
                                ),
                                child: const Icon(
                                  Icons.favorite,
                                  color: themeColor,
                                ),
                              ),
                              Container(
                                height: 45,
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.grey.shade800,
                                ),
                                child: Icon(
                                  Icons.star_rounded,
                                  color: Colors.blue.shade400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
