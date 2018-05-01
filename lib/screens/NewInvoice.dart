import 'package:flutter/material.dart';

import '../objects/InvoiceFormData.dart';

class NewInvoice extends StatefulWidget {
  int _invoiceNumber;
  NewInvoice(this._invoiceNumber);
  @override
  NewInvoiceState createState() {
    return new NewInvoiceState();
  }
}

class NewInvoiceState extends State<NewInvoice> {
  var _formData = new InvoiceFormData();
  TextEditingController _invoiceDateController, _supplyDateController;

  @override
  void initState() {
    _invoiceDateController =
        new TextEditingController(text: _formData.invoiceDate);
    _supplyDateController =
        new TextEditingController(text: _formData.supplyDate);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.blueAccent,
      child: new Center(
          child: new Form(
              child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Padding(
            padding: const EdgeInsets.fromLTRB(12.0, 4.0, 12.0, 4.0),
            child: new TextFormField(
              decoration: new InputDecoration(
                  labelText: "Invoice Id",
                  labelStyle: new TextStyle(color: Colors.black),
                  fillColor: Colors.white,
                  border: new UnderlineInputBorder(
                      borderSide: new BorderSide(color: Colors.white)),
                  contentPadding: new EdgeInsets.all(2.0)),
              initialValue: '${widget._invoiceNumber}/18-19',
              onFieldSubmitted: ((value) {
                _formData.invoiceNumber = value;
              }),
            ),
          ),
          new Padding(
            padding: const EdgeInsets.fromLTRB(12.0, 4.0, 12.0, 4.0),
            child: new TextField(
              controller: _invoiceDateController,
              decoration: new InputDecoration(
                  labelText: "Invoice Date",
                  labelStyle: new TextStyle(color: Colors.black),
                  fillColor: Colors.white,
                  border: new UnderlineInputBorder(
                      borderSide: new BorderSide(color: Colors.white)),
                  contentPadding: new EdgeInsets.all(2.0)),
              onChanged: (value) => {
                    _formData.invoiceDate = value: String,
                    checkAndUpdateValue(value): String,
                  },
            ),
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text("Same As Above",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold)),
              new Checkbox(
                tristate: false,
                value: _formData.sameAsAbove,
                onChanged: (value) => {
                      setState(() {
                        _formData.sameAsAbove = value;
                        if (_formData.sameAsAbove) {
                          _formData.supplyDate = _formData.invoiceDate;
                          _supplyDateController.text = _formData.invoiceDate;
                          print('${_formData.supplyDate}');
                        }
                      }): bool
                    },
              ),
            ],
          ),
          new Padding(
            padding: const EdgeInsets.fromLTRB(12.0, 4.0, 12.0, 4.0),
            child: new TextField(
              enabled: !_formData.sameAsAbove,
              controller: _supplyDateController,
              decoration: new InputDecoration(
                  labelText: "Supply Date",
                  labelStyle: new TextStyle(color: Colors.black),
                  fillColor: Colors.white,
                  border: new UnderlineInputBorder(
                      borderSide: new BorderSide(color: Colors.white)),
                  contentPadding: new EdgeInsets.all(2.0)),
              onChanged: (value) => _formData.supplyDate = value,
            ),
          )
        ],
      ))),
    );
  }

  checkAndUpdateValue(String value) {
    if (_formData.sameAsAbove) {
      _formData.supplyDate = value;
      this.setState(() {
        _supplyDateController.text = _formData.supplyDate;
        print(_formData.supplyDate);
      });
    }
  }
}
