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
    return Material(
      child: CupertinoPageScaffold(
        backgroundColor: CupertinoColors.white,
        child: CustomScrollView(
          slivers: <Widget>[
            CupertinoSliverNavigationBar(
              largeTitle: Text('Followers Page'),
            ),
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
      title: Text(document['name']),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(document['email'].toString()),
          Icon(CupertinoIcons.right_chevron),
        ],
      ),
    );
  }
}
