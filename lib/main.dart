import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildSearchBar(),
            SizedBox(height: 10.0),
            _titlefirst(),
            SizedBox(height: 10.0),
            _ImageRow([
              'assets/images/adduser.png',
              'assets/images/group.png',
              'assets/images/megaphone.png',
              'assets/images/messages.png',
            ]),
            SizedBox(height: 10.0),
            _titleSecond(),
            _ContactRow([
              ContactInfo('Mary', 'assets/images/butterfly.png'),
              ContactInfo('Mauro Icardi', 'assets/images/icardi.jpg'),
              ContactInfo('Wesley Sneijder', 'assets/images/sneijder.jpg'),
              ContactInfo('Hagi', 'assets/images/hagi.jpg'),
              ContactInfo('Fatih Terim', 'assets/images/imparator.jpg'),
            ]),
            SizedBox(height: 20.0),
            _titleThird(),
            _FavoriteContacts()
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search...',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(4.0),
            ),
          ),
        ),
      ),
    );
  }

  Widget _titlefirst() {
    return Align(
      alignment: Alignment.topLeft,
      child: SizedBox(
        height: 60.0,
        child: Text(
          'Contacts',
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            color: Colors.red,
            letterSpacing: 1.0,
            wordSpacing: 2.0,
            fontFamily: 'Arial',
          ),
        ),
      ),
    );
  }

  Widget _titleSecond() {
    return Align(
      alignment: Alignment.topLeft,
      child: SizedBox(
        height: 60.0,
        child: Text(
          'Favorite Contact',
          style: TextStyle(
            fontSize: 18.0,
            fontStyle: FontStyle.italic,
            color: Colors.black,
            letterSpacing: 1.0,
            wordSpacing: 2.0,
            fontFamily: 'Lato',
          ),
        ),
      ),
    );
  }

  Widget _titleThird() {
    return Align(
      alignment: Alignment.topLeft,
      child: SizedBox(
        height: 60.0,
        child: Text(
          'Contact List',
          style: TextStyle(
            fontSize: 18.0,
            fontStyle: FontStyle.italic,
            color: Colors.black,
            letterSpacing: 1.0,
            wordSpacing: 2.0,
            fontFamily: 'Lato',
          ),
        ),
      ),
    );
  }

  Widget _Image(String imagePath, double width, double height) {
    return Image.asset(
      imagePath,
      width: width,
      height: height,
      fit: BoxFit.cover,
    );
  }

  Widget _ImageRow(List<String> imagePaths) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: imagePaths.map((imagePath) {
          if (imagePath == 'assets/images/messages.png') {
            return Padding(
              padding: const EdgeInsets.only(right: 4.0),
              child: _Image(imagePath, 121.0, 121.0), // Messages resmini büyüt
            );
          } else {
            return Padding(
              padding: const EdgeInsets.only(right: 4.0),
              child: _Image(imagePath, 80.0, 80.0),
            );
          }
        }).toList(),
      ),
    );
  }

  Widget _ContactRow(List<ContactInfo> contacts) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: contacts.map((contact) {
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Column(
              children: [
                _Image(contact.imagePath, 80.0, 80.0),
                SizedBox(height: 4.0),
                Text(
                  contact.name,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                    fontFamily: 'Lato',
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _FavoriteContacts() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _FavoriteContactTile('Family', [
          ContactInfo('Mary', 'assets/images/butterfly.png'),
          ContactInfo('Mauro Icardi', 'assets/images/icardi.jpg'),
          ContactInfo('Wesley Sneijder', 'assets/images/sneijder.jpg'),
          ContactInfo('Hagi', 'assets/images/hagi.jpg'),
          ContactInfo('Fatih Terim', 'assets/images/imparator.jpg'),
        ]),
      ],
    );
  }

  Widget _FavoriteContactTile(String title, List<ContactInfo> contacts) {
    return ExpansionTile(
      title: Text(
        title,
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      children: contacts.map((contact) {
        return ListTile(
          title: Text(contact.name),
          leading: CircleAvatar(
            backgroundImage: AssetImage(contact.imagePath),
            radius: 20.0,
          ),
        );
      }).toList(),
    );
  }
}

class ContactInfo {
  final String name;
  final String imagePath;

  ContactInfo(this.name, this.imagePath);
}
