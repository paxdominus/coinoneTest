import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../funcs/apis.dart';
import '../model/data_list_model2.dart';

class ImagesPage2 extends StatefulWidget {
  const ImagesPage2({super.key});

  @override
  State<ImagesPage2> createState() => _ImagesPage2State();
}

class _ImagesPage2State extends State<ImagesPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<DataListModel2>(
        builder: (context, value, child) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () async {},
                child: Card(
                  child: Column(
                    children: [
                      CachedNetworkImage(
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          imageUrl:
                              "${Apis().baseUrl}${value.dataListModel2?[index].imgUrlPath.toString()}"),
                      Text(value.dataListModel2?[index].name ?? "0")
                    ],
                  ),
                ),
              );
            },
            itemCount: value.dataListModel2?.length ?? 0,
          );
        },
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Coinone",
            style:
                GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 27))),
      ),
    );
  }
}
