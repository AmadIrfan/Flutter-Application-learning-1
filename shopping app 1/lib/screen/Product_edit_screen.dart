// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/Product_provider.dart';
import '../provider/product.dart';

class ProductEditScreen extends StatefulWidget {
  static const routeName = '/ProducteditScreen';
  const ProductEditScreen({Key? key}) : super(key: key);

  @override
  State<ProductEditScreen> createState() => _ProductEditScreenState();
}

class _ProductEditScreenState extends State<ProductEditScreen> {
  final imageController = TextEditingController();
  final titleNodeChange = FocusNode();
  final prieceNodeChange = FocusNode();
  final descriptionNodeChange = FocusNode();
  final imageUrlNodeChange = FocusNode();
  final _formKay = GlobalKey<FormState>();
  bool _init = true;
  bool _isLoading = false;
  var _inititalValue = {
    'title': '',
    'id': '',
    'price': '',
    'imageUrl': '',
    'description': '',
  };
  var _editProductData =
      product(id: '', title: '', imageUrl: '', price: 0.0, description: '');
  @override
  void initState() {
    imageUrlNodeChange.addListener(_imageFocus);
    super.initState();
  }

  @override
  void dispose() {
    imageUrlNodeChange.removeListener(_imageFocus);
    imageController.dispose();
    titleNodeChange.dispose();
    prieceNodeChange.dispose();
    descriptionNodeChange.dispose();
    imageUrlNodeChange.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    if (_init) {
      final proId = ModalRoute.of(context)!.settings.arguments;
      if (proId != null) {
        _editProductData =
            Provider.of<Products>(context).findById(proId.toString());
        _inititalValue = {
          'title': _editProductData.title,
          'id': _editProductData.id,
          //'imageUrl': '',
          'price': _editProductData.price.toString(),
          'description': _editProductData.description,
        };
        imageController.text = _editProductData.imageUrl;
      }
    }
    _init = false;
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  void _imageFocus() {
    if (!imageUrlNodeChange.hasFocus) {
      setState(() {});
    }
  }

  Future<void> _onSaved() async {
    bool valid = _formKay.currentState!.validate();
    if (valid) {
      _formKay.currentState?.save();
      _isLoading = true;
      if (_editProductData.id != '') {
        await Provider.of<Products>(context, listen: false)
            .updateProduct(_editProductData.id, _editProductData);
      } else {
        try {
          await Provider.of<Products>(context, listen: false)
              .addToList(_editProductData);
        } catch (error) {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Text(error.toString()),
                );
              });
        }
      }
      setState(() {
        _isLoading = false;
      });
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Products'),
        actions: [
          IconButton(
            onPressed: () {
              _onSaved();
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: _isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Form(
                key: _formKay,
                child: ListView(
                  children: [
                    TextFormField(
                      initialValue: _inititalValue['title'],
                      decoration: const InputDecoration(
                        label: Text('Title'),
                      ),
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      onSaved: (titVal) {
                        _editProductData = product(
                            id: _editProductData.id,
                            title: titVal!,
                            isFavorite: _editProductData.isFavorite,
                            imageUrl: _editProductData.imageUrl,
                            price: _editProductData.price,
                            description: _editProductData.description);
                      },
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(prieceNodeChange);
                      },
                      validator: (title) {
                        if (title!.isEmpty) {
                          return 'Please Provide a title';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      initialValue: _inititalValue['price'],
                      decoration: const InputDecoration(
                        label: Text('Price'),
                      ),
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      focusNode: prieceNodeChange,
                      onSaved: (priceVal) {
                        _editProductData = product(
                            id: _editProductData.id,
                            title: _editProductData.title,
                            isFavorite: _editProductData.isFavorite,
                            imageUrl: _editProductData.imageUrl,
                            price: double.parse(priceVal!),
                            description: _editProductData.description);
                      },
                      onFieldSubmitted: (_) {
                        FocusScope.of(context)
                            .requestFocus(descriptionNodeChange);
                      },
                      validator: (amount) {
                        if (amount!.isEmpty) {
                          return 'Plese Enter amount';
                        } else if ((double.parse(amount)) <= 0) {
                          return 'Please Enter Amount Greater then Zero';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      initialValue: _inititalValue['description'],
                      decoration: const InputDecoration(
                        label: Text('Description'),
                      ),
                      keyboardType: TextInputType.text,
                      focusNode: descriptionNodeChange,
                      onSaved: (disVal) {
                        _editProductData = product(
                          id: _editProductData.id,
                          title: _editProductData.title,
                          isFavorite: _editProductData.isFavorite,
                          imageUrl: _editProductData.imageUrl,
                          price: _editProductData.price,
                          description: disVal!,
                        );
                      },
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(imageUrlNodeChange);
                      },
                      validator: (discription) {
                        if (discription!.isEmpty) {
                          return 'Please Provide a Description';
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.next,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                            width: 100,
                            height: 100,
                            margin: const EdgeInsets.only(top: 10, right: 10),
                            decoration:
                                BoxDecoration(border: Border.all(width: 2)),
                            child: imageController.text.isEmpty
                                ? const Text('Enter Image Url')
                                : Image.network(imageController.text)),
                        Expanded(
                          child: TextFormField(
                            // initialValue: _inititalValue['imageUrl'],
                            controller: imageController,
                            decoration: const InputDecoration(
                              label: Text('Image Url'),
                            ),
                            keyboardType: TextInputType.text,
                            focusNode: imageUrlNodeChange,
                            onSaved: (imageUrlVal) {
                              _editProductData = product(
                                id: _editProductData.id,
                                title: _editProductData.title,
                                imageUrl: imageUrlVal!,
                                price: _editProductData.price,
                                description: _editProductData.description,
                                isFavorite: _editProductData.isFavorite,
                              );
                            },
                            onFieldSubmitted: (_) {
                              _onSaved();
                            },
                            validator: (imageUrl) {
                              if (imageUrl!.isEmpty) {
                                return 'Please Provide an Url';
                              }
                              return null;
                            },
                            textInputAction: TextInputAction.done,
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
      ),
    );
  }
}
