import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/user_provider.dart';

class RandomUserScreen extends StatefulWidget {
  @override
  _RandomUserScreenState createState() => _RandomUserScreenState();
}

class _RandomUserScreenState extends State<RandomUserScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<RandomUserProvider>(context, listen: false).fetchRandomUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random User Generator'),
      ),
      body: Consumer<RandomUserProvider>(
        builder: (context, userProvider, child) {
          if (userProvider.users.isEmpty) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: userProvider.users.length,
            itemBuilder: (context, index) {
              final user = userProvider.users[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(user.image),
                ),
                title: Text(user.name),
                subtitle: Text(user.email),
                trailing: Text(user.phone),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<RandomUserProvider>(context, listen: false).fetchRandomUsers();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
