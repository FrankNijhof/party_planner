import 'package:flutter/material.dart';
import 'package:party_planner/person.dart';
import 'package:party_planner/party.dart';

//TODO: volg tutorial voor navigator/routing: https://medium.com/flutter/learning-flutters-new-navigation-and-routing-system-7c9068155ade

void main() {
  runApp(PartyApp());
}

class PartyApp extends StatefulWidget {


/*  @override
  Widget build(BuildContext context) {


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
  }*/

/*  Route _createRoute(){
    return PageRouteBuilder(pageBuilder: (context, animation , secondaryAnimation) => const AttendeesPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child){
      return child;
    });
  }*/

  @override
  State<StatefulWidget> createState() => _PartyAppState();
}

class _PartyAppState extends State<PartyApp>{

  List parties = Party.createDummyList();


  void initstate() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Party app",
        home: Navigator(
          pages: [
            MaterialPage(key: ValueKey('PartyPage'),
              child: Scaffold(),
            )
          ],
          onPopPage: (route, result) => route.didPop(result),
        )
    );
  }

}


class PartyList extends StatefulWidget {
  const PartyList({Key? key}) : super(key: key);

  @override
  _PartyListState createState() => _PartyListState();
}


class _PartyListState extends State<PartyList> {

   final List<Party> _partyList =Party.createDummyList();


  Widget _buildPartyList(){

  /*  List<Person> _personList = <Person>[];

      _personList.add(Person("Frank", "424684@student.saxion.nl"));

      _partyList.add(Party("Lan party"));
      _partyList.add(Party.withPersons("Disco party", _personList));
      _partyList.add(Party("Marvel party"));*/


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

