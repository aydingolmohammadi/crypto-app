import 'package:crypto_stats/feature_home/presentation/screen/widgets/balance_card.dart';
import 'package:crypto_stats/feature_home/presentation/screen/widgets/crypto_assets.dart';
import 'package:crypto_stats/feature_home/presentation/screen/widgets/live_prices.dart';
import 'package:crypto_stats/feature_home/presentation/screen/widgets/profile.dart';
import 'package:flutter/material.dart';

class CryptoStatsPage extends StatelessWidget {
  const CryptoStatsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return const SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.fromLTRB(25, 30, 25, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Profile(
              avatar: AssetImage('assets/images/avatar.jpeg'),
              avatar2: AssetImage('assets/images/Component 3.jpg'),
            ),
            SizedBox(height: 40),
            BalanceCard(
              balance: '\$450,654',
              monthlyProfit: '\$12,654',
              profitPer: '10%',
            ),
            SizedBox(height: 25),
            LivePrices(),
            SizedBox(height: 25),
            CryptoAssets(),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
