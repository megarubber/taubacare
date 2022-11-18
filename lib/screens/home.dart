import 'package:flutter/material.dart';
import '../utilities/colors.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: Builder(builder: (context) {
            return IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: Icon(Icons.menu)
            );
          }),
          actions: <Widget>[
            IconButton(
              onPressed: null,
              icon: Icon(Icons.manage_search_rounded)
            ),
          ],
          bottom: const TabBar(
            tabs: <Tab>[
              Tab(
                icon: Icon(Icons.library_books_rounded),
                child: Text('Educação')
              ),
              Tab(
                icon: Icon(Icons.house_rounded),
                child: Text('Assistência')
              ),
              Tab(
                icon: Icon(Icons.sports_basketball_rounded),
                child: Text('Esporte')
              ),
            ]
          )
        ),
        body: TabBarView(
          children: <Widget>[
            SizedBox(  
              child: Container(
                padding: const EdgeInsets.all(30),
                height: 180,
                width: 150,
                decoration: BoxDecoration(
                  color: ProjectColors.red,
                  borderRadius: BorderRadius.circular(20) 
                )
              )
            ),
            SizedBox(
              child: Center(
                child: Text('Tab Page 1'),
              ),
            ),
            SizedBox(
              child: Center(
                child: Text('Tab Page 1'),
              ),
            ),
          ]
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text('oi'),
                accountEmail: Text('eae'),
                decoration: BoxDecoration(color: ProjectColors.white),
                currentAccountPicture: CircleAvatar(
                  radius: 50.0,
                  backgroundColor: ProjectColors.lowRed
                )
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Voltar')
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Ver Saldo')
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Sair da conta')
              ),
            ]
          )
        )
      )
    );
  }
}