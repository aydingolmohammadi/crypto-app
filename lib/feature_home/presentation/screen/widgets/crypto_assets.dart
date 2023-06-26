// ignore: public_member_api_docs
import 'package:crypto_stats/feature_home/presentation/cubit/crypto_assets_cubit.dart';
import 'package:crypto_stats/feature_home/presentation/screen/widgets/cached_circle_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryptoAssets extends StatelessWidget {
  // ignore: public_member_api_docs
  const CryptoAssets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_dynamic_calls
    BlocProvider.of<CryptoAssetsCubit>(context).getCryptoAssets();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text('Crypto assets', style: TextStyle(fontSize: 17)),
        const SizedBox(
          height: 20,
        ),
        BlocBuilder<CryptoAssetsCubit, CryptoAssetsState>(
          builder: (context, state) {
            if (state is! CryptoLoaded) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            final cryptoAssets = state.cryptoAssets;
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                print(cryptoAssets[index].url);
                return Column(
                  children: [
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: const Color(0xffF9FAFF),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 20,
                          ),
                          CachedCircleAvatar(
                            url: cryptoAssets[index+50].url,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            cryptoAssets[index+50].assetId,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                );
              },
            );
          },
        ),
      ],
    );
  }
}
