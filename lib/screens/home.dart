import 'package:flutter/material.dart';
import '../services/database.dart';
import '../utilities/colors.dart';
import '../utilities/session.dart';
import '../widgets/show_organization.dart';
import '../models/organization.dart';
import 'dart:convert';

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
					backgroundColor: ProjectColors.white,
					foregroundColor: ProjectColors.black,
					elevation: 0,
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
            ],
						labelColor: ProjectColors.black,
						indicatorColor: ProjectColors.black
          )
        ),
        body: TabBarView(
          children: <Widget>[
						SafeArea(
							/*
							child: FutureBuilder<Object?>(
								future: this._database.getOrganizations(),
								builder: (BuildContext context, AsyncSnapshot snapshot) {
									if(snapshot.hasError || snapshot.data == null) {
										return Text('Erro ao procurar instituições');
									}
									var result = snapshot.data.toString();
									var l = organizationsFromJson(result); 
									List<ShowOrganization> so = [];
									l.forEach((value) => so.add(ShowOrganization(
											title: value['title'],
											address: value['address'],
											contact: value['contact'],
											width: size.width * 0.8,
											height: 50
										))
									};
									return Text(snapshot.data.toString());
								}	
							)
							*/
							child: Column(
								children: <Widget>[
									SizedBox(height: size.height * 0.03),
									ShowOrganization(
										title: 'Anemo Health',
										address: 'Rua do Leste',
										contact: '(12) 99999-9999',
										width: size.width * 0.8,
									),
									SizedBox(height: size.height * 0.03),
									ShowOrganization(
										title: 'Capybara Inc',
										address: 'Rua do Oeste',
										contact: '(12) 99999-9999',
										width: size.width * 0.8,
									),
								]
							)
						),
						SafeArea(child: Text('Em breve')),
						SafeArea(child: Text('Em breve')),
					]
        ),
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
                title: const Text('Cadastrar uma instituição'),
								onTap: () => Navigator.of(context).pushReplacementNamed('/register_organization')
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Configurações da conta'),
								onTap: () {
									Navigator.of(context).pushReplacementNamed('/settings');
								}
              ),
              ListTile(
                leading: const Icon(Icons.logout_rounded),
                title: const Text('Sair da conta'),
								onTap: () {
									Session.reset();
									Navigator.of(context).pushReplacementNamed('/login');
								}
              ),
            ]
          )
        )
      )
    );
  }
}
