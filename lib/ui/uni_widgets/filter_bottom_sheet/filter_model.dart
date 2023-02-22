class FilterModel {
  String? fulltext;
  String? flightNumber;
  bool? success;
  bool? recovered;
  bool? reused;

  FilterModel({
    this.fulltext,
    this.flightNumber,
    this.success,
    this.recovered,
    this.reused,
  });
}

List<String> filterList = [
  'Search in Fulltext',
  'Flight Num',
  'is Success',
  'is Recovered',
  'is Reused',
];
