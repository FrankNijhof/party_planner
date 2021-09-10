import 'person.dart';

class Party{
  String _name = "";
  List<Person> _persons = <Person>[];

  Party(String name)
  {
    this._name = name;
    this._persons = <Person>[];
  }

  Party.withPersons(String name, List<Person> persons)
  {
    this._name = name;
    this._persons = persons;
  }

  String getName()
  {
    return this._name;
  }

  List<Person> getPersons()
  {
    return this._persons;
  }

  void setName(String name)
  {
    this._name = name;
  }

  void setPersons(List<Person> persons)
  {
    this._persons = persons;
  }

  void addPerson(Person person)
  {
    this._persons.add(person);
  }
}