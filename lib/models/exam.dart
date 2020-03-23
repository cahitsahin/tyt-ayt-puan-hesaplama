class Exam{
  int _id;
  String _name;
  double _obp;
  double _tyt;
  double _say;
  double _soz;
  double _est;
  double _dil;

  Exam(this._name,this._obp, this._tyt, this._say, this._soz, this._est,
      this._dil);

  Exam.withId(this._id, this._name, this._obp, this._tyt, this._say, this._soz,
      this._est, this._dil);

  double get dil => _dil;

  set dil(double value) {
    _dil = value;
  }

  double get est => _est;

  set est(double value) {
    _est = value;
  }

  double get soz => _soz;

  set soz(double value) {
    _soz = value;
  }

  double get say => _say;

  set say(double value) {
    _say = value;
  }

  double get tyt => _tyt;

  set tyt(double value) {
    _tyt = value;
  }

  double get obp => _obp;

  set obp(double value) {
    _obp = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }
  int get id => _id;

  set id(int value) {
    _id = value;
  }



  Map<String,dynamic> toMap(){
    var map = Map<String,dynamic>();
    map['id']= _id;
    map['name'] = _name;
    map['obp'] = _obp;
    map['tyt'] = _tyt;
    map['say'] = _say;
    map['soz'] = _soz;
    map['est'] = _est;
    map['dil'] = _dil;

    return map;
  }

  Exam.fromMap(Map<String,dynamic> map){
    this.id = map['id'];
    this.name = map['name'];
    this.obp=map['obp'] ;
    this.tyt=map['tyt'] ;
    this.say=map['say'] ;
    this.soz=map['soz'] ;
    this.est=map['est'] ;
    this.dil=map['dil'];
  }

}