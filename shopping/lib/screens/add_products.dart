// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:newdiv/provider/product_data.dart';
import 'package:provider/provider.dart';
import '../model/products.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});
  static const routeName = '/addProductscreen';
  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final titleFocus = FocusNode();
  final btnFocus = FocusNode();
  final priceFocus = FocusNode();
  final descriptionFocus = FocusNode();
  final imageUrlFocus = FocusNode();
  final imageController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  var prodAdd = Product(
    id: "",
    title: '',
    description: '',
    price: 0,
    imageUrl: '',
  );
  var _initValue = {
    "title": '',
    "price": 0,
    "description": "",
    "img": '',
  };
  bool inIt = true;
  imageUpdateController() {
    if (!imageUrlFocus.hasFocus) {
      if (!imageController.text.startsWith('http')) {
        return;
      }
    }
    setState(() {});
  }

  @override
  void initState() {
    imageUrlFocus.addListener(imageUpdateController);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (inIt) {
      final proID = ModalRoute.of(context)!.settings.arguments;
      if (proID != null) {
        prodAdd = Provider.of<ProductsData>(context, listen: false)
            .findByID(proID.toString());
        _initValue = {
          "title": prodAdd.title,
          "price": prodAdd.price,
          "description": prodAdd.description,
          "img": prodAdd.imageUrl,
        };
        imageController.text = _initValue['img'].toString();
      }
    }
    inIt = false;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    imageUrlFocus.removeListener(imageUpdateController);
    descriptionFocus.dispose();
    imageUrlFocus.dispose();
    priceFocus.dispose();
    btnFocus.dispose();
    titleFocus.dispose();
    super.dispose();
  }

  void onSave() {
    bool isValid = formKey.currentState!.validate();
    if (isValid) {
      formKey.currentState!.save();

      if (prodAdd.id != "") {
        Provider.of<ProductsData>(context, listen: false)
            .updateProduct(prodAdd.id, prodAdd);
      }

      Provider.of<ProductsData>(context, listen: false).addProducts(prodAdd);
    }
    Navigator.of(context).pop(false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
            key: formKey,
            child: ListView(
              children: [
                TextFormField(
                  initialValue: _initValue['title'].toString(),
                  textInputAction: TextInputAction.next,
                  focusNode: titleFocus,
                  decoration: const InputDecoration(
                    label: Text('Name'),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'empty';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.text,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(priceFocus);
                  },
                  onSaved: (nameVal) {
                    prodAdd = Product(
                      id: prodAdd.id,
                      title: nameVal!,
                      description: prodAdd.description,
                      price: prodAdd.price,
                      imageUrl: prodAdd.imageUrl,
                      isFavorite: prodAdd.isFavorite,
                    );
                  },
                ),
                TextFormField(
                  initialValue: _initValue['price'].toString(),
                  textInputAction: TextInputAction.next,
                  focusNode: priceFocus,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text('Price'),
                  ),
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(descriptionFocus);
                  },
                  onSaved: (pVal) {
                    prodAdd = Product(
                      id: prodAdd.id,
                      title: prodAdd.title,
                      description: prodAdd.description,
                      price: double.parse(pVal!),
                      imageUrl: prodAdd.imageUrl,
                      isFavorite: prodAdd.isFavorite,
                    );
                  },
                  validator: ((value) {
                    if (value!.isEmpty) {
                      return 'enter an amount ';
                    }
                    return null;
                  }),
                ),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  focusNode: descriptionFocus,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(imageUrlFocus);
                  },
                  onSaved: (desc) {
                    prodAdd = Product(
                      id: prodAdd.id,
                      title: prodAdd.title,
                      description: desc!,
                      price: prodAdd.price,
                      imageUrl: prodAdd.imageUrl,
                      isFavorite: prodAdd.isFavorite,
                    );
                  },
                  maxLines: 3,
                  initialValue: _initValue['description'].toString(),
                  decoration: const InputDecoration(
                    label: Text('description'),
                  ),
                  validator: ((value) {
                    if (value!.isEmpty) {
                      return 'enter an description ';
                    }
                    return null;
                  }),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.all(10),
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: imageController.text.isEmpty
                          ? const Text('Select image')
                          : FittedBox(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(imageController.text),
                              ),
                            ),
                    ),
                    Expanded(
                      child: TextFormField(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.url,
                        controller: imageController,
                        focusNode: imageUrlFocus,
                        decoration: const InputDecoration(
                          label: Text('image Url'),
                        ),
                        validator: (value) {
                          if (!value!.startsWith('http')) {
                            return 'not url';
                          } else if (value.isEmpty) {
                            return 'empty';
                          }
                          return null;
                        },
                        onFieldSubmitted: (_) {
                          FocusScope.of(context).requestFocus(btnFocus);
                        },
                        onSaved: (imgUr) {
                          prodAdd = Product(
                            id: prodAdd.id,
                            title: prodAdd.title,
                            description: prodAdd.description,
                            price: prodAdd.price,
                            imageUrl: imgUr!,
                            isFavorite: prodAdd.isFavorite,
                          );
                        },
                      ),
                    ),
                  ],
                ),
                OutlinedButton.icon(
                  focusNode: btnFocus,
                  onPressed: () {
                    onSave();
                  },
                  icon: const Icon(Icons.save),
                  label: const Text('save product'),
                ),
              ],
            )),
      ),
    );
  }
}
