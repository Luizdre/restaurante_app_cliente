// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on HomeStoreBase, Store {
  final _$productsAtom = Atom(name: 'HomeStoreBase.products');

  @override
  List<ProductModel> get products {
    _$productsAtom.reportRead();
    return super.products;
  }

  @override
  set products(List<ProductModel> value) {
    _$productsAtom.reportWrite(value, super.products, () {
      super.products = value;
    });
  }

  final _$priceAtom = Atom(name: 'HomeStoreBase.price');

  @override
  double get price {
    _$priceAtom.reportRead();
    return super.price;
  }

  @override
  set price(double value) {
    _$priceAtom.reportWrite(value, super.price, () {
      super.price = value;
    });
  }

  final _$ordersAtom = Atom(name: 'HomeStoreBase.orders');

  @override
  List<OrderModel> get orders {
    _$ordersAtom.reportRead();
    return super.orders;
  }

  @override
  set orders(List<OrderModel> value) {
    _$ordersAtom.reportWrite(value, super.orders, () {
      super.orders = value;
    });
  }

  final _$paymentsAtom = Atom(name: 'HomeStoreBase.payments');

  @override
  List<PaymentModel> get payments {
    _$paymentsAtom.reportRead();
    return super.payments;
  }

  @override
  set payments(List<PaymentModel> value) {
    _$paymentsAtom.reportWrite(value, super.payments, () {
      super.payments = value;
    });
  }

  final _$obsAtom = Atom(name: 'HomeStoreBase.obs');

  @override
  String get obs {
    _$obsAtom.reportRead();
    return super.obs;
  }

  @override
  set obs(String value) {
    _$obsAtom.reportWrite(value, super.obs, () {
      super.obs = value;
    });
  }

  final _$indexAtom = Atom(name: 'HomeStoreBase.index');

  @override
  int get index {
    _$indexAtom.reportRead();
    return super.index;
  }

  @override
  set index(int value) {
    _$indexAtom.reportWrite(value, super.index, () {
      super.index = value;
    });
  }

  final _$getProductsAsyncAction = AsyncAction('HomeStoreBase.getProducts');

  @override
  Future getProducts() {
    return _$getProductsAsyncAction.run(() => super.getProducts());
  }

  final _$getOrdersAsyncAction = AsyncAction('HomeStoreBase.getOrders');

  @override
  Future getOrders() {
    return _$getOrdersAsyncAction.run(() => super.getOrders());
  }

  final _$getPaymentsAsyncAction = AsyncAction('HomeStoreBase.getPayments');

  @override
  Future getPayments() {
    return _$getPaymentsAsyncAction.run(() => super.getPayments());
  }

  final _$addProductToCartAsyncAction =
      AsyncAction('HomeStoreBase.addProductToCart');

  @override
  Future addProductToCart(ProductModel product) {
    return _$addProductToCartAsyncAction
        .run(() => super.addProductToCart(product));
  }

  final _$payOrderAsyncAction = AsyncAction('HomeStoreBase.payOrder');

  @override
  Future payOrder(List<OrderModel> orders) {
    return _$payOrderAsyncAction.run(() => super.payOrder(orders));
  }

  final _$deleteOrderAsyncAction = AsyncAction('HomeStoreBase.deleteOrder');

  @override
  Future deleteOrder(OrderModel order) {
    return _$deleteOrderAsyncAction.run(() => super.deleteOrder(order));
  }

  final _$sendOrderAsyncAction = AsyncAction('HomeStoreBase.sendOrder');

  @override
  Future sendOrder() {
    return _$sendOrderAsyncAction.run(() => super.sendOrder());
  }

  final _$HomeStoreBaseActionController =
      ActionController(name: 'HomeStoreBase');

  @override
  MaterialColor turnStatus(String status) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.turnStatus');
    try {
      return super.turnStatus(status);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String translateMessage(String status) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.translateMessage');
    try {
      return super.translateMessage(status);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
products: ${products},
price: ${price},
orders: ${orders},
payments: ${payments},
obs: ${obs},
index: ${index}
    ''';
  }
}
