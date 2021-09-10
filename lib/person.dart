
class Person {
  String _name = "";
  String _contactInfo = "";

  Person(String name, String contactInfo)
  {
    this._name = name;
    this._contactInfo = contactInfo;
  }

  String getName(){
    return this._name;
  }

  String getContactInfo()
  {
    return this._contactInfo;
  }

  void setName(String name)
  {
    this._name = name;
  }

  void setContactInfo(String contactInfo)
  {
    this._contactInfo = contactInfo;
  }

}