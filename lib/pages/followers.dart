import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FollowersPage extends StatefulWidget {
  FollowersPage({Key key}) : super(key: key);

  @override
  _FollowersPageState createState() => _FollowersPageState();
}

class DemoInfo {
  final String email;
  final String image;
  final String lastSeen;
  final String name;
  DemoInfo({this.email, this.image, this.lastSeen, this.name});
}

class _FollowersPageState extends State<FollowersPage> {
  double _altodevice;
  double _anchodevice;
  @override
  void initState() {
    super.initState();

    Firestore.instance
        .collection('Users')
        //.where("topic", isEqualTo: "flutter")
        .snapshots()
        .listen((data) => data.documents.forEach((doc) => print(doc['name'])));
  }

  @override
  Widget build(BuildContext context) {
    _altodevice = MediaQuery.of(context).size.height;
    _anchodevice = MediaQuery.of(context).size.width;
    return Material(
      child: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('Followers Page'),
          // backgroundColor: CupertinoTheme.of(context).barBackgroundColor,
          backgroundColor: CupertinoColors.activeBlue,
        ),
        backgroundColor: CupertinoColors.white,
        child: CustomScrollView(
          slivers: <Widget>[
            // CupertinoSliverNavigationBar(
            //   largeTitle: Text('Followers Page'),
            // ),
            SliverSafeArea(
                sliver: StreamBuilder<QuerySnapshot>(
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData)
                  return SliverToBoxAdapter(
                    child: CupertinoActivityIndicator(),
                  );
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    return _buildListItem(
                        context, snapshot.data.documents[index]);
                  }, childCount: snapshot.data.documents.length),
                );
              },
              stream: Firestore.instance.collection('Users').snapshots(),
            ))
          ],
        ),
      ),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    return ListTile(
      leading: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          // Icon(
          //   CupertinoIcons.person_add_solid,
          //   size: 53,
          // ),
          Container(
            height: _altodevice * 0.10,
            width: _anchodevice * 0.15,
            decoration: BoxDecoration(
                color: CupertinoColors.systemGrey4,
                borderRadius: BorderRadius.circular(500),
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(document['image']))),
          ),
        ],
      ),
      title: Text(
        document['name'],
        style: TextStyle(fontSize: 23),
      ),
      subtitle: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            //color: CupertinoColors.activeGreen,
            child: Text(
              document['email'].toString(),
              style: TextStyle(fontSize: 22),
            ),
          ),

          //Icon(CupertinoIcons.right_chevron),
        ],
      ),
    );
  }
}
