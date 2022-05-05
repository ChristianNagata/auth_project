abstract class ProductsDataSource {
  Future<void> saveProduct(Map<String, dynamic> product);

  Future<void> updateProduct(Map<String, dynamic> product);

  Future<void> deleteItem(String productId);

  Stream<List<Map<String, dynamic>>> getAllProducts();

  Stream<List<Map<String, dynamic>>> getAllProductsFromStore(String storeId);
}
