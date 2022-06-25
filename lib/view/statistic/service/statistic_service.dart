import 'package:covid_19_statistic/view/statistic/model/statistic.dart';
import 'package:dio/dio.dart';
import '../../../product/constant/api_constant.dart';

abstract class IStatisticService {
  Future getStatistic(String countryName);
  final dio = Dio();
}

class StatisticService extends IStatisticService {
  @override
  Future getStatistic(String countryName) async {
    dio.options.headers[ApiConstant.headerHost] = ApiConstant.headerHostValue;
    dio.options.headers[ApiConstant.headerKey] = ApiConstant.headerKeyValue;
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
