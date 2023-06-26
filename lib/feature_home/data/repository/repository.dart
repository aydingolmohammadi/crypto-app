import 'package:crypto_stats/feature_home/data/data_source/remote/network_service.dart';
import 'package:crypto_stats/feature_home/data/models/crypto_asset.dart';

abstract class IRepository {
  // ignore: public_member_api_docs
  Future<List<CryptoAsset>> getCryptoAssets();
}

// ignore: public_member_api_docs
class Repository implements IRepository {
  final INetworkService _networkService;

  // ignore: public_member_api_docs, sort_constructors_first
  Repository(this._networkService);

  @override
  Future<List<CryptoAsset>> getCryptoAssets() async {
    final result = await _networkService.getCryptoAssets();
    return result
        .map((dynamic e) => CryptoAsset.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
