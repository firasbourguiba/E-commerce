<?php
// Load the Faker library
require __DIR__ . '/../vendor/autoload.php';

echo "Autoload loaded successfully\n";
$faker = Faker\Factory::create();

// Database connection
$pdo = new PDO('mysql:host=localhost;port=3307;dbname=ecommerce_', 'admine', '123');



// Insert users
for ($i = 0; $i < 50; $i++) {
    $name = $faker->name;
    $email = $faker->email;
    $password = password_hash('password123', PASSWORD_DEFAULT);

    $stmt = $pdo->prepare("INSERT INTO User (name, email, password) VALUES (?, ?, ?)");
    $stmt->execute([$name, $email, $password]);
}

// Insert products
for ($i = 0; $i < 20; $i++) {
    $productName = $faker->word;
    $description = $faker->sentence;
    $price = $faker->randomFloat(2, 10, 1000); // Random price between 10 and 1000

    $stmt = $pdo->prepare("INSERT INTO Product (name, description, price) VALUES (?, ?, ?)");
    $stmt->execute([$productName, $description, $price]);
}

// Insert addresses for users
$userIds = $pdo->query("SELECT user_id FROM User")->fetchAll(PDO::FETCH_COLUMN);
foreach ($userIds as $userId) {
    for ($j = 0; $j < 2; $j++) { // Each user gets 2 addresses
        $street = $faker->streetAddress;
        $city = $faker->city;
        $zipCode = $faker->postcode;

        $stmt = $pdo->prepare("INSERT INTO Address (user_id, street, city, zip_code) VALUES (?, ?, ?, ?)");
        $stmt->execute([$userId, $street, $city, $zipCode]);
    }
}

// Insert commands for users
foreach ($userIds as $userId) {
    $status = $faker->randomElement(['pending', 'completed', 'shipped', 'delivered']);
    $stmt = $pdo->prepare("INSERT INTO Command (user_id, status) VALUES (?, ?)");
    $stmt->execute([$userId, $status]);
    $commandId = $pdo->lastInsertId();

    // Insert products into the Command_Product table for each command
    for ($k = 0; $k < rand(1, 3); $k++) { // Each command has 1 to 3 products
        $productId = $faker->randomElement(range(1, 20));
        $quantity = rand(1, 5);

        $stmt = $pdo->prepare("INSERT INTO Command_Product (command_id, product_id, quantity) VALUES (?, ?, ?)");
        $stmt->execute([$commandId, $productId, $quantity]);
    }
}

echo "Database populated successfully!";
?>
