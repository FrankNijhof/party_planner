import 'package:flutter/material.dart';
import 'package:party_planner/person.dart';
import 'package:party_planner/party.dart';

//TODO: volg tutorial voor navigator/routing: https://medium.com/flutter/learning-flutters-new-navigation-and-routing-system-7c9068155ade

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

/*  Route _createRoute(){
    return PageRouteBuilder(pageBuilder: (context, animation , secondaryAnimation) => const AttendeesPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child){
      return child;
    });
  }*/


}

class PartyList extends StatefulWidget {
  const PartyList({Key? key}) : super(key: key);

  @override
  _PartyListState createState() => _PartyListState();

}

class _PartyListState extends State<PartyList> {
  final List<Party> _partyList = Party.createDummyList();

  Widget _buildPartyList() {

    return ListView.builder(
        itemCount: _partyList.length,
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          final party = _partyList[i];

          return ListTile(
            title: Text(party.getName()),
            subtitle: Text("Attendees:" + party.getPersons().length.toString()),
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PartyDetailsScreen(party)));
            },
          );
          //return _buildRow(_partyList[i].getName());
        });
  }

  @override
  Widget build(BuildContext context) {
    return _buildPartyList();
  }
}

class PartyDetailsScreen extends StatelessWidget {
  final Party party;

  PartyDetailsScreen(this.party);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(party.getName()),
      ),
      body: Center(
        child: Text("Number of attendees: " + party.getPersons().length.toString()),
      ) ,
    );
  }

}
class CreatePartyPage {
}

class ContactsPage {

}