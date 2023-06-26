import 'package:crypto_stats/feature_home/presentation/screen/widgets/balance_card.dart';
import 'package:crypto_stats/feature_home/presentation/screen/widgets/crypto_assets.dart';
import 'package:crypto_stats/feature_home/presentation/screen/widgets/live_prices.dart';
import 'package:crypto_stats/feature_home/presentation/screen/widgets/profile.dart';
import 'package:flutter/material.dart';

class CryptoStatsPage extends StatelessWidget {
  const CryptoStatsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: _buildBody(context)));
  }

  Widget _buildBody(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.fromLTRB(15, 30, 15, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Profile(
              message: 'Wellcome',
              name: 'Aydin Golmohammadi',
              avatar: AssetImage('assets/images/avatar.jpeg'),
            ),
            SizedBox(height: 20),
            BalanceCard(
              balance: '\$450,654',
              monthlyProfit: '\$12,654',
              profitPer: '10%',
            ),
            SizedBox(height: 20),
            LivePrices(),
            SizedBox(height: 20),
            CryptoAssets(),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
