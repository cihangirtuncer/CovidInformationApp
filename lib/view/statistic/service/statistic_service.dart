import 'package:covid_19_statistic/view/statistic/model/statistic.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../product/constant/api_constant.dart';

abstract class IStatisticService {
  Future getStatistic(String countryName);
  final dio = Dio();
}

class StatisticService extends IStatisticService {
  @override
  Future getStatistic(String countryName) async {
    dio.options.headers['x-rapidapi-host'] = 'covid-193.p.rapidapi.com';
    dio.options.headers['x-rapidapi-key'] =
        '7230f0073fmsh19c10074c514c59p16793ejsn6aa0e35fe867';
    final response = await dio
        .get('${ApiConstant.url}${ApiConstant.statisticsCountry}$countryName');
    try {
      Statistic statistic = Statistic.fromJson(response.data);

      return statistic.response;
    } catch (e) {
      return NullThrownError();
    }
  }
}
