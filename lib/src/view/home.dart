import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rest_api_provider/src/provider/provider.dart';

class HomePageSection extends StatefulWidget {
  const HomePageSection({Key? key}) : super(key: key);

  @override
  State<HomePageSection> createState() => _HomePageSectionState();
}

class _HomePageSectionState extends State<HomePageSection> {
  @override
  Widget build(BuildContext context) {
    print("Hello");
    return Scaffold(
        appBar: AppBar(
          title: Text("Rest Api Provider"),
        ),
        body: Column(
          children: [
            Consumer<ApiProvider>(builder: (context, data, child) {
              return Expanded(
                  child: FutureBuilder(
                future: data.fetchAllData(),
                builder: ((context, snapshot) {
                  return ListView.builder(
                      itemCount: data.newList.length,
                      itemBuilder: (context, index) {
                        return Card(
                            child: ListTile(
                          leading: Text(data.newList[index].id.toString()),
                          title: Text(data.newList[index].title.toString()),
                          trailing: Text("3.4"),
                        ));
                      });
                }),
              ));
            })
          ],
        ));
  }
}
