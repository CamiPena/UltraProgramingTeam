class Sites {
  var _id;
  var _siteName;
  var _description;
  var _rating;

  Sites(this._id, this._siteName, this._description, this._rating);

  Sites.fromJson(Map<String, dynamic> json)
      : _id = json['id'],
        _siteName = json['siteName'],
        _description = json['description'],
        _rating = json['rating'];

  Map<String, dynamic> toJson() => {
  'id' : _id,
  'siteName' : _siteName,
  'description' : _description,
  'rating' : _rating
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
}