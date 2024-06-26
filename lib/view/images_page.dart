import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../funcs/apis.dart';
import '../style/custom_style.dart';
import '../model/data_list_model.dart';
import '../funcs/firebase_funcs.dart';
import 'images_page2.dart';
import '../widgets/loader_widget.dart';
import 'login_page.dart';

class ImagesPage extends StatefulWidget {
  const ImagesPage({super.key});

  @override
  State<ImagesPage> createState() => _ImagesPageState();
}

class _ImagesPageState extends State<ImagesPage> {
  List<Map<String, dynamic>> listData = [];
  int imgId = 0;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(
                    "You are about to exit",
                    style: CustomStyle().getCStyle(size: 20),
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          SystemNavigator.pop();
                        },
                        child: Text(
                          "exit",
                          style: CustomStyle().getCStyle(),
                        )),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("no", style: CustomStyle().getCStyle()),
                    )
                  ],
                ));
      },
      child: Scaffold(
        body: Consumer<DataListModel>(
          builder: (context, value, child) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () async {
                    showDialog(
                        context: context,
                        builder: (context) => const LoaderWidget());
                    imgId = int.parse(value.dataListModel![index].id!);
                    await Apis().getImagesData2(id: imgId);
                    if (context.mounted) {
                      Navigator.pop(context);
                    }
                    if (context.mounted) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ImagesPage2()));
                    }
                  },
                  child: Card(
                    child: Column(
                      children: [
                        CachedNetworkImage(
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(),
                            imageUrl:
                                "${Apis().baseUrl}${value.dataListModel?[index].imgUrlPath.toString()}"),
                        Text(value.dataListModel?[index].name ?? "0")
                      ],
                    ),
                  ),
                );
              },
              itemCount: value.dataListModel?.length ?? 0,
            );
          },
        ),
        appBar: AppBar(automaticallyImplyLeading: false,
          actions: [
            IconButton(
                onPressed: () async {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: Text(
                              "You are about to signout",
                              style: CustomStyle().getCStyle(size: 20),
                            ),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    FirebaseFuncs().logoutUser();
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => const LoginPage()));
                                  },
                                  child: Text(
                                    "signout",
                                    style: CustomStyle().getCStyle(),
                                  )),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("no",
                                    style: CustomStyle().getCStyle()),
                              )
                            ],
                          ));
                },
                icon: const Icon(Icons.logout))
          ],
          backgroundColor: Colors.transparent,
          title: Text("Coinone",
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(fontSize: 27))),
        ),
      ),
    );
  }
}
