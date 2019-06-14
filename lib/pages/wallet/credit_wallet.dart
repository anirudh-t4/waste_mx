import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../scoped_models/main.dart';
import '../../models/transaction.dart';

import '../../widgets/custom_text.dart' as customText;

class CreditWalletPage extends StatefulWidget {
  @override
  _CreditWalletPageState createState() => _CreditWalletPageState();
}

class _CreditWalletPageState extends State<CreditWalletPage> {
  GlobalKey<FormState> _cardDetailsFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> _amountFormKey = GlobalKey<FormState>();

  CardDetails _cardDetails = CardDetails();

  TextEditingController _expiryFieldController = TextEditingController();
  
  @override
  void initState() {
    _expiryFieldController.addListener((){
      if(_expiryFieldController.text.length == 2){
        // setState(() {
        //   _expiryFieldController.
        //  _expiryFieldController.text = _expiryFieldController.value.text + "/"; 
        // });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Credit Wallet'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 18, horizontal: 20),
        child: Center(
          child: ListView(
            shrinkWrap: true,
            // mainAxisSize: MainAxisSize.min,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              customText.TitleText(
                text: 'Card Details', textColor: Colors.black,
              ),
              SizedBox(
                height: 15,
              ),
              Form(
                key: _cardDetailsFormKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Name on Card",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      validator: (String value){
                        if(value.isEmpty) return "This field is required";
                      },
                      onSaved: (String value){
                        _cardDetails.name = value;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Card Number",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      validator: (String value){
                        if(value.isEmpty) return "This field is required";
                        else if(int.tryParse(value) == null) return "Invalid Card Number";
                      },
                      keyboardType: TextInputType.number,
                      onSaved: (String value){
                        _cardDetails.number = value;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: <Widget>[
                        Flexible(
                          child: TextFormField(
                            controller: _expiryFieldController,
                            decoration: InputDecoration(
                              labelText: "Expiry Date",
                              hintText: "09/19",
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                            ),
                            validator: (String value){
                              if(value.isEmpty) return "This field is required";
                              if(!value.contains("/")) return "Invalid Date";
                              List<String> vals = value.split("/");
                              if(int.tryParse(vals[0]) == null || int.tryParse(vals[1]) == null) return "Invalid Date";
                            },
                            onSaved: (String value){
                              _cardDetails.expiryDate = value;
                            },
                          ),
                        ),
                        SizedBox(width: 20,),
                        Flexible(
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: "CVV",
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                            ),
                            validator: (String value){
                              if(value.isEmpty) return "This field is required";
                            },
                            keyboardType: TextInputType.number,
                            onSaved: (String value){
                              _cardDetails.cvv = value;
                            },
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              customText.TitleText(text: "Amount", textColor: Colors.black,),
              SizedBox(
                height: 15,
              ),
              Form(
                key: _amountFormKey,
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.account_balance_wallet),
                    labelText: 'amount',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  validator: (String value){
                    if(value.isEmpty) return "This field is required";
                  },
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Center(
                child: ScopedModelDescendant<MainModel>(
                  builder: (BuildContext context, Widget child, MainModel model){
                    return _buildSubmitButton(model);
                  },
                )
              ),
              FlatButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.info_outline),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Why use Waste MX Wallet')
                  ],
                ),
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSubmitButton(MainModel model) {
    return model.isLoading ? CircularProgressIndicator() : RaisedButton(
      child: customText.BodyText(
        text: 'Proceed',
        textColor: Colors.white,
      ),
      onPressed: () {
        model.creditWallet(100, _cardDetails);
        // if(_cardDetailsFormKey.currentState.validate() && _amountFormKey.currentState.validate()){
        //   _cardDetailsFormKey.currentState.save();
        //   _amountFormKey.currentState.save();
          
        // }
      },
    );
  }

  @override
  void dispose() {
    _expiryFieldController.dispose();
    super.dispose();
  }
}