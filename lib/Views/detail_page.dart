import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:grocery_application/Controller/controller.dart';

import '../Extension/custom_button.dart';

class DetailPage extends StatelessWidget {
  DetailPage({Key? key, required this.index}) : super(key: key);
  int index;
  Controller controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    String description = controller.groceryList[index].description;
    return Obx(() => Scaffold(
          backgroundColor: Colors.lightBlueAccent.shade100,
          appBar: AppBar(
            title: const Text(
              "প্রোডাক্ট ডিটেইল",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
            ),
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_ios_rounded,
                color: Colors.black,
              ),
            ),
            automaticallyImplyLeading: true,
            backgroundColor: Colors.lightBlueAccent.shade100,
          ),
          body: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 0, left: 0, top: 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Form(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: TextFormField(
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                contentPadding:
                                    const EdgeInsets.fromLTRB(20.0, 0, 10.0, 0),
                                suffixIcon: const Icon(Icons.search),
                                hintText: 'কাঙ্খিত পণ্যটি খুজুন',
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(17))),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(13),
                                  bottomRight: Radius.circular(13),
                                )),
                            height: 200,
                            width: 50,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(18),
                            child: Container(
                                color: Colors.white,
                                width: 220,
                                height: 270,
                                child: Image.network(
                                  controller.groceryList[index].image,
                                )),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(13),
                                  bottomLeft: Radius.circular(13),
                                )),
                            height: 200,
                            width: 50,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(controller.groceryList[index].productName.toString(),
                          style: const TextStyle(
                              fontFamily: 'HindSiliguri',
                              fontWeight: FontWeight.bold,
                              fontSize: 18)),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          children: [
                            const Text("ব্র্যান্ড :",
                                style: TextStyle(
                                    fontFamily: 'HindSiliguri', fontSize: 14)),
                            Text(
                                controller.groceryList[index].brand.name
                                    .toString(),
                                style: const TextStyle(
                                    fontFamily: 'HindSiliguri',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15)),
                            const SizedBox(
                              width: 5,
                            ),
                            const Icon(
                              Icons.adjust_rounded,
                              size: 15,
                              color: Colors.red,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text("ডিস্ট্রিবিউটর :",
                                style: TextStyle(
                                    fontFamily: 'HindSiliguri', fontSize: 14)),
                            Expanded(
                              child: Text(
                                controller.groceryList[index].seller.toString(),
                                style: const TextStyle(
                                    fontFamily: 'HindSiliguri',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15),
                                maxLines: 1,
                                overflow: TextOverflow.visible,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Stack(
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 15),
                                child: Container(
                                    width: double.infinity,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(13),
                                      border: Border.all(color: Colors.black),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            const Text('ক্রয়মূল্য',
                                                style: TextStyle(
                                                    fontFamily: 'HindSiliguri',
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18,
                                                    color: Colors.red)),
                                            Text(
                                                "৳"
                                                '${controller.groceryList[index].charge.sellingPrice.toString()}',
                                                style: const TextStyle(
                                                    color: Colors.red,
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            const Text('বিক্রয়মূল্য',
                                                style: TextStyle(
                                                    fontFamily: 'HindSiliguri',
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16)),
                                            Text(
                                              "৳"
                                              '${controller.groceryList[index].charge.currentCharge.toString()}',
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                            ),
                                          ],
                                        ),
                                        const DottedLine(
                                          direction: Axis.horizontal,
                                          dashGapLength: 4,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            const Text('লাভ',
                                                style: TextStyle(
                                                    fontFamily: 'HindSiliguri',
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 17)),
                                            Text(
                                              "৳"
                                              '${controller.groceryList[index].charge.profit.toString()}',
                                              style: const TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),
                              ),
                              const SizedBox(
                                height: 35,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 20,
                                ),
                                child: Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(left: 7),
                                        child: Text("বিস্তারিত",
                                            style: TextStyle(
                                                fontFamily: 'HindSiliguri',
                                                fontWeight: FontWeight.w700,
                                                fontSize: 15)),
                                      ),
                                      Html(data: description, style: {
                                        "span": Style(
                                            color: Colors.black,
                                            fontSize: FontSize.medium),
                                      }),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          Positioned(
                              top: 65,
                              left: 158,
                              child: GestureDetector(
                                onTap: () {
                                  print("এটি কিনুন");
                                },
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: CustomPaint(
                                      painter: CustomButton(),
                                      child: Container(
                                        color: Colors.yellow.shade400,
                                        width: 80,
                                        height: 76,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            Text(
                                              "এটি",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              "কিনুন",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
