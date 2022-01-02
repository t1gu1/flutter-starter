import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Oflutter.com'),
            accountEmail: Text('example@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  'https://pbs.twimg.com/media/DUfDNvTVQAA2osS.jpg:large',
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.black54,
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      'https://th.bing.com/th/id/R.307c5b29d72d59a1d1d8926685451e67?rik=rSywjZobiTg6Bw&riu=http%3a%2f%2fwallpapercave.com%2fwp%2fRsyHRBx.jpg&ehk=8NDBntKhuI6r6Yl7lmKECZZdrLVJ4EfrAYC6Cd5ZJqU%3d&risl=&pid=ImgRaw&r=0')),
            ),
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Favorites'),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Friends'),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.share),
            title: Text('Share'),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Request'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.description),
            title: Text('Policies'),
            onTap: () => {},
          ),
          Divider(),
          ListTile(
            title: Text('Exit'),
            leading: Icon(Icons.exit_to_app),
            onTap: () => {},
          ),
        ],
      ),
    );
  }
}
