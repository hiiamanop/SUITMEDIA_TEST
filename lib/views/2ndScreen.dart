import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:suit_test_app/provider/app_state.dart';
import 'package:suit_test_app/themes/theme.dart';
import 'package:suit_test_app/views/3rdScreen.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Second Screen',
          style: blackTextStyle,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Consumer<AppState>(
          builder: (context, appState, child) {
            return Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Welcome',
                              style: blackTextStyle.copyWith(
                                  fontWeight: FontWeight.w400)),
                          Text('${appState.name}',
                              style: blackTextStyle.copyWith(
                                  fontWeight: FontWeight.w600, fontSize: 18)),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Selected User Name',
                          style: blackTextStyle.copyWith(
                              fontWeight: FontWeight.w600, fontSize: 24)),
                      Text('${appState.selectedUserName}',
                          style: greyTextStyle.copyWith(
                              fontWeight: FontWeight.w600, fontSize: 24)),
                    ],
                  ),
                  SizedBox(
                    height: 41,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: secondaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'Choose a user',
                        style: primaryTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ThirdScreen()),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
