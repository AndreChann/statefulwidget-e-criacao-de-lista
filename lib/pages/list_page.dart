import 'package:andre_3sir/pages/components/andre_card.dart';
import 'package:andre_3sir/pages/components/andre_form.dart';
import 'package:flutter/material.dart';
import 'components/andre_page.dart';
import 'model/marca_modelo_model.dart';

class ListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ListPageState();
  }
}

class _ListPageState extends State<ListPage> {
  TextEditingController registerBrandController = TextEditingController();
  TextEditingController registerModelController = TextEditingController();
  FocusNode registerBrandFocus = FocusNode();
  FocusNode registerModelFocus = FocusNode();

  List<marcaModelo> marcaModeloList = [
    marcaModelo(registerBrand: 'VW', registerModel: 'Fusca'),
    marcaModelo(registerBrand: 'Ferrari', registerModel: '458'),
    marcaModelo(registerBrand: 'Porsche', registerModel: 'GT3'),
  ];

  addNewRegister(
      {required String registerBrand, required String registerModel}) {
    setState(() {
      marcaModeloList.insert(
        0,
        marcaModelo(
          registerBrand: registerBrand,
          registerModel: registerModel,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return StandardPage(
      title: 'Insira a marca e o modelo para cadastrar',
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 15),
            StandardForm(
              label: 'Marca',
              focusNode: registerBrandFocus,
              userInputController: registerBrandController,
              onEditingComplete: () {
                registerModelFocus.nextFocus();
              },
            ),
            const SizedBox(height: 15),
            StandardForm(
              label: 'Modelo',
              focusNode: registerModelFocus,
              userInputController: registerModelController,
            ),
            const SizedBox(height: 45),
            ListView.separated(
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    height: 15,
                  );
                },
                shrinkWrap: true,
                itemCount: marcaModeloList.length,
                itemBuilder: (context, index) {
                  var registerItem = marcaModeloList[index];
                  return MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      child: andreCard(
                        leftText: registerItem.registerBrand,
                        rightText: registerItem.registerModel,
                      ),
                    ),
                  );
                }),
            const SizedBox(height: 15),
          ],
        ),
      ),
      fab: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          addNewRegister(
              registerBrand: registerBrandController.text,
              registerModel: registerModelController.text);
        },
      ),
    );
  }
}
