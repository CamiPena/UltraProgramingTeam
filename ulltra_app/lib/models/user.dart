class User{
  var _name;
  var _lastName;
  var _email;
  var _password;

  User(this._name, this._lastName, this._email, this._password);

  User.Empty();

  User.fromJson(Map<String, dynamic> json)
      : _name = json['name'],
        _lastName = json['lastName'],
        _email = json['email'],
        _password = json['password'];

  Map<String, dynamic> toJson() => {
    'name' : _name,
    'lastName' : _lastName,
    'email' : _email,
    'password' : _password,
  };

  get name => _name;

  set name(value) {
    _name = value;
  }

  get lastname => _lastName;

  get password => _password;

  set password(value) {
    _password = value;
  }

  get email => _email;

  set email(value) {
    _email = value;
  }

  set lastname(value) {
    _lastName = value;
  }
}