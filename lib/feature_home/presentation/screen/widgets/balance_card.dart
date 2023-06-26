import 'package:flutter/material.dart';

class BalanceCard extends StatelessWidget {
  // ignore: public_member_api_docs
  const BalanceCard(
      {Key? key,
      required this.balance,
      required this.monthlyProfit,
      required this.profitPer})
      : super(key: key);

  final String balance;
  final String monthlyProfit;
  final String profitPer;

  @override
  Widget build(BuildContext context) {
    const whiteText = TextStyle(color: Colors.white);
    return Container(
      height: 210,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        color: const Color(0xff443CEE),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SizedBox(
            height: 25,
            child: Center(
              child: Text(
                'balance',
                style: whiteText.copyWith(fontSize: 14),
              ),
            ),
          ),
          SizedBox(
            height: 50,
            child: Center(
              child: Text(
                balance,
                style: whiteText.copyWith(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 25,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    monthlyProfit,
                    style: whiteText.copyWith(
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Icon(
                        Icons.arrow_drop_up,
                        size: 20,
                        color: Colors.greenAccent,
                      ),
                      Text(
                        profitPer,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 45,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(
              child: Text(
                'Sell',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xff5149F7),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
