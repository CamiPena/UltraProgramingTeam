class Sites {
  var _id;
  var _siteName;
  var _description;
  var _rating;
  var _foto;


  Sites(this._id, this._siteName, this._description, this._rating, this._foto);

  Sites.fromJson(Map<String, dynamic> json)
      : _id = json['id'],
        _siteName = json['siteName'],
        _description = json['description'],
        _rating = json['rating'],
        _foto = json['foto'];

  Map<String, dynamic> toJson() => {
    'id' : _id,
    'siteName' : _siteName,
    'description' : _description,
    'rating' : _rating,
    'foto' : _foto

  };

  get rating => _rating;

  set rating(value) {
    _rating = value;
  }

  get description => _description;

  set description(value) {
    _description = value;
  }

  get siteName => _siteName;

  set siteName(value) {
    _siteName = value;
  }

  get id => _id;

  set id(value) {
    _id = value;
  }

  get foto => _foto;

  set foto(value) {
    _foto = value;
  }
}