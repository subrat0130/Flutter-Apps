import 'dart:io' show Platform;

import 'package:bitcoin_ticker/jsonToText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'INR';
  String BTCvalue = '?';
  String ETHvalue = '?';
  String LTCvalue = '?';
  String holder;
  DropdownButton androidDropDown() {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String currency in currenciesList) {
      dropDownItems.add(
        DropdownMenuItem(
          child: Text(currency),
          value: currency,
        ),
      );
    }
    return DropdownButton<String>(
      value: selectedCurrency,
      items: dropDownItems,
      onChanged: (value) async {
        setState(
          () {
            selectedCurrency = value;
            currentRateBTC(selectedCurrency);
            currentRateETH(selectedCurrency);
            currentRateLTC(selectedCurrency);
          },
        );
      },
    );
  }

  CupertinoPicker iosPicker() {
    List<Text> pickerList = [];
    for (String currency in currenciesList) {
      pickerList.add(Text(currency));
    }
    return CupertinoPicker(
      itemExtent: 30,
      onSelectedItemChanged: (selectedIndex) {
        print(selectedIndex);
        currentRateBTC(selectedCurrency);
        currentRateETH(selectedCurrency);
        currentRateLTC(selectedCurrency);
      },
      children: pickerList,
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentRateBTC(selectedCurrency);
    currentRateETH(selectedCurrency);
    currentRateLTC(selectedCurrency);
  }

  void currentRateBTC(String selectedCurrency) async {
    holder=await CoinValue.valueText('BTC', selectedCurrency);
    setState(() {
      BTCvalue = holder;
    });
  }

  void currentRateETH(String selectedCurrency) async {
    holder=await CoinValue.valueText('ETH', selectedCurrency);
    setState(() {
      ETHvalue = holder;
    });
  }

  void currentRateLTC(String selectedCurrency) async {
    holder=await CoinValue.valueText('LTC', selectedCurrency);
    setState(() async {
      LTCvalue = holder;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  BTCvalue,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  ETHvalue,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  LTCvalue,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isAndroid ? androidDropDown() : iosPicker(),
          ),
        ],
      ),
    );
  }
}
