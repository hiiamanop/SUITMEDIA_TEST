import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suit_test_app/provider/app_state.dart';
import 'package:suit_test_app/themes/theme.dart';


class ThirdScreen extends StatefulWidget {
  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AppState>().fetchUsers();
    });
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      context.read<AppState>().fetchUsers();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Third Screen',
          style: blackTextStyle,
        ),
        centerTitle: true,
      ),
      body: Consumer<AppState>(
        builder: (context, appState, child) {
          if (appState.users.isEmpty && !appState.isLoading) {
            return Center(child: Text('No users found', style: blackTextStyle,));
          }
          return RefreshIndicator(
            onRefresh: () => appState.fetchUsers(refresh: true),
            child: ListView.builder(
              controller: _scrollController,
              itemCount: appState.users.length + (appState.isLoading ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == appState.users.length) {
                  return Center(child: CircularProgressIndicator());
                }
                final user = appState.users[index];
                return ListTile(
                  leading: CircleAvatar(backgroundImage: NetworkImage(user.avatar)),
                  title: Text('${user.firstName} ${user.lastName}', style: blackTextStyle,),
                  subtitle: Text(user.email, style: greyTextStyle,),
                  onTap: () {
                    appState.setSelectedUserName('${user.firstName} ${user.lastName}');
                    Navigator.pop(context);
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}