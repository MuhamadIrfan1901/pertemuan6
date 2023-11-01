import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GetApi extends StatefulWidget {
  const GetApi({Key? key}) : super(key: key);

  @override
  State<GetApi> createState() {
    return _GetApiState();
  }
}

class _GetApiState extends State<GetApi> {
  List<String> data = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(
        Uri.parse('https://uts.djambred.my.id/api/student'),
      );
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body) as List;
        // print(jsonData);
        if (jsonData.isNotEmpty) {
          final dat = jsonData.first;
          // print(jsonData.first['id']);
          final name = dat['name'].toString();
          final email = dat['email'].toString();
          final password = dat['password'].toString();
          final createdAt = dat['created_at'].toString().split('T')[0];
          final updatedAt = dat['updated_at'].toString().split('T')[0];
          setState(() {
            data = [
              'Name : $name',
              'Email : $email',
              'Password : $password',
              'Created At : $createdAt',
              'Upadated At : $updatedAt',
            ];
          });
        }
      }
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    // return data.isEmpty
    //     ? const Center(
    //         child: Text('Data Api Masih Kosong!'),
    //       )
    //     : ListView.builder(
    //         itemCount: data.length,
    //         itemBuilder: (context, index) {
    //           return ListTile(
    //             title: Text(data[index]),
    //           );
    //         },
    //       );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text(
            'Data User (${data.length}) :',
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: data.isEmpty
              ? const Center(
            child: Text('Data Api Masih Kosong!'),
          )
              : ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(data[index]),
              );
            },
          ),
        ),
      ],
    );
  }
}