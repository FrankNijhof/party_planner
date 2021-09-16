import 'package:flutter/material.dart';
import 'package:party_planner/person.dart';
import 'package:party_planner/party.dart';

//TODO: The app has some sort of professional styling
//TODO: The app shows a list of upcoming parties and gives the user the ability to add one
//TODO: When the user clicks adds a party he/she can put then name, the description and the date of the party. Add the party to the phone agenda immediately after creating the party.
//TODO: Allow the user to add persons to the party. When the user presses the button the phones contact list should appear and the user can select a contact.
//TODO: Allow the user to send an invitation to the party people. You can do this with the cordova-email-plugin
// or an ionic / framework7 plugin that’s based on that one. Otherwise an enhanced mailto:// URL should
// work. You also can use some sort of iCal invitation, but’s that’s not necessary.

void main() {
  runApp(PartyApp());
}

class PartyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        TextButton.styleFrom(primary: Theme.of(context).colorScheme.onPrimary);
    return MaterialApp(
      title: "Party app",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Party app"),
          actions: <Widget>[
            TextButton(
                style: style, onPressed: () {}, child: const Text('Add party')),
            TextButton(
                style: style, onPressed: () {}, child: const Text('Contacts'))
          ],
        ),
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
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PartyDetailsScreen(party)));
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

  Widget _buildPersonsList() {
    if (party.getPersons().isEmpty) {
      return Text("No attendees");
    }

    return ListView.builder(
        itemCount: party.getPersons().length,
        itemBuilder: (context, i) {
          final Person person = party.getPersons()[i];
          return ListTile(
            title: Text(person.getName()),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(party.getName()),
      ),
      body: Column(
        children: [
          Text(party.getName() ,
          style: TextStyle(fontSize: 30 , fontWeight: FontWeight.bold),),
          Container(
            height: 50.0,
            child: const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Attendees",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                )),
          ),
          Expanded(child: _buildPersonsList())
        ],
      ) /*Center(
        child:
            _buildPersonsList() */ /*Text("Number of attendees: " + party.getPersons().length.toString())*/ /*,
      )*/
      ,
    );
  }
}

class CreatePartyPage {}

class ContactsPage {}
