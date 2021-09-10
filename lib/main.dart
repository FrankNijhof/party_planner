import 'dart:js';

import 'package:flutter/material.dart';
import 'package:party_planner/person.dart';
import 'package:party_planner/party.dart';

void main() {
  runApp(PartyApp());
}

class PartyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = TextButton.styleFrom(
        primary: Theme.of(context).colorScheme.onPrimary
    );

    return MaterialApp(
      title: "Party app",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Party app"),
        actions: <Widget>[
          TextButton(
              style: style
              ,onPressed: (){},
              child: const Text('Add party')),
          TextButton(
              style: style
              ,onPressed: (){},
              child: const Text('Contacts'))

        ],),
        body: const Center(
          child: PartyList(),
        ),
      ),
    );
  }

  Route _createRoute(){
    return PageRouteBuilder(pageBuilder: (context, animation , secondaryAnimation) => const AttendeesPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child){
      return child;
    });
  }
}

class PartyList extends StatefulWidget {
  const PartyList({Key? key}) : super(key: key);

  @override
  _PartyListState createState() => _PartyListState();
}


class _PartyListState extends State<PartyList> {

   final List<Party> _partyList = <Party>[];


  Widget _buildPartyList(){

    List<Person> _personList = <Person>[];
    _personList.add(Person("Frank","424684@student.saxion.nl"));

    _partyList.add(Party("Lan party"));
    _partyList.add(Party.withPersons("Disco party" , _personList));
    _partyList.add(Party("Marvel party"));

    return ListView.builder(

      itemCount: _partyList.length,
        padding: const EdgeInsets.all(16.0),
        itemBuilder:(context, i) {
        final party = _partyList[i];

        return ListTile(
          title: Text(party.getName()),
          subtitle: Text("Attendees:" + party.getPersons().length.toString()),
        );
          //return _buildRow(_partyList[i].getName());
        });  }

  @override
  Widget build(BuildContext context) {
/*    if(_partyList.isEmpty)
      {
        int size = _partyList.length;
        return Text(size.toString() +" parties are found..." );
      }*/
    return _buildPartyList();
  }
}

class AttendeesPage extends StatelessWidget {
  const AttendeesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text("Attendees"),
      ),
    );

  }

}

