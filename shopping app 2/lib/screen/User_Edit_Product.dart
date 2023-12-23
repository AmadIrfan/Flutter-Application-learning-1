import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_application_impo/provider/Product.dart';
import 'package:flutter_application_impo/provider/product_provider.dart';

class UseEditProducts extends StatefulWidget {
  static const routeName = '/UserEditScreen';
  const UseEditProducts({Key? key}) : super(key: key);

  @override
  State<UseEditProducts> createState() => _UseEditProductsState();
}

class _UseEditProductsState extends State<UseEditProducts> {
  @override
  final _titleNode = FocusNode();
  final _priceNode = FocusNode();
  final _descriptionNode = FocusNode();
  final _imageNode = FocusNode();
  final _imgController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var _productEdit =
      Product(id: '', title: '', description: '', imageUrl: '', price: 0.0);
  var _isLoading = false;
  var inIt = true;
  var inItValue = {
    'id': '',
    'price': '',
    'title': '',
    'description': '',
    'imgUrl': '',
  };

  @override
  initState() {
    _imageNode.addListener(imageUpdate);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (inIt) {
      final productId = ModalRoute.of(context)!.settings.arguments;
      if (productId != null) {
        _productEdit = Provider.of<Products>(context, listen: false)
            .findById(productId.toString());
        inItValue = {
          'id': _productEdit.id,
          'price': _productEdit.price.toString(),
          'title': _productEdit.title,
          'description': _productEdit.description,
          // 'imgUrl': _productEdit.imageUrl,
          'imgUrl': '',
        };
        _imgController.text = _productEdit.imageUrl;
      }
    }
    inIt = false;
    super.didChangeDependencies();
  }

  @override
  dispose() {
    _imageNode.removeListener(imageUpdate);
    _titleNode.dispose();
    _priceNode.dispose();
    _imgController.dispose();
    _descriptionNode.dispose();
    _imageNode.dispose();

    super.dispose();
  }

  void imageUpdate() {
    if (!_imageNode.hasFocus) {
      setState(() {});
    }
  }

  Future<void> _onSaved() async {
    bool _isValid = _formKey.currentState!.validate();
    if (_isValid) {
      setState(() {
        _isLoading = true;
      });
      _formKey.currentState?.save();
      if (_productEdit.id != '') {
        await Provider.of<Products>(context, listen: false)
            .updateProduct(_productEdit.id, _productEdit);
      } else {
        try {
          await Provider.of<Products>(context, listen: false)
              .addProduct(_productEdit);
        } catch (error) {
          await showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    content: Text(error.toString()),
                    title: const Text('unExpected Error'),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('okay'))
                    ],
                  ));
        }
      }
      Navigator.of(context).pop();
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Product'),
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
                key: _formKey,
                child: ListView(
                  children: [
                    TextFormField(
                      initialValue: inItValue['title'],
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        label: Text('Title'),
                      ),
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_priceNode);
                      },
                      validator: (title) {
                        if (title!.isEmpty) {
                          return 'Please Provide a title';
                        }
                        return null;
                      },
                      onSaved: (onSaveTitle) {
                        _productEdit = Product(
                            id: _productEdit.id,
                            title: onSaveTitle!,
                            description: _productEdit.description,
                            imageUrl: _productEdit.imageUrl,
                            price: _productEdit.price,
                            isFavorite: _productEdit.isFavorite);
                      },
                      keyboardType: TextInputType.text,
                    ),
                    TextFormField(
                      initialValue: inItValue['price'],
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        label: Text('Amount'),
                      ),
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_descriptionNode);
                      },
                      focusNode: _priceNode,
                      validator: (amount) {
                        if (amount!.isEmpty) {
                          return 'Plese Enter amount';
                        } else if ((double.parse(amount)) <= 0) {
                          return 'Please Enter Amount Greater then Zero';
                        }
                        return null;
                      },
                      onSaved: (onSaveAmount) {
                        _productEdit = Product(
                            id: _productEdit.id,
                            title: _productEdit.title,
                            description: _productEdit.description,
                            imageUrl: _productEdit.imageUrl,
                            price: double.parse(onSaveAmount!),
                            isFavorite: _productEdit.isFavorite);
                      },
                      keyboardType: TextInputType.number,
                    ),
                    TextFormField(
                      initialValue: inItValue['description'],
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        label: Text('Description'),
                      ),
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_imageNode);
                      },
                      validator: (discription) {
                        if (discription!.isEmpty) {
                          return 'Please Provide a Description';
                        }
                        return null;
                      },
                      onSaved: (onSaveDescription) {
                        _productEdit = Product(
                            id: _productEdit.id,
                            title: _productEdit.title,
                            description: onSaveDescription!,
                            imageUrl: _productEdit.imageUrl,
                            price: _productEdit.price,
                            isFavorite: _productEdit.isFavorite);
                      },
                      maxLines: 3,
                      keyboardType: TextInputType.multiline,
                      focusNode: _descriptionNode,
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
                            child: _imgController.text.isEmpty
                                ? const Text('Enter Image Url')
                                : Image.network(_imgController.text)),
                        Expanded(
                          child: TextFormField(
                            // initialValue: inItValue['imgUrl'],
                            textInputAction: TextInputAction.done,
                            controller: _imgController,
                            decoration: const InputDecoration(
                              label: Text('ImageUrl'),
                            ),
                            onSaved: (onSaveImageUrl) {
                              _productEdit = Product(
                                  id: _productEdit.id,
                                  title: _productEdit.title,
                                  description: _productEdit.description,
                                  imageUrl: onSaveImageUrl!,
                                  price: _productEdit.price,
                                  isFavorite: _productEdit.isFavorite);
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
                            keyboardType: TextInputType.multiline,
                            focusNode: _imageNode,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
