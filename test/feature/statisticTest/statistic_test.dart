import 'package:covid_19_statistic/view/statistic/service/statistic_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  IStatisticService statisticService;
  setUp(() {
    statisticService = StatisticService();
  });

  test("Statistic data is not null", () {
    final listDatas = statisticService.getStatistic('Andora');
    expect(listDatas, isNotNull);
  });
}
