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

   static List<Party> createDummyList(){
    List<Party> _partyList = <Party>[];
    List<Person> _personList = <Person>[];
    List<Person> _personList2 = <Person>[];
    _personList.add(Person("Frank", "424684@student.saxion.nl"));
    _personList.add(Person("Derk", "******@student.saxion.nl"));

    _personList2.add(Person("Peter", "******@student.saxion.nl"));


    _partyList.add(Party.withPersons("Lan party", _personList2));
    _partyList.add(Party.withPersons("Disco party", _personList));
    _partyList.add(Party("Marvel party"));

    return _partyList;
  }
}