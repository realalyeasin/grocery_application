import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:grocery_application/Bloc/data_bloc.dart';
import 'package:grocery_application/Bloc/data_event.dart';
import 'package:grocery_application/Bloc/data_state.dart';
import 'package:grocery_application/Controller/controller.dart';
import 'detail_page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  Controller controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.lightBlueAccent.shade100,
        body: BlocBuilder<DataBloc, DataState>(builder: (context, state) {
          if (state is DataInitialState) {
            context.read<DataBloc>().add(LoadDataEvent());
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is DataLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is DataLoadedState) {
            return HomeView();
          } else if (state is DataErrorState) {
            return const Center(
              child: Text("Something went wrong"),
            );
          }
          return const Center(
            child: Text('Unexpected Error'),
          );
        }),
      ),
    );
  }

  Widget HomeView() {
    return Obx(() => Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
              child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: TextFormField(
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                        suffixIcon: const Icon(Icons.search),
                        hintText: 'কাঙ্খিত পণ্যটি খুজুন',
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18))),
                  )),
            ),
            Expanded(
                child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: .6,
              shrinkWrap: true,
              children: List.generate(controller.groceryList.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(DetailPage(
                        index: index,
                      ));
                    },
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Container(
                                    height: 280,
                                    width: 170,
                                    decoration:
                                        BoxDecoration(color: Colors.white),
                                    child: Column(
                                      children: [
                                        Image.network(controller
                                            .groceryList[index].image),
                                        Padding(
                                          padding:
                                              EdgeInsets.only(left: 3, top: 1),
                                          child: Text(
                                            controller
                                                .groceryList[index].productName
                                                .toString(),
                                            style: TextStyle(
                                                fontFamily: 'HindSiliguri',
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14),
                                            maxLines: 2,
                                            overflow: TextOverflow.visible,
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 3, top: 1),
                                              child: Text('ক্রয়',
                                                  style: TextStyle(
                                                      fontFamily:
                                                          'HindSiliguri',
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 13,
                                                      color: Colors.black)),
                                            ),
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(top: 1),
                                                child: Text(
                                                  "৳"
                                                  '${controller.groceryList[index].charge.sellingPrice.toString()}',
                                                  style: TextStyle(
                                                      color: Colors.red,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 1),
                                              child: Text(
                                                  "৳"
                                                  '${controller.groceryList[index].charge.sellingPrice - 8}',
                                                  style: TextStyle(
                                                      color: Colors.red,
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      decoration: TextDecoration
                                                          .lineThrough)),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text('বিক্রয়',
                                                style: TextStyle(
                                                    fontFamily: 'HindSiliguri',
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 10)),
                                            Text(
                                                "৳"
                                                '${controller.groceryList[index].charge.sellingPrice.toString()}',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Text('লাভ',
                                                style: TextStyle(
                                                    fontFamily: 'HindSiliguri',
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 10)),
                                            Text(
                                                "৳"
                                                '${controller.groceryList[index].charge.profit.toString()}',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                    decoration: TextDecoration
                                                        .lineThrough)),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                controller.groceryList[index].stock != 0
                                    ? Container()
                                    : Positioned(
                                        right: 10,
                                        bottom: 130,
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(7),
                                            child: Container(
                                              height: 30,
                                              width: 70,
                                              color: Colors.red.shade200,
                                              child: Center(
                                                  child: Text(
                                                "স্টকে নেই",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.w600),
                                              )),
                                            ))),
                              ],
                            )
                          ],
                        ),
                        controller.groceryList[index].stock == 0
                            ? Container()
                            : Positioned(
                                right: 60,
                                top: 258,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Container(
                                    color: Colors.black,
                                    height: 45,
                                    width: 45,
                                    child: IconButton(
                                      onPressed: () {
                                        print("Added");
                                      },
                                      icon: Icon(Icons.add_circle,
                                          color: Colors.white),
                                    ),
                                  ),
                                )),
                      ],
                    ),
                  ),
                );
              }),
            )),
            Container(
              height: 20,
            )
          ],
        ));
  }
}
