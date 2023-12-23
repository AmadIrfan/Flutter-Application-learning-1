import 'package:flutter/material.dart';
import 'package:newdiv1/models/products.dart';

import 'drawer.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});
  static const routName = '/addProduct';

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final titleNode = FocusNode();
  final imageNode = FocusNode();
  final saveBtnNode = FocusNode();
  final imageController = TextEditingController();
  final urlNode = FocusNode();
  final descriptionNode = FocusNode();
  final priceNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  Product newProduct = Product(
    id: "",
    title: "",
    description: "",
    price: 0,
    imageUrl: "",
  );

  @override
  void dispose() {
    saveBtnNode.dispose();
    imageNode.removeListener(imageUpdateController);
    imageController.dispose();
    titleNode.dispose();
    imageNode.dispose();
    urlNode.dispose();
    descriptionNode.dispose();
    priceNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    imageNode.addListener(imageUpdateController);
    super.initState();
  }

  imageUpdateController() {
    if (imageNode.hasFocus) {
      if (imageController.text.startsWith('http')) {
        return;
      }
    }
    setState(() {});
  }

  void onsaved() {
    bool isValid = formKey.currentState!.validate();
    if (isValid) {
      formKey.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Order'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.green,
        ),
        padding: const EdgeInsets.all(10),
        child: Form(
          child: ListView(
            children: [
              TextFormField(
                focusNode: titleNode,
                decoration: const InputDecoration(
                  label: Text('Name'),
                ),
                validator: (value) {},
                onSaved: (newValue) {},
                onFieldSubmitted: (value) {
                  FocusScope.of(context).requestFocus(descriptionNode);
                },
              ),
              TextFormField(
                focusNode: descriptionNode,
                decoration: const InputDecoration(
                  label: Text("Discription"),
                ),
                validator: (value) {},
                onSaved: (newValue) {},
                onFieldSubmitted: (value) {
                  FocusScope.of(context).requestFocus(urlNode);
                },
              ),
              TextFormField(
                focusNode: imageNode,
                controller: imageController,
                decoration: const InputDecoration(
                  label: Text('Image Url'),
                ),
                validator: (value) {},
                onSaved: (newValue) {},
                onFieldSubmitted: (value) {
                  FocusScope.of(context).requestFocus(priceNode);
                },
              ),
              TextFormField(
                focusNode: priceNode,
                decoration: const InputDecoration(
                  label: Text('Price'),
                ),
                validator: (value) {},
                onSaved: (newValue) {},
                onFieldSubmitted: (value) {
                  FocusScope.of(context).requestFocus(saveBtnNode);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: imageController.text.isEmpty
                    ? const Text("Enter a link")
                    : Image.network(
                        imageController.text.toString(),
                        fit: BoxFit.cover,
                      ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton.icon(
                focusNode: saveBtnNode,
                onPressed: () {
                  onsaved();
                },
                icon: const Icon(Icons.save),
                label: const Text('Add Prosuct'),
              ),
            ],
          ),
        ),
      ),
      drawer: const Drawer(
        child: Drawers(),
      ),
    );
  }
}
