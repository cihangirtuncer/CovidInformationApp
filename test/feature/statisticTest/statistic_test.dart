import 'package:covid_19_statistic/view/statistic/service/statistic_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  IStatisticService statisticService;
  setUp(() {
    statisticService = StatisticService();
  });
  group("STATISTIC DATAS TESTING/", () {
    test("Statistic base data is not null", () {
      final listDatas = statisticService.getStatistic('Andora');
      expect(listDatas, isNotNull);
    });
    test("Statistic deaths datas is not nul", () {
      final listDatasCases =
          statisticService.getStatisticDeathsForTesting('Andora');
      expect(listDatasCases, isNotNull);
    });
     test("Statistic test datas is not nul", () {
      final listDatasTests =
          statisticService.getStatisticTestsForTesting('Andora');
      expect(listDatasTests, isNotNull);
    });
     test("Statistic population datas is not nul", () {
      final listDatasPopulation =
          statisticService.getStatisticPopulationForTesting('Andora');
      expect(listDatasPopulation, isNotNull);
    });
  });
   tearDown(() {
      statisticService.dio.close();
    });
}
