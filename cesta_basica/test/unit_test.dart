import 'package:cesta_basica/app/controllers/basicbasket/basicbasket.detail.controller.dart';
import 'package:cesta_basica/app/models/basicbasketproduct.model.dart';
import 'package:cesta_basica/app/models/product.model.dart';
import 'package:cesta_basica/app/repositories/basicbasket.product.repository.dart';
import 'package:cesta_basica/app/repositories/product.repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class BasicBasketProductRepositoryMock extends Mock
    implements BasicBasketProductRepository {}

class ProductRepositoryMock extends Mock implements ProductRepository {}

final productRepositoryMock = ProductRepositoryMock();
final basicBasketProductRepositoryMock = BasicBasketProductRepositoryMock();
final basicBasketDetailController = BasicBasketDetailController(
    basicBasketProductRepositoryMock, productRepositoryMock);

void main() {
  test("Test Controller - Method Carrega List Produtcs - With Return Producs",
      () async {
    when(productRepositoryMock.getProduct(any)).thenAnswer((_) async {
      return ProductModel(
          brand: "Teste", id: 1, image: "", name: "Teste", stock: 2, value: 10);
    });
    when(basicBasketProductRepositoryMock.productsInBasicBasket(any))
        .thenAnswer((_) async {
      var data = <BasicBasketProductModel>[];
      data.add(BasicBasketProductModel(
          amount: 10, basicbasketsId: 1, id: 1, productsId: 1));
      return data;
    });
    await basicBasketDetailController.carregaListProducts(123);
    expect(basicBasketDetailController.listProducts[0].id, 1);
    expect(basicBasketDetailController.listProducts[0].brand, "Teste");
    expect(basicBasketDetailController.listProducts[0].name, "Teste");
    expect(basicBasketDetailController.listProducts[0].stock, 2);
    expect(basicBasketDetailController.listProducts[0].value, 10);
  });
  test("Test Controller - Method Carrega List Produtcs - With Return Producs",
      () async {
    when(productRepositoryMock.getProduct(any)).thenAnswer((_) async {
      return ProductModel(
          brand: "Teste", id: 1, image: "", name: "Teste", stock: 2, value: 10);
    });
    when(basicBasketProductRepositoryMock.productsInBasicBasket(any))
        .thenAnswer((_) async {
      var data = <BasicBasketProductModel>[];
      data.add(BasicBasketProductModel(
          amount: 10, basicbasketsId: 1, id: 1, productsId: 1));
      return data;
    });
    await basicBasketDetailController.carregaListProducts(123);
    expect(basicBasketDetailController.listProducts[0].id, 1);
    expect(basicBasketDetailController.listProducts[0].brand, "Teste");
    expect(basicBasketDetailController.listProducts[0].name, "Teste");
    expect(basicBasketDetailController.listProducts[0].stock, 2);
    expect(basicBasketDetailController.listProducts[0].value, 10);
  });
  test("Test Controller - Method Carrega List Produtcs - With Return Producs",
      () async {
    when(productRepositoryMock.getProduct(any)).thenAnswer((_) async {
      return ProductModel(
          brand: "Teste", id: 1, image: "", name: "Teste", stock: 2, value: 10);
    });
    when(basicBasketProductRepositoryMock.productsInBasicBasket(any))
        .thenAnswer((_) async {
      var data = <BasicBasketProductModel>[];
      data.add(BasicBasketProductModel(
          amount: 10, basicbasketsId: 1, id: 1, productsId: 1));
      return data;
    });
    await basicBasketDetailController.carregaListProducts(123);
    expect(basicBasketDetailController.listProducts[0].id, 1);
    expect(basicBasketDetailController.listProducts[0].brand, "Teste");
    expect(basicBasketDetailController.listProducts[0].name, "Teste");
    expect(basicBasketDetailController.listProducts[0].stock, 2);
    expect(basicBasketDetailController.listProducts[0].value, 10);
  });
  test("Test Controller - Method Carrega List Produtcs - With Return Producs",
      () async {
    when(productRepositoryMock.getProduct(any)).thenAnswer((_) async {
      return ProductModel(
          brand: "Teste", id: 1, image: "", name: "Teste", stock: 2, value: 10);
    });
    when(basicBasketProductRepositoryMock.productsInBasicBasket(any))
        .thenAnswer((_) async {
      var data = <BasicBasketProductModel>[];
      data.add(BasicBasketProductModel(
          amount: 10, basicbasketsId: 1, id: 1, productsId: 1));
      return data;
    });
    await basicBasketDetailController.carregaListProducts(123);
    expect(basicBasketDetailController.listProducts[0].id, 1);
    expect(basicBasketDetailController.listProducts[0].brand, "Teste");
    expect(basicBasketDetailController.listProducts[0].name, "Teste");
    expect(basicBasketDetailController.listProducts[0].stock, 2);
    expect(basicBasketDetailController.listProducts[0].value, 10);
  });
  test("Test Controller - Method Carrega List Produtcs - With Return Producs",
      () async {
    when(productRepositoryMock.getProduct(any)).thenAnswer((_) async {
      return ProductModel(
          brand: "Teste", id: 1, image: "", name: "Teste", stock: 2, value: 10);
    });
    when(basicBasketProductRepositoryMock.productsInBasicBasket(any))
        .thenAnswer((_) async {
      var data = <BasicBasketProductModel>[];
      data.add(BasicBasketProductModel(
          amount: 10, basicbasketsId: 1, id: 1, productsId: 1));
      return data;
    });
    await basicBasketDetailController.carregaListProducts(123);
    expect(basicBasketDetailController.listProducts[0].id, 1);
    expect(basicBasketDetailController.listProducts[0].brand, "Teste");
    expect(basicBasketDetailController.listProducts[0].name, "Teste");
    expect(basicBasketDetailController.listProducts[0].stock, 2);
    expect(basicBasketDetailController.listProducts[0].value, 10);
  });
  test("Test Controller - Method Carrega List Produtcs - With Return Producs",
      () async {
    when(productRepositoryMock.getProduct(any)).thenAnswer((_) async {
      return ProductModel(
          brand: "Teste", id: 1, image: "", name: "Teste", stock: 2, value: 10);
    });
    when(basicBasketProductRepositoryMock.productsInBasicBasket(any))
        .thenAnswer((_) async {
      var data = <BasicBasketProductModel>[];
      data.add(BasicBasketProductModel(
          amount: 10, basicbasketsId: 1, id: 1, productsId: 1));
      return data;
    });
    await basicBasketDetailController.carregaListProducts(123);
    expect(basicBasketDetailController.listProducts[0].id, 1);
    expect(basicBasketDetailController.listProducts[0].brand, "Teste");
    expect(basicBasketDetailController.listProducts[0].name, "Teste");
    expect(basicBasketDetailController.listProducts[0].stock, 2);
    expect(basicBasketDetailController.listProducts[0].value, 10);
  });
  test("Test Controller - Method Carrega List Produtcs - With Return Producs",
      () async {
    when(productRepositoryMock.getProduct(any)).thenAnswer((_) async {
      return ProductModel(
          brand: "Teste", id: 1, image: "", name: "Teste", stock: 2, value: 10);
    });
    when(basicBasketProductRepositoryMock.productsInBasicBasket(any))
        .thenAnswer((_) async {
      var data = <BasicBasketProductModel>[];
      data.add(BasicBasketProductModel(
          amount: 10, basicbasketsId: 1, id: 1, productsId: 1));
      return data;
    });
    await basicBasketDetailController.carregaListProducts(123);
    expect(basicBasketDetailController.listProducts[0].id, 1);
    expect(basicBasketDetailController.listProducts[0].brand, "Teste");
    expect(basicBasketDetailController.listProducts[0].name, "Teste");
    expect(basicBasketDetailController.listProducts[0].stock, 2);
    expect(basicBasketDetailController.listProducts[0].value, 10);
  });
  test("Test Controller - Method Carrega List Produtcs - With Return Producs",
      () async {
    when(productRepositoryMock.getProduct(any)).thenAnswer((_) async {
      return ProductModel(
          brand: "Teste", id: 1, image: "", name: "Teste", stock: 2, value: 10);
    });
    when(basicBasketProductRepositoryMock.productsInBasicBasket(any))
        .thenAnswer((_) async {
      var data = <BasicBasketProductModel>[];
      data.add(BasicBasketProductModel(
          amount: 10, basicbasketsId: 1, id: 1, productsId: 1));
      return data;
    });
    await basicBasketDetailController.carregaListProducts(123);
    expect(basicBasketDetailController.listProducts[0].id, 1);
    expect(basicBasketDetailController.listProducts[0].brand, "Teste");
    expect(basicBasketDetailController.listProducts[0].name, "Teste");
    expect(basicBasketDetailController.listProducts[0].stock, 2);
    expect(basicBasketDetailController.listProducts[0].value, 10);
  });
  test("Test Controller - Method Carrega List Produtcs - With Return Producs",
      () async {
    when(productRepositoryMock.getProduct(any)).thenAnswer((_) async {
      return ProductModel(
          brand: "Teste", id: 1, image: "", name: "Teste", stock: 2, value: 10);
    });
    when(basicBasketProductRepositoryMock.productsInBasicBasket(any))
        .thenAnswer((_) async {
      var data = <BasicBasketProductModel>[];
      data.add(BasicBasketProductModel(
          amount: 10, basicbasketsId: 1, id: 1, productsId: 1));
      return data;
    });
    await basicBasketDetailController.carregaListProducts(123);
    expect(basicBasketDetailController.listProducts[0].id, 1);
    expect(basicBasketDetailController.listProducts[0].brand, "Teste");
    expect(basicBasketDetailController.listProducts[0].name, "Teste");
    expect(basicBasketDetailController.listProducts[0].stock, 2);
    expect(basicBasketDetailController.listProducts[0].value, 10);
  });
  test("Test Controller - Method Carrega List Produtcs - With Return Producs",
      () async {
    when(productRepositoryMock.getProduct(any)).thenAnswer((_) async {
      return ProductModel(
          brand: "Teste", id: 1, image: "", name: "Teste", stock: 2, value: 10);
    });
    when(basicBasketProductRepositoryMock.productsInBasicBasket(any))
        .thenAnswer((_) async {
      var data = <BasicBasketProductModel>[];
      data.add(BasicBasketProductModel(
          amount: 10, basicbasketsId: 1, id: 1, productsId: 1));
      return data;
    });
    await basicBasketDetailController.carregaListProducts(123);
    expect(basicBasketDetailController.listProducts[0].id, 1);
    expect(basicBasketDetailController.listProducts[0].brand, "Teste");
    expect(basicBasketDetailController.listProducts[0].name, "Teste");
    expect(basicBasketDetailController.listProducts[0].stock, 2);
    expect(basicBasketDetailController.listProducts[0].value, 10);
  });
  test("Test Controller - Method Carrega List Produtcs - With Return Producs",
      () async {
    when(productRepositoryMock.getProduct(any)).thenAnswer((_) async {
      return ProductModel(
          brand: "Teste", id: 1, image: "", name: "Teste", stock: 2, value: 10);
    });
    when(basicBasketProductRepositoryMock.productsInBasicBasket(any))
        .thenAnswer((_) async {
      var data = <BasicBasketProductModel>[];
      data.add(BasicBasketProductModel(
          amount: 10, basicbasketsId: 1, id: 1, productsId: 1));
      return data;
    });
    await basicBasketDetailController.carregaListProducts(123);
    expect(basicBasketDetailController.listProducts[0].id, 1);
    expect(basicBasketDetailController.listProducts[0].brand, "Teste");
    expect(basicBasketDetailController.listProducts[0].name, "Teste");
    expect(basicBasketDetailController.listProducts[0].stock, 2);
    expect(basicBasketDetailController.listProducts[0].value, 10);
  });
  test("Test Controller - Method Carrega List Produtcs - With Return Producs",
      () async {
    when(productRepositoryMock.getProduct(any)).thenAnswer((_) async {
      return ProductModel(
          brand: "Teste", id: 1, image: "", name: "Teste", stock: 2, value: 10);
    });
    when(basicBasketProductRepositoryMock.productsInBasicBasket(any))
        .thenAnswer((_) async {
      var data = <BasicBasketProductModel>[];
      data.add(BasicBasketProductModel(
          amount: 10, basicbasketsId: 1, id: 1, productsId: 1));
      return data;
    });
    await basicBasketDetailController.carregaListProducts(123);
    expect(basicBasketDetailController.listProducts[0].id, 1);
    expect(basicBasketDetailController.listProducts[0].brand, "Teste");
    expect(basicBasketDetailController.listProducts[0].name, "Teste");
    expect(basicBasketDetailController.listProducts[0].stock, 2);
    expect(basicBasketDetailController.listProducts[0].value, 10);
  });
  test("Test Controller - Method Carrega List Produtcs - With Return Producs",
      () async {
    when(productRepositoryMock.getProduct(any)).thenAnswer((_) async {
      return ProductModel(
          brand: "Teste", id: 1, image: "", name: "Teste", stock: 2, value: 10);
    });
    when(basicBasketProductRepositoryMock.productsInBasicBasket(any))
        .thenAnswer((_) async {
      var data = <BasicBasketProductModel>[];
      data.add(BasicBasketProductModel(
          amount: 10, basicbasketsId: 1, id: 1, productsId: 1));
      return data;
    });
    await basicBasketDetailController.carregaListProducts(123);
    expect(basicBasketDetailController.listProducts[0].id, 1);
    expect(basicBasketDetailController.listProducts[0].brand, "Teste");
    expect(basicBasketDetailController.listProducts[0].name, "Teste");
    expect(basicBasketDetailController.listProducts[0].stock, 2);
    expect(basicBasketDetailController.listProducts[0].value, 10);
  });
  test("Test Controller - Method Carrega List Produtcs - With Return Producs",
      () async {
    when(productRepositoryMock.getProduct(any)).thenAnswer((_) async {
      return ProductModel(
          brand: "Teste", id: 1, image: "", name: "Teste", stock: 2, value: 10);
    });
    when(basicBasketProductRepositoryMock.productsInBasicBasket(any))
        .thenAnswer((_) async {
      var data = <BasicBasketProductModel>[];
      data.add(BasicBasketProductModel(
          amount: 10, basicbasketsId: 1, id: 1, productsId: 1));
      return data;
    });
    await basicBasketDetailController.carregaListProducts(123);
    expect(basicBasketDetailController.listProducts[0].id, 1);
    expect(basicBasketDetailController.listProducts[0].brand, "Teste");
    expect(basicBasketDetailController.listProducts[0].name, "Teste");
    expect(basicBasketDetailController.listProducts[0].stock, 2);
    expect(basicBasketDetailController.listProducts[0].value, 10);
  });
  test("Test Controller - Method Carrega List Produtcs - With Return Producs",
      () async {
    when(productRepositoryMock.getProduct(any)).thenAnswer((_) async {
      return ProductModel(
          brand: "Teste", id: 1, image: "", name: "Teste", stock: 2, value: 10);
    });
    when(basicBasketProductRepositoryMock.productsInBasicBasket(any))
        .thenAnswer((_) async {
      var data = <BasicBasketProductModel>[];
      data.add(BasicBasketProductModel(
          amount: 10, basicbasketsId: 1, id: 1, productsId: 1));
      return data;
    });
    await basicBasketDetailController.carregaListProducts(123);
    expect(basicBasketDetailController.listProducts[0].id, 1);
    expect(basicBasketDetailController.listProducts[0].brand, "Teste");
    expect(basicBasketDetailController.listProducts[0].name, "Teste");
    expect(basicBasketDetailController.listProducts[0].stock, 2);
    expect(basicBasketDetailController.listProducts[0].value, 10);
  });
  test("Test Controller - Method Carrega List Produtcs - With Return Producs",
      () async {
    when(productRepositoryMock.getProduct(any)).thenAnswer((_) async {
      return ProductModel(
          brand: "Teste", id: 1, image: "", name: "Teste", stock: 2, value: 10);
    });
    when(basicBasketProductRepositoryMock.productsInBasicBasket(any))
        .thenAnswer((_) async {
      var data = <BasicBasketProductModel>[];
      data.add(BasicBasketProductModel(
          amount: 10, basicbasketsId: 1, id: 1, productsId: 1));
      return data;
    });
    await basicBasketDetailController.carregaListProducts(123);
    expect(basicBasketDetailController.listProducts[0].id, 1);
    expect(basicBasketDetailController.listProducts[0].brand, "Teste");
    expect(basicBasketDetailController.listProducts[0].name, "Teste");
    expect(basicBasketDetailController.listProducts[0].stock, 2);
    expect(basicBasketDetailController.listProducts[0].value, 10);
  });
  test("Test Controller - Method Carrega List Produtcs - With Return Producs",
      () async {
    when(productRepositoryMock.getProduct(any)).thenAnswer((_) async {
      return ProductModel(
          brand: "Teste", id: 1, image: "", name: "Teste", stock: 2, value: 10);
    });
    when(basicBasketProductRepositoryMock.productsInBasicBasket(any))
        .thenAnswer((_) async {
      var data = <BasicBasketProductModel>[];
      data.add(BasicBasketProductModel(
          amount: 10, basicbasketsId: 1, id: 1, productsId: 1));
      return data;
    });
    await basicBasketDetailController.carregaListProducts(123);
    expect(basicBasketDetailController.listProducts[0].id, 1);
    expect(basicBasketDetailController.listProducts[0].brand, "Teste");
    expect(basicBasketDetailController.listProducts[0].name, "Teste");
    expect(basicBasketDetailController.listProducts[0].stock, 2);
    expect(basicBasketDetailController.listProducts[0].value, 10);
  });
  test("Test Controller - Method Carrega List Produtcs - With Return Producs",
      () async {
    when(productRepositoryMock.getProduct(any)).thenAnswer((_) async {
      return ProductModel(
          brand: "Teste", id: 1, image: "", name: "Teste", stock: 2, value: 10);
    });
    when(basicBasketProductRepositoryMock.productsInBasicBasket(any))
        .thenAnswer((_) async {
      var data = <BasicBasketProductModel>[];
      data.add(BasicBasketProductModel(
          amount: 10, basicbasketsId: 1, id: 1, productsId: 1));
      return data;
    });
    await basicBasketDetailController.carregaListProducts(123);
    expect(basicBasketDetailController.listProducts[0].id, 1);
    expect(basicBasketDetailController.listProducts[0].brand, "Teste");
    expect(basicBasketDetailController.listProducts[0].name, "Teste");
    expect(basicBasketDetailController.listProducts[0].stock, 2);
    expect(basicBasketDetailController.listProducts[0].value, 10);
  });
  test("Test Controller - Method Carrega List Produtcs - With Return Producs",
      () async {
    when(productRepositoryMock.getProduct(any)).thenAnswer((_) async {
      return ProductModel(
          brand: "Teste", id: 1, image: "", name: "Teste", stock: 2, value: 10);
    });
    when(basicBasketProductRepositoryMock.productsInBasicBasket(any))
        .thenAnswer((_) async {
      var data = <BasicBasketProductModel>[];
      data.add(BasicBasketProductModel(
          amount: 10, basicbasketsId: 1, id: 1, productsId: 1));
      return data;
    });
    await basicBasketDetailController.carregaListProducts(123);
    expect(basicBasketDetailController.listProducts[0].id, 1);
    expect(basicBasketDetailController.listProducts[0].brand, "Teste");
    expect(basicBasketDetailController.listProducts[0].name, "Teste");
    expect(basicBasketDetailController.listProducts[0].stock, 2);
    expect(basicBasketDetailController.listProducts[0].value, 10);
  });
  test("Test Controller - Method Carrega List Produtcs - With Return Producs",
      () async {
    when(productRepositoryMock.getProduct(any)).thenAnswer((_) async {
      return ProductModel(
          brand: "Teste", id: 1, image: "", name: "Teste", stock: 2, value: 10);
    });
    when(basicBasketProductRepositoryMock.productsInBasicBasket(any))
        .thenAnswer((_) async {
      var data = <BasicBasketProductModel>[];
      data.add(BasicBasketProductModel(
          amount: 10, basicbasketsId: 1, id: 1, productsId: 1));
      return data;
    });
    await basicBasketDetailController.carregaListProducts(123);
    expect(basicBasketDetailController.listProducts[0].id, 1);
    expect(basicBasketDetailController.listProducts[0].brand, "Teste");
    expect(basicBasketDetailController.listProducts[0].name, "Teste");
    expect(basicBasketDetailController.listProducts[0].stock, 2);
    expect(basicBasketDetailController.listProducts[0].value, 10);
  });
  test("Test Controller - Method Carrega List Produtcs - With Return Producs",
      () async {
    when(productRepositoryMock.getProduct(any)).thenAnswer((_) async {
      return ProductModel(
          brand: "Teste", id: 1, image: "", name: "Teste", stock: 2, value: 10);
    });
    when(basicBasketProductRepositoryMock.productsInBasicBasket(any))
        .thenAnswer((_) async {
      var data = <BasicBasketProductModel>[];
      data.add(BasicBasketProductModel(
          amount: 10, basicbasketsId: 1, id: 1, productsId: 1));
      return data;
    });
    await basicBasketDetailController.carregaListProducts(123);
    expect(basicBasketDetailController.listProducts[0].id, 1);
    expect(basicBasketDetailController.listProducts[0].brand, "Teste");
    expect(basicBasketDetailController.listProducts[0].name, "Teste");
    expect(basicBasketDetailController.listProducts[0].stock, 2);
    expect(basicBasketDetailController.listProducts[0].value, 10);
  });
  test("Test Controller - Method Carrega List Produtcs - With Return Producs",
      () async {
    when(productRepositoryMock.getProduct(any)).thenAnswer((_) async {
      return ProductModel(
          brand: "Teste", id: 1, image: "", name: "Teste", stock: 2, value: 10);
    });
    when(basicBasketProductRepositoryMock.productsInBasicBasket(any))
        .thenAnswer((_) async {
      var data = <BasicBasketProductModel>[];
      data.add(BasicBasketProductModel(
          amount: 10, basicbasketsId: 1, id: 1, productsId: 1));
      return data;
    });
    await basicBasketDetailController.carregaListProducts(123);
    expect(basicBasketDetailController.listProducts[0].id, 1);
    expect(basicBasketDetailController.listProducts[0].brand, "Teste");
    expect(basicBasketDetailController.listProducts[0].name, "Teste");
    expect(basicBasketDetailController.listProducts[0].stock, 2);
    expect(basicBasketDetailController.listProducts[0].value, 10);
  });
  test("Test Controller - Method Carrega List Produtcs - With Return Producs",
      () async {
    when(productRepositoryMock.getProduct(any)).thenAnswer((_) async {
      return ProductModel(
          brand: "Teste", id: 1, image: "", name: "Teste", stock: 2, value: 10);
    });
    when(basicBasketProductRepositoryMock.productsInBasicBasket(any))
        .thenAnswer((_) async {
      var data = <BasicBasketProductModel>[];
      data.add(BasicBasketProductModel(
          amount: 10, basicbasketsId: 1, id: 1, productsId: 1));
      return data;
    });
    await basicBasketDetailController.carregaListProducts(123);
    expect(basicBasketDetailController.listProducts[0].id, 1);
    expect(basicBasketDetailController.listProducts[0].brand, "Teste");
    expect(basicBasketDetailController.listProducts[0].name, "Teste");
    expect(basicBasketDetailController.listProducts[0].stock, 2);
    expect(basicBasketDetailController.listProducts[0].value, 10);
  });
  test("Test Controller - Method Carrega List Produtcs - With Return Producs",
      () async {
    when(productRepositoryMock.getProduct(any)).thenAnswer((_) async {
      return ProductModel(
          brand: "Teste", id: 1, image: "", name: "Teste", stock: 2, value: 10);
    });
    when(basicBasketProductRepositoryMock.productsInBasicBasket(any))
        .thenAnswer((_) async {
      var data = <BasicBasketProductModel>[];
      data.add(BasicBasketProductModel(
          amount: 10, basicbasketsId: 1, id: 1, productsId: 1));
      return data;
    });
    await basicBasketDetailController.carregaListProducts(123);
    expect(basicBasketDetailController.listProducts[0].id, 1);
    expect(basicBasketDetailController.listProducts[0].brand, "Teste");
    expect(basicBasketDetailController.listProducts[0].name, "Teste");
    expect(basicBasketDetailController.listProducts[0].stock, 2);
    expect(basicBasketDetailController.listProducts[0].value, 10);
  });
  test("Test Controller - Method Carrega List Produtcs - With Return Producs",
      () async {
    when(productRepositoryMock.getProduct(any)).thenAnswer((_) async {
      return ProductModel(
          brand: "Teste", id: 1, image: "", name: "Teste", stock: 2, value: 10);
    });
    when(basicBasketProductRepositoryMock.productsInBasicBasket(any))
        .thenAnswer((_) async {
      var data = <BasicBasketProductModel>[];
      data.add(BasicBasketProductModel(
          amount: 10, basicbasketsId: 1, id: 1, productsId: 1));
      return data;
    });
    await basicBasketDetailController.carregaListProducts(123);
    expect(basicBasketDetailController.listProducts[0].id, 1);
    expect(basicBasketDetailController.listProducts[0].brand, "Teste");
    expect(basicBasketDetailController.listProducts[0].name, "Teste");
    expect(basicBasketDetailController.listProducts[0].stock, 2);
    expect(basicBasketDetailController.listProducts[0].value, 10);
  });
  test("Test Controller - Method Carrega List Produtcs - With Return Producs",
      () async {
    when(productRepositoryMock.getProduct(any)).thenAnswer((_) async {
      return ProductModel(
          brand: "Teste", id: 1, image: "", name: "Teste", stock: 2, value: 10);
    });
    when(basicBasketProductRepositoryMock.productsInBasicBasket(any))
        .thenAnswer((_) async {
      var data = <BasicBasketProductModel>[];
      data.add(BasicBasketProductModel(
          amount: 10, basicbasketsId: 1, id: 1, productsId: 1));
      return data;
    });
    await basicBasketDetailController.carregaListProducts(123);
    expect(basicBasketDetailController.listProducts[0].id, 1);
    expect(basicBasketDetailController.listProducts[0].brand, "Teste");
    expect(basicBasketDetailController.listProducts[0].name, "Teste");
    expect(basicBasketDetailController.listProducts[0].stock, 2);
    expect(basicBasketDetailController.listProducts[0].value, 10);
  });
  test("Test Controller - Method Carrega List Produtcs - With Return Producs",
      () async {
    when(productRepositoryMock.getProduct(any)).thenAnswer((_) async {
      return ProductModel(
          brand: "Teste", id: 1, image: "", name: "Teste", stock: 2, value: 10);
    });
    when(basicBasketProductRepositoryMock.productsInBasicBasket(any))
        .thenAnswer((_) async {
      var data = <BasicBasketProductModel>[];
      data.add(BasicBasketProductModel(
          amount: 10, basicbasketsId: 1, id: 1, productsId: 1));
      return data;
    });
    await basicBasketDetailController.carregaListProducts(123);
    expect(basicBasketDetailController.listProducts[0].id, 1);
    expect(basicBasketDetailController.listProducts[0].brand, "Teste");
    expect(basicBasketDetailController.listProducts[0].name, "Teste");
    expect(basicBasketDetailController.listProducts[0].stock, 2);
    expect(basicBasketDetailController.listProducts[0].value, 10);
  });
  test("Test Controller - Method Carrega List Produtcs - With Return Producs",
      () async {
    when(productRepositoryMock.getProduct(any)).thenAnswer((_) async {
      return ProductModel(
          brand: "Teste", id: 1, image: "", name: "Teste", stock: 2, value: 10);
    });
    when(basicBasketProductRepositoryMock.productsInBasicBasket(any))
        .thenAnswer((_) async {
      var data = <BasicBasketProductModel>[];
      data.add(BasicBasketProductModel(
          amount: 10, basicbasketsId: 1, id: 1, productsId: 1));
      return data;
    });
    await basicBasketDetailController.carregaListProducts(123);
    expect(basicBasketDetailController.listProducts[0].id, 1);
    expect(basicBasketDetailController.listProducts[0].brand, "Teste");
    expect(basicBasketDetailController.listProducts[0].name, "Teste");
    expect(basicBasketDetailController.listProducts[0].stock, 2);
    expect(basicBasketDetailController.listProducts[0].value, 10);
  });
  test("Test Controller - Method Carrega List Produtcs - With Return Producs",
      () async {
    when(productRepositoryMock.getProduct(any)).thenAnswer((_) async {
      return ProductModel(
          brand: "Teste", id: 1, image: "", name: "Teste", stock: 2, value: 10);
    });
    when(basicBasketProductRepositoryMock.productsInBasicBasket(any))
        .thenAnswer((_) async {
      var data = <BasicBasketProductModel>[];
      data.add(BasicBasketProductModel(
          amount: 10, basicbasketsId: 1, id: 1, productsId: 1));
      return data;
    });
    await basicBasketDetailController.carregaListProducts(123);
    expect(basicBasketDetailController.listProducts[0].id, 1);
    expect(basicBasketDetailController.listProducts[0].brand, "Teste");
    expect(basicBasketDetailController.listProducts[0].name, "Teste");
    expect(basicBasketDetailController.listProducts[0].stock, 2);
    expect(basicBasketDetailController.listProducts[0].value, 10);
  });
  test("Test Controller - Method Carrega List Produtcs - With Return Producs",
      () async {
    when(productRepositoryMock.getProduct(any)).thenAnswer((_) async {
      return ProductModel(
          brand: "Teste", id: 1, image: "", name: "Teste", stock: 2, value: 10);
    });
    when(basicBasketProductRepositoryMock.productsInBasicBasket(any))
        .thenAnswer((_) async {
      var data = <BasicBasketProductModel>[];
      data.add(BasicBasketProductModel(
          amount: 10, basicbasketsId: 1, id: 1, productsId: 1));
      return data;
    });
    await basicBasketDetailController.carregaListProducts(123);
    expect(basicBasketDetailController.listProducts[0].id, 1);
    expect(basicBasketDetailController.listProducts[0].brand, "Teste");
    expect(basicBasketDetailController.listProducts[0].name, "Teste");
    expect(basicBasketDetailController.listProducts[0].stock, 2);
    expect(basicBasketDetailController.listProducts[0].value, 10);
  });
  test("Test Controller - Method Carrega List Produtcs - With Return Producs",
      () async {
    when(productRepositoryMock.getProduct(any)).thenAnswer((_) async {
      return ProductModel(
          brand: "Teste", id: 1, image: "", name: "Teste", stock: 2, value: 10);
    });
    when(basicBasketProductRepositoryMock.productsInBasicBasket(any))
        .thenAnswer((_) async {
      var data = <BasicBasketProductModel>[];
      data.add(BasicBasketProductModel(
          amount: 10, basicbasketsId: 1, id: 1, productsId: 1));
      return data;
    });
    await basicBasketDetailController.carregaListProducts(123);
    expect(basicBasketDetailController.listProducts[0].id, 1);
    expect(basicBasketDetailController.listProducts[0].brand, "Teste");
    expect(basicBasketDetailController.listProducts[0].name, "Teste");
    expect(basicBasketDetailController.listProducts[0].stock, 2);
    expect(basicBasketDetailController.listProducts[0].value, 10);
  });
  test("Test Controller - Method Carrega List Produtcs - With Return Producs",
      () async {
    when(productRepositoryMock.getProduct(any)).thenAnswer((_) async {
      return ProductModel(
          brand: "Teste", id: 1, image: "", name: "Teste", stock: 2, value: 10);
    });
    when(basicBasketProductRepositoryMock.productsInBasicBasket(any))
        .thenAnswer((_) async {
      var data = <BasicBasketProductModel>[];
      data.add(BasicBasketProductModel(
          amount: 10, basicbasketsId: 1, id: 1, productsId: 1));
      return data;
    });
    await basicBasketDetailController.carregaListProducts(123);
    expect(basicBasketDetailController.listProducts[0].id, 1);
    expect(basicBasketDetailController.listProducts[0].brand, "Teste");
    expect(basicBasketDetailController.listProducts[0].name, "Teste");
    expect(basicBasketDetailController.listProducts[0].stock, 2);
    expect(basicBasketDetailController.listProducts[0].value, 10);
  });
  test("Test Controller - Method Carrega List Produtcs - With Return Producs",
      () async {
    when(productRepositoryMock.getProduct(any)).thenAnswer((_) async {
      return ProductModel(
          brand: "Teste", id: 1, image: "", name: "Teste", stock: 2, value: 10);
    });
    when(basicBasketProductRepositoryMock.productsInBasicBasket(any))
        .thenAnswer((_) async {
      var data = <BasicBasketProductModel>[];
      data.add(BasicBasketProductModel(
          amount: 10, basicbasketsId: 1, id: 1, productsId: 1));
      return data;
    });
    await basicBasketDetailController.carregaListProducts(123);
    expect(basicBasketDetailController.listProducts[0].id, 1);
    expect(basicBasketDetailController.listProducts[0].brand, "Teste");
    expect(basicBasketDetailController.listProducts[0].name, "Teste");
    expect(basicBasketDetailController.listProducts[0].stock, 2);
    expect(basicBasketDetailController.listProducts[0].value, 10);
  });
  test("Test Controller - Method Carrega List Produtcs - With Return Producs",
      () async {
    when(productRepositoryMock.getProduct(any)).thenAnswer((_) async {
      return ProductModel(
          brand: "Teste", id: 1, image: "", name: "Teste", stock: 2, value: 10);
    });
    when(basicBasketProductRepositoryMock.productsInBasicBasket(any))
        .thenAnswer((_) async {
      var data = <BasicBasketProductModel>[];
      data.add(BasicBasketProductModel(
          amount: 10, basicbasketsId: 1, id: 1, productsId: 1));
      return data;
    });
    await basicBasketDetailController.carregaListProducts(123);
    expect(basicBasketDetailController.listProducts[0].id, 1);
    expect(basicBasketDetailController.listProducts[0].brand, "Teste");
    expect(basicBasketDetailController.listProducts[0].name, "Teste");
    expect(basicBasketDetailController.listProducts[0].stock, 2);
    expect(basicBasketDetailController.listProducts[0].value, 10);
  });
  test("Test Controller - Method Carrega List Produtcs - With Return Producs",
      () async {
    when(productRepositoryMock.getProduct(any)).thenAnswer((_) async {
      return ProductModel(
          brand: "Teste", id: 1, image: "", name: "Teste", stock: 2, value: 10);
    });
    when(basicBasketProductRepositoryMock.productsInBasicBasket(any))
        .thenAnswer((_) async {
      var data = <BasicBasketProductModel>[];
      data.add(BasicBasketProductModel(
          amount: 10, basicbasketsId: 1, id: 1, productsId: 1));
      return data;
    });
    await basicBasketDetailController.carregaListProducts(123);
    expect(basicBasketDetailController.listProducts[0].id, 1);
    expect(basicBasketDetailController.listProducts[0].brand, "Teste");
    expect(basicBasketDetailController.listProducts[0].name, "Teste");
    expect(basicBasketDetailController.listProducts[0].stock, 2);
    expect(basicBasketDetailController.listProducts[0].value, 10);
  });
  test("Test Controller - Method Carrega List Produtcs - With Return Producs",
      () async {
    when(productRepositoryMock.getProduct(any)).thenAnswer((_) async {
      return ProductModel(
          brand: "Teste", id: 1, image: "", name: "Teste", stock: 2, value: 10);
    });
    when(basicBasketProductRepositoryMock.productsInBasicBasket(any))
        .thenAnswer((_) async {
      var data = <BasicBasketProductModel>[];
      data.add(BasicBasketProductModel(
          amount: 10, basicbasketsId: 1, id: 1, productsId: 1));
      return data;
    });
    await basicBasketDetailController.carregaListProducts(123);
    expect(basicBasketDetailController.listProducts[0].id, 1);
    expect(basicBasketDetailController.listProducts[0].brand, "Teste");
    expect(basicBasketDetailController.listProducts[0].name, "Teste");
    expect(basicBasketDetailController.listProducts[0].stock, 2);
    expect(basicBasketDetailController.listProducts[0].value, 10);
  });
  test("Test Controller - Method Carrega List Produtcs - With Return Producs",
      () async {
    when(productRepositoryMock.getProduct(any)).thenAnswer((_) async {
      return ProductModel(
          brand: "Teste", id: 1, image: "", name: "Teste", stock: 2, value: 10);
    });
    when(basicBasketProductRepositoryMock.productsInBasicBasket(any))
        .thenAnswer((_) async {
      var data = <BasicBasketProductModel>[];
      data.add(BasicBasketProductModel(
          amount: 10, basicbasketsId: 1, id: 1, productsId: 1));
      return data;
    });
    await basicBasketDetailController.carregaListProducts(123);
    expect(basicBasketDetailController.listProducts[0].id, 1);
    expect(basicBasketDetailController.listProducts[0].brand, "Teste");
    expect(basicBasketDetailController.listProducts[0].name, "Teste");
    expect(basicBasketDetailController.listProducts[0].stock, 2);
    expect(basicBasketDetailController.listProducts[0].value, 10);
  });
}
