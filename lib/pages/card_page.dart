import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: CustomScrollView(
      slivers: <Widget>[
        CupertinoSliverNavigationBar(
          largeTitle: Text('Cards'),
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          _cardTipo1(),
          _cardTipo2(context),
        ]))
      ],
    ));
  }

  Widget _cardTipo1() {
    return Card(
      margin: EdgeInsets.all(20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 15,
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(CupertinoIcons.photo_camera),
            title: Text('This is a card example'),
            subtitle: Text(
                'This is a subtitle lore   some text here to fill the space trying do not show the material imports '),
          )
        ],
      ),
    );
  }

  Widget _cardTipo2(BuildContext contex) {
    final _card = Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        FadeInImage(
          height: 300,
          placeholder: AssetImage('assets/cupertino_activity_indicator.gif'),
          image:
              NetworkImage('https://jooinn.com/images/perfect-landscape-1.jpg'),
          fit: BoxFit.cover,
          fadeInDuration: Duration(milliseconds: 200),
        ),
        Opacity(
          opacity: .6,
          child: Container(
            height: 80.0,
            width: double.infinity,
            color: CupertinoColors.black,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '2020-07-04',
                  style: TextStyle(color: CupertinoColors.white),
                ),
                Text(
                  'Los Azufres Michoacán',
                  style:
                      TextStyle(color: CupertinoColors.white, fontSize: 25.0),
                )
              ],
            ),
          ),
        )
      ],
    );

    return Container(
      //height: 100.0,
      margin: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        //color: CupertinoColors.activeBlue,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
              color: CupertinoColors.darkBackgroundGray.withOpacity(.7),
              offset: Offset(0.0, 5.0),
              blurRadius: 8.0)
        ],
      ),
      child: ClipRRect(borderRadius: BorderRadius.circular(10.0), child: _card),
    );
  }
}
