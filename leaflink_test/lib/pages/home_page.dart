import 'package:flutter/material.dart';
import 'avatar_creation_page.dart';
import 'challenges_page.dart';
import 'rewards_page.dart';
import 'wallet_page.dart';
import '../widgets/reusable_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LeafLink'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Row(
              children: [
                Icon(Icons.eco),
                SizedBox(width: 4),
                Text('120'),
                SizedBox(width: 12),
                Icon(Icons.star),
                SizedBox(width: 4),
                Text('Level 3'),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Center(child: Text("Welcome to your Leaf Journey!", style: TextStyle(fontSize: 20))),
          SizedBox(height: 20),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: EdgeInsets.all(20),
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              children: [
                ReusableButton(
                  icon: Icons.eco,
                  label: "Track Carbon",
                  onPressed: () {}, // To be added
                ),
                ReusableButton(
                  icon: Icons.face,
                  label: "Customize Avatar",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AvatarCreationPage()),
                    );
                  },
                ),
                ReusableButton(
                  icon: Icons.flag,
                  label: "Challenges",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChallengesPage()),
                    );
                  },
                ),
                ReusableButton(
                  icon: Icons.wallet,
                  label: "Wallet",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => WalletPage()),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
