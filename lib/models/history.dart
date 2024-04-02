class History {
  late String _clockIn;
  late String _clockOut;

  History(this._clockIn, this. _clockOut);

  History.withAll(String? clockIn, String? clockOut) {
    clockIn ?? _clockIn;
    clockOut ?? _clockOut;
  }

  History.copy(String? clockIn, String? clockOut){
    History.withAll(clockIn ?? _clockIn, clockOut ?? _clockOut);
  }

  History.fromJson(Map<String, Object?> json){
    _clockIn = json['ClockIn'] as String;
    _clockOut  = json['ClockOut'] as String;
  }


  Map<String, Object> toJson(){
    return {
      'ClockIn' : _clockIn,
      'ClockOut' : _clockOut,
    };
  }

  String getClockIn() {
    return _clockIn;
  }

  String getClockOut() {
    return _clockOut;
  }

  void setClockIn(String clockIn) {
    _clockIn = clockIn;
  }

  void setClockOut(String clockOut) {
    _clockOut = clockOut;
  }

}