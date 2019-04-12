import 'package:flutter/material.dart';

import '../../widgets/custom_text.dart' as customText;
import '../../models/update.dart';

import '../wallet.dart';
import './offerings.dart';

class VendorHomePage extends StatelessWidget{
  final double pad_vertical = 13.0;

  //* Get data from server
  // final Map<String, List<Map<String, dynamic>>> _wasteOffers = {
  //   'Household waste': [
  //     {'id': '00223s', 'imageUrl': 'assets/organic.png', 'type': 'Organic', 'price': 'N20/kg'},
  //     {'id': '2er2f23s', 'imageUrl': 'assets/organic.png', 'type': 'Organic', 'price': 'N20/kg'},
  //     {'id': 'qw2s23s', 'imageUrl': 'assets/organic.png', 'type': 'Organic', 'price': 'N20/kg'},
  //   ],
  //   'Office waste': [
  //     {'id': '222zx3s', 'imageUrl': 'assets/organic.png', 'type': 'Organic', 'price': 'N20/kg'},
  //     {'id': '2wjd2f23s', 'imageUrl': 'assets/organic.png', 'type': 'Organic', 'price': 'N20/kg'},
  //     {'id': '22pls23s', 'imageUrl': 'assets/organic.png', 'type': 'Organic', 'price': 'N20/kg'},
  //   ],
  //   'Sewage': [
  //     {'id': '222p3s', 'imageUrl': 'assets/organic.png', 'type': 'Organic', 'price': 'N20/kg'},
  //     {'id': '22f23s', 'imageUrl': 'assets/organic.png', 'type': 'Organic', 'price': 'N20/kg'},
  //     {'id': '22s23s', 'imageUrl': 'assets/organic.png', 'type': 'Organic', 'price': 'N20/kg'},
  //   ]
  // };

  

  double _targetWidth = 0;

  double _getSize(final double default_1440){
    return (default_1440 / 14) * (0.0027 * _targetWidth + 10.136);
  }

  Widget _buildTopSection(BuildContext context){
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/waste_home.jpg'),
          colorFilter: ColorFilter.mode(
            Colors.black54,
            BlendMode.darken
          ),
          fit: BoxFit.cover
        ),
      ),
      child: Column(
        children: <Widget>[
          // Container(
          //   padding: EdgeInsets.symmetric(horizontal: 10, vertical: pad_vertical),
          //   child: Text(
          //     'You earned 50 points just for installation, check your wallet',
          //     textAlign: TextAlign.center,
          //     style: TextStyle(
          //       fontWeight: FontWeight.bold,
          //       color: Colors.white,
          //     ),
          //   ),
          // ),
          // OutlineButton(
          //   child: Text('Search vendor recycler'),
          // ),
          SizedBox(height: 30,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: pad_vertical),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: FlatButton(
                    padding: EdgeInsets.symmetric(vertical: 13.5),
                    color: Colors.white,
                    shape: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(100),
                        bottomLeft: Radius.circular(100),
                        topRight: Radius.circular(0),
                        bottomRight: Radius.circular(0)
                      ),
                    ),
                    child: Text('View Client Offerings'),
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => OfferingsPage()
                      ));
                    },
                  ),
                ),
                FlatButton(
                  child: Icon(Icons.remove_red_eye, color: Colors.white,),
                  color: Theme.of(context).accentColor,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(0),
                        bottomLeft: Radius.circular(0),
                        topRight: Radius.circular(100),
                        bottomRight: Radius.circular(100)
                    ),
                  ),
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => OfferingsPage()
                    ));
                  },
                )
              ],
            ),
            /*TextField(
                onTap: () => Navigator.pushNamed(context, 'search'),
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'Search vendor recycler',
                    suffixIcon: Icon(Icons.search)
                ),
              )*/
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(top: pad_vertical, bottom: 0, left: 10, right: 10),
            child: Text(
              'Make money with waste',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(top: 5, bottom: 18, left: 10, right: 10),
            child: Text(
              'Get access to clients in need of waste collectors, scavengers, recycling agents/centers, de-clusters, etc',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }

  final List<Update> _messages = [
    Update(
      icon: Icon(Icons.account_balance_wallet),
      title: 'Earned Coins',
      message: 'You earned 50 points just for installation, check your wallet',
      action: 'WALLET',
    ),
    Update(
      icon: Icon(Icons.done_all),
      title: 'Transaction Complete',
      message: 'Household Waste disposal',
      action: 'VIEW',
    ),
    Update(
      icon: Icon(Icons.account_balance_wallet),
      title: 'Earned Coins',
      message: 'You earned 100 points just for installation, check your wallet',
      action: 'WALLET',
    ),
  ];
  
  Widget _buildMessagesSection(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10,),
      child: Column(
        children: List.generate(_messages.length, (int index) => Card(
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: _messages[index].icon,
                  title: Text(_messages[index].title),
                  subtitle: Text(_messages[index].message),
                ),
                ButtonTheme.bar(
                  child: ButtonBar(
                    children: <Widget>[
                      FlatButton(
                        child: Text(_messages[index].action),
                        onPressed: (){
                          
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
          ),

        )),
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    _targetWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Waste MX'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){

            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              _buildTopSection(context),
              SizedBox(height: 20,),
              _buildMessagesSection()
            ],
          ),
        ),
      ),
    );
  }
}