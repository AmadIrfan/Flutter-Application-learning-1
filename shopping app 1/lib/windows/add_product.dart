import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prper_provider_app/modal/product.dart';

class AddProducts extends StatefulWidget {
  const AddProducts({super.key});
  static const routeName = "/addPro";
  @override
  State<AddProducts> createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {
  final form = GlobalKey<FormState>();
  final titleNode = FocusNode();
  final priceNode = FocusNode();
  final imageNode = FocusNode();
  final discpNode = FocusNode();
  final saveNode = FocusNode();
  var intVl = {"title": "", "description": "", "price": 0, "imageUrl": ''};
  bool inIt = true;
  Product prod =
      Product(id: "", title: "", description: "", price: 0.0, imageUrl: '');
  final imgUrl = TextEditingController();
  imageListener() {
    if (!imageNode.hasFocus) {
      setState(() {});
    }
  }

  @override
  void didChangeDependencies() {
    if (inIt) {
      final id = ModalRoute.of(context)!.settings.arguments;
      if (id != Null) {
        prod = Provider.of<ProductDL>(context, listen: false).searchById(
          id.toString(),
        );
        intVl = {
          "title": prod.title,
          "description": prod.description,
          "price": prod.price,
          "imageUrl": prod.imageUrl
        };
      }
      imgUrl.text = intVl['imageUrl'].toString();
    }
    inIt = true;
    super.didChangeDependencies();
  }

  @override
  void initState() {
    imageNode.addListener(imageListener);
    super.initState();
  }

  @override
  void dispose() {
    titleNode.dispose();
    priceNode.dispose();
    imageNode.dispose();
    discpNode.dispose();
    saveNode.dispose();
    imageNode.removeListener(imageListener);

    super.dispose();
  }

  void save() {
    bool isValid = form.currentState!.validate();
    if (isValid) {
      form.currentState!.save();
      if (prod.id != "") {
        Provider.of<ProductDL>(context, listen: false).updatePro(prod.id, prod);
      }
      Provider.of<ProductDL>(context, listen: false).addProduct(prod);
      Navigator.pop(context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add products"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: form,
          child: ListView(
            children: [
              TextFormField(
                initialValue: intVl["title"].toString(),
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(discpNode);
                },
                validator: (title) {
                  if (title!.isEmpty) {
                    return 'Please Provide a title';
                  }
                  return null;
                },
                onSaved: (newValue) {
                  prod = Product(
                      id: prod.id,
                      title: newValue!,
                      description: prod.description,
                      price: prod.price,
                      imageUrl: prod.imageUrl);
                },
                focusNode: titleNode,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  label: Text('Title'),
                ),
              ),
              TextFormField(
                onFieldSubmitted: (value) {
                  FocusScope.of(context).requestFocus(priceNode);
                },
                onSaved: (newValue) {
                  prod = Product(
                      id: prod.id,
                      title: prod.title,
                      description: newValue!,
                      price: prod.price,
                      imageUrl: prod.imageUrl);
                },
                initialValue: intVl["description"].toString(),
                focusNode: discpNode,
                keyboardType: TextInputType.text,
                maxLines: 3,
                decoration: const InputDecoration(
                  label: Text('Description'),
                ),
                validator: (discription) {
                  if (discription!.isEmpty) {
                    return 'Please Provide a Description';
                  }
                  return null;
                },
              ),
              TextFormField(
                initialValue: intVl["price"].toString(),
                onFieldSubmitted: (value) {
                  FocusScope.of(context).requestFocus(imageNode);
                },
                onSaved: (newValue) {
                  prod = Product(
                      id: prod.id,
                      title: prod.title,
                      description: prod.description,
                      price: double.parse(newValue!),
                      imageUrl: prod.imageUrl);
                },
                focusNode: priceNode,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  label: Text('Price'),
                ),
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
                onFieldSubmitted: (value) {
                  FocusScope.of(context).requestFocus(saveNode);
                },
                onSaved: (newValue) {
                  prod = Product(
                      id: prod.id,
                      title: prod.title,
                      description: prod.description,
                      price: prod.price,
                      imageUrl: newValue!);
                },
                focusNode: imageNode,
                controller: imgUrl,
                keyboardType: TextInputType.url,
                decoration: const InputDecoration(
                  label: Text('Image Url'),
                ),
              ),
              Container(
                width: 200,
                height: 300,
                margin: const EdgeInsets.only(top: 10, right: 10),
                decoration: BoxDecoration(border: Border.all(width: 2)),
                child: imgUrl.text.isEmpty
                    ? const Text('Enter Image Url')
                    : Image.network(
                        imgUrl.text,
                        fit: BoxFit.cover,
                      ),
              ),
              OutlinedButton(
                focusNode: saveNode,
                onPressed: () {
                  save();
                },
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
