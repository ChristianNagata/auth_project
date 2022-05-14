abstract class ProductsDataSource {
  Future<bool> saveProduct(Map<String, dynamic> product);

  Future<bool> updateProduct(Map<String, dynamic> product);

  Future<bool> deleteItem(String productId);

  Stream<List<Map<String, dynamic>>> getAllProducts();

  Future<List<Map<String, dynamic>>> getAllProductsFromStore(String storeId);
}
