 import 'package:graduation_project/models/product_details.dart';
 import 'package:graduation_project/modules/Cart/controller/db_controller.dart';
import 'package:graduation_project/modules/Cart/controller/db_operations.dart';
import 'package:sqflite/sqflite.dart';

class CartDbController implements DbOperations<ProudctDetails>{
  final Database _database = DbController().database;
  @override
  Future<int> create(ProudctDetails object) async {
    // INSERT INTO cart 
    return await _database.insert('cart', object.toJson());
    
  }

  @override
  Future<bool> delete(int id)async {
    //DELETE FROM cart;
    //DELETE FROM cart WHERE id = 1;
    int numberOfDeletedRows = await _database.delete(
      'cart',
      where: 'id = ?',  
      whereArgs: [id],
    );
    return numberOfDeletedRows > 0;
  }

  @override
  Future<List<ProudctDetails>> read() async{
    // SELECT * FROM contacts;
    List<Map<String, dynamic>> rowsMap = await _database.query('cart');
    return rowsMap.map((Map<String, dynamic> rowMap) => ProudctDetails.fromJson(rowMap)).toList();
  }

  @override
  Future<ProudctDetails?> show(int id) {
    // TODO: implement show
    throw UnimplementedError();
  }

  @override
  Future<bool> update(ProudctDetails object) {
    // TODO: implement update
    throw UnimplementedError();
  }

}