import 'package:dio_flutter_first/provider/provider_self/my_get_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GetDataProviderScreen extends StatefulWidget {
  const GetDataProviderScreen({super.key});

  @override
  State<GetDataProviderScreen> createState() => _GetDataProviderScreenState();
}

class _GetDataProviderScreenState extends State<GetDataProviderScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   Provider.of<MyGetProvider>(context).getAllData();
    // });
  }

  @override
  Widget build(BuildContext context) {
    final myProvider = Provider.of<MyGetProvider>(context, listen: false);
    var myValue = myProvider.firstUser?.email ?? '22222';
    return Scaffold(
        appBar: AppBar(
          title: const Text('Single Retriving of Data'),
        ),
        body: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return Consumer<MyGetProvider>(builder: ((context, value, child) {
                return Column(
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          myProvider.getAllData();
                          // print('=====' + value.firstUser!.email);
                        },
                        child: Text('Press')),
                    Text(myValue),
                    Text(value.firstUser?.email.toString() ?? ''),
                    Text(value.firstUser?.gender.toString() ?? ''),
                    Text(value.firstUser?.name.toString() ?? ''),
                  ],
                );
              }));
            }));
  }
}
