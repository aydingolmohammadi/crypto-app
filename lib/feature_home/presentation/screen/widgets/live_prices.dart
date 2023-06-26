// ignore: public_member_api_docs
import 'dart:convert';
import 'package:crypto_stats/feature_home/data/models/trade.dart';
import 'package:crypto_stats/feature_home/presentation/cubit/live_prices_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LivePrices extends StatefulWidget {
  // ignore: public_member_api_docs
  const LivePrices({Key? key}) : super(key: key);

  @override
  _LivePricesState createState() => _LivePricesState();
}

class _LivePricesState extends State<LivePrices> {
  @override
  Widget build(BuildContext context) {
    final realDataStream =
        BlocProvider.of<LivePricesCubit>(context).getRealData();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Live Prices', style: TextStyle(fontSize: 17)),
            Container(
              height: 25,
              width: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Color(0xffdcdcdc),
                  width: 1,
                ),
              ),
              child: const Center(
                child: Text(
                  'See all',
                  style: TextStyle(
                    color: Color(0xff5149F7),
                    fontSize: 10
                  ),
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        StreamBuilder<dynamic>(
          stream: realDataStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final realData = Trade.fromJson(jsonDecode(
                snapshot.data.toString(),
              ) as Map<String, dynamic>);
              return SizedBox(
                height: 160,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: tradeList.length,
                  itemBuilder: (BuildContext context, int index) {
                    tradeList
                        .firstWhere(
                            (element) => element.symbolId == realData.symbolId)
                        .price = realData.price;
                    tradeList
                        .firstWhere(
                            (element) => element.symbolId == realData.symbolId)
                        .takerSide = realData.takerSide;

                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Container(
                        width: 230,
                        height: 150,
                        decoration: const BoxDecoration(
                          color: Color(0xffF9FAFF),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(0),
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(70),
                          ),
                        ),
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: 40,
                              child: Row(
                                children: <Widget>[
                                  Text(tradeList[index].title1,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                  Text(
                                    tradeList[index].title2,
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  CircleAvatar(
                                    backgroundImage: tradeList[index].icon,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 35,
                              child: Text(
                                '\$' + tradeList[index].price.toString(),
                                style: const TextStyle(
                                  fontSize: 24,
                                ),
                              ),
                            ),
                            if (tradeList[index].takerSide == "SELL")
                              SizedBox(
                                height: 20,
                                child: Text(
                                  tradeList[index].takerSide,
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.red),
                                ),
                              ),
                            if (tradeList[index].takerSide == "BUY")
                              SizedBox(
                                height: 20,
                                child: Text(
                                  tradeList[index].takerSide,
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.green),
                                ),
                              ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            } else {
              return const SizedBox(
                height: 160,
                child: Center(child: CircularProgressIndicator()),
              );
            }
          },
        ),
      ],
    );
  }
}
