import 'package:flutter/material.dart';

import 'api/apiCall.dart';
import 'model/places_response.dart';

class NewHomeScreen extends StatefulWidget {
  const NewHomeScreen({Key? key}) : super(key: key);

  @override
  State<NewHomeScreen> createState() => _NewHomeScreenState();
}

class _NewHomeScreenState extends State<NewHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Result>>(
      future: UsersApi.getUsersData(
                      latitude: 27.1751, longitude: 78.0421),
      builder: (context, snapshot) {
        final users = snapshot.data;

        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const Center(child: CircularProgressIndicator());
          default:
            if (snapshot.hasError) {
              return Center(
                  child: Text('Some error occurred! ${snapshot.error}'));
            } else {
              return ListView.builder(
                itemCount: users!.length,
                itemBuilder: (context, position) {
                  if (users[position].categories!.isNotEmpty) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          users[position].categories?[0].name ?? '',
                          style: const TextStyle(fontSize: 22.0),
                        ),
                      ),
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              );
              //return Text('fsfsd ${users![0].name}');
            }
        }
      },
    );
  }
}
