class User{
  var _name;
  var _lastName;
  var _email;
  var _password;

  User(this._name, this._lastName, this._email, this._password);

  User.Empty();

  User.fromJson(Map<String, dynamic> json):
        _name = json['name'],
        _lastName = json['lastName'],
        _password = json['password'],
        _email = json['email'];

  Map<String, dynamic> ToJson() => {
    'name' : _name,
    'lastName' : _lastName,
    'password' : _password,
    'email' : _email,
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