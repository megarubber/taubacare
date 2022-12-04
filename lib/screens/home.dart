import 'package:flutter/material.dart';
import '../services/database.dart';
import '../utilities/colors.dart';
import '../utilities/session.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  MyDatabase _database = MyDatabase();

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
				/*
        body: TabBarView(
          children: StreamBuilder(
						
					);
        ),
				*/
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text(Session.name),
                accountEmail: Text(Session.email),
                decoration: BoxDecoration(color: ProjectColors.lowRed),
                currentAccountPicture: CircleAvatar(
                  radius: 50.0,
                  backgroundColor: ProjectColors.lowRed
                )
              ),
              ListTile(
                leading: const Icon(Icons.house_rounded),
                title: const Text('Cadastrar uma instituição')
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Configurações da conta')
              ),
              ListTile(
                leading: const Icon(Icons.logout_rounded),
                title: const Text('Sair da conta')
              ),
            ]
          )
        )
      )
    );
  }
}
