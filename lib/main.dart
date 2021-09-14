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

  Party _selectedparty;
  List<Party> parties = Party.createDummyList();
  void initstate() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Party app",
        home: Navigator(
          pages: [
            MaterialPage(
              key: ValueKey('PartyPage'),
              child: PartyList(
                partyList: parties,
                onTapped: _handlePartyTapped,
              ),
            ),
            if(_selectedparty != null) PartyDetailsPage(party: _selectedparty)

          ],
    onPopPage: (route, result) {
    if (!route.didPop(result)) {
    return false;
    }
    setState((){
      _selectedparty = null;
    });
          }

        )
    );
  }

  void _handlePartyTapped(Party party)
  {
    setState((){
      _selectedparty = party;
    });
  }

}


class PartyList extends StatelessWidget {
  //const PartyList({Key? key}) : super(key: key);
  final List<Party> partyList;
  final ValueChanged<Party> onTapped;

  PartyList({
    required this.partyList,
    required this.onTapped,
});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          for (var party in partyList)
            ListTile(
              title: Text(party.getName()),
              subtitle: Text(party.getPersons().length.toString()),
              onTap: () => onTapped(party),
            )
        ],
      ),
    );
  }



/*  @override
  _PartyListState createState() => _PartyListState();*/
}


/*class _PartyListState extends State<PartyList> {

  final List<Party> partyList =Party.createDummyList();

  Widget _buildPartyList(){

  *//*  List<Person> _personList = <Person>[];

      _personList.add(Person("Frank", "424684@student.saxion.nl"));

      _partyList.add(Party("Lan party"));
      _partyList.add(Party.withPersons("Disco party", _personList));
      _partyList.add(Party("Marvel party"));*//*


    return ListView.builder(

      itemCount: partyList.length,
        padding: const EdgeInsets.all(16.0),
        itemBuilder:(context, i) {
        final party = partyList[i];

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
}*/

class PartyDetailsScreen extends StatelessWidget {
  final Party party;

  PartyDetailsScreen({
    required this.party,
}) : super(key: ValueKey(party));



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (party != null) ...[
              Text(party.getName(), style: Theme.of(context).textTheme.headline6),
              Text("Number of attendees: " + party.getPersons().length.toString(), style: Theme.of(context).textTheme.subtitle1),
            ],
          ],
        ),
      ),
    );

  }



}

class PartyDetailsPage extends Page{
  final Party party;

  PartyDetailsPage({
    required this.party,
}): super(key: ValueKey(party));

  @override
  Route createRoute(BuildContext context) {
    return PageRouteBuilder(
        settings: this,
        pageBuilder: (context, animation , animation2){
          final tween = Tween(begin: Offset (0.0 , 0.1), end: Offset.zero);
          final curveTween = CurveTween(curve: Curves.easeInOut);
          return SlideTransition(
            position: animation.drive(curveTween).drive(tween),
            child: PartyDetailsScreen(
              party: party,
            ),
          );
        }
    );
  }
}

