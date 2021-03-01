const String databaseName = "controllerbasicbasket.db";
const String clientTableName = "clients";
const String productTableName = "products";
const String basicbasketTableName = "basicbaskets";
const String basicbasketsproductsTableName = "basicbasketsproducts";
const String requestTableName = "requests";
const String requestBasicBasketTableName = "requestsbasicbasket";
const String installmentTableName = "installments";
const String debtTableName = "debts";

const String createClientTableScript =
    // ignore: lines_longer_than_80_chars
    "CREATE TABLE clients(id INTEGER PRIMARY KEY, name TEXT, rg TEXT, cpf TEXT, gender TEXT, dateOfBirth TEXT, phone TEXT, state TEXT, city TEXT, neighborhood TEXT, street TEXT, number int)";

const String createProductTableScript =
    // ignore: lines_longer_than_80_chars
    "CREATE TABLE products(id INTEGER PRIMARY KEY, name TEXT, value REAL, stock int, brand TEXT)";

const String createBasicBasketsTableScript =
    // ignore: lines_longer_than_80_chars
    "CREATE TABLE basicbaskets(id INTEGER PRIMARY KEY, name TEXT, value REAL)";

const String createBasicBasketsProductsTableScript =
    // ignore: lines_longer_than_80_chars
    "CREATE TABLE basicbasketsproducts(id INTEGER PRIMARY KEY, amount int, productsId INTEGER NOT NULL, basicbasketsId INTEGER NOT NULL, FOREIGN KEY (productsId) REFERENCES products(id) ON DELETE CASCADE ON UPDATE CASCADE, FOREIGN KEY (basicbasketsId) REFERENCES basicbaskets(id) ON DELETE CASCADE ON UPDATE CASCADE)";

const String createRequestTableScript =
    // ignore: lines_longer_than_80_chars
    "CREATE TABLE requests(id INTEGER PRIMARY KEY, status TEXT, totalValue REAL, deliveryDate TEXT, dateRequest TEXT, comments TEXT, clientsId INTEGER NOT NULL, FOREIGN KEY (clientsId) REFERENCES clients(id) ON DELETE CASCADE ON UPDATE CASCADE)";

const String createRequestBasicBasketsTableScript =
    // ignore: lines_longer_than_80_chars
    "CREATE TABLE requestsbasicbasket(id INTEGER PRIMARY KEY, amount int, requestId INTEGER NOT NULL, basicbasketsId INTEGER NOT NULL, FOREIGN KEY (requestId) REFERENCES requests(id) ON DELETE CASCADE ON UPDATE CASCADE, FOREIGN KEY (basicbasketsId) REFERENCES basicbaskets(id) ON DELETE CASCADE ON UPDATE CASCADE)";
