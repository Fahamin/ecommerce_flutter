import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../providers/providers.dart';

class HomeScreen extends ConsumerStatefulWidget {
  HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final List<String> imgList = [
    'assets/images/banner1.png',
    'assets/images/banner2.png',
    'assets/images/banner3.png',
    'assets/images/banner4.png',
    'assets/images/banner5.png',
  ];

  List<String> btnCategories = [
    'Clothes',
    'Electronics',
    'Furniture',
    'Shoes',
    'Miscellaneous',
  ];

  int btnSelected = 0;

  String selectedCategory = 'General';

  @override
  Widget build(BuildContext context) {
    var productList = ref.watch(productProvider(btnSelected));
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: CarouselSlider(
              options: CarouselOptions(),
              items: imgList
                  .map((item) => Container(
                        child: Center(
                            child: Image.asset(item,
                                fit: BoxFit.cover, width: 300)),
                      ))
                  .toList(),
            ),
          ),
          Container(
            padding: EdgeInsets.all(5),
            height: 60,
            child: ListView.builder(
                itemCount: btnCategories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Container(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            primary: index == btnSelected
                                ? Colors.blueAccent
                                : Colors.grey),
                        onPressed: () {
                          btnSelected = index;
                          selectedCategory = btnCategories[index];
                          setState(() {});
                        },
                        child: Text(
                          btnCategories[index],
                          style: GoogleFonts.poppins(
                              fontSize: 13,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  );
                }),
          ),
          Center(
            child: Flexible(
                child: productList.when(
                    data: (data) {
                      return ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            var item = data.elementAt(index);
                            return ListTile(
                              title: Text(item.title.toString()),
                              leading: Image.network(item.images!.first.toString()),
                            );
                          });
                    },
                    error: (error, str) => Center(child: Text("Error")),
                    loading: () => Center(child: CircularProgressIndicator()))),
          )
        ],
      ),
    ));
  }
}
