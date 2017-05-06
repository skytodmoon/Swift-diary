import Foundation;

var myProduct = ("Kayak", "A boat for one person", "Watersports", 275.0, 10);

func writeProductDetails(product: (String, String, String, Double, Int)) {
    print("Name: \(product.0)");
    print("Description: \(product.1)");
    print("Category: \(product.2)");
    let formattedPrice = NSString(format: "$%.2lf", product.3);
    print("Price: \(formattedPrice)");
}

writeProductDetails(myProduct);



/*实现对象模板模式*/

class Product {
    
    var name:String;
    var price:Double;
    private var stockBackingValue:Int = 0;
    
    var stock:Int {
        get {
            return stockBackingValue;
        }
        set {
            stockBackingValue = max(0, newValue);
        }
    }
    
    init(name:String, price:Double, stock:Int) {
        self.name = name;
        self.price = price;
        self.stock = stock;
    }
    
    func calculateTax(rate: Double) -> Double {
        return min(10, self.price * rate);
    }
    
    var stockValue: Double {
        get {
            return self.price * Double(self.stock);
        }
    }
}

var products = [
    Product(name: "Kayak", price: 275, stock: 10),
    Product(name: "Lifejacket", price: 48.95, stock: 14),
    Product(name: "Soccer Ball", price: 19.5, stock: 32)];

func calculateStockValue(productsArray:[Product]) -> Double {
    return productsArray.reduce(0, combine: {(total, product) -> Double in
        return total + product.stockValue;
    });
}

print("Sales tax for Kayak: $\(products[0].calculateTax(0.2))");
print("Total value of stock: $\(calculateStockValue(products))");
products[0].stock = -50;
print("Stock Level for Kayak: \(products[0].stock)");





