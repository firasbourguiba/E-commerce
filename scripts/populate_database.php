<?php
// Charger la bibliothèque Faker via Composer
require __DIR__ . '/../vendor/autoload.php';

echo "Autoload loaded successfully\n";

// Initialisation de Faker
$faker = Faker\Factory::create();

try {
    // Connexion à la base de données
    $pdo = new PDO('mysql:host=localhost;port=3306;dbname=ecommerce_', 'root', ''); // Remplacez par les informations correctes
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    echo "Connexion réussie à la base de données !\n";

    // Insertion des utilisateurs
    for ($i = 0; $i < 50; $i++) {
        $name = $faker->name;
        $email = $faker->email;
        $password = password_hash('password123', PASSWORD_DEFAULT);

        $stmt = $pdo->prepare("INSERT INTO User (name, email, password) VALUES (?, ?, ?)");
        $stmt->execute([$name, $email, $password]);
    }

    echo "50 utilisateurs ajoutés avec succès !\n";

    // Insertion des produits
    for ($i = 0; $i < 20; $i++) {
        $productName = $faker->word;
        $description = $faker->sentence;
        $price = $faker->randomFloat(2, 10, 1000); // Prix aléatoire entre 10 et 1000

        $stmt = $pdo->prepare("INSERT INTO Product (name, description, price) VALUES (?, ?, ?)");
        $stmt->execute([$productName, $description, $price]);
    }

    echo "20 produits ajoutés avec succès !\n";

    // Récupération des IDs des utilisateurs
    $userIds = $pdo->query("SELECT user_id FROM User")->fetchAll(PDO::FETCH_COLUMN);

    // Insertion des adresses pour chaque utilisateur
    foreach ($userIds as $userId) {
        for ($j = 0; $j < 2; $j++) { // Chaque utilisateur reçoit 2 adresses
            $street = $faker->streetAddress;
            $city = $faker->city;
            $zipCode = $faker->postcode;

            $stmt = $pdo->prepare("INSERT INTO Address (user_id, street, city, zip_code) VALUES (?, ?, ?, ?)");
            $stmt->execute([$userId, $street, $city, $zipCode]);
        }
    }

    echo "Adresses ajoutées pour chaque utilisateur !\n";

    // Insertion des commandes pour chaque utilisateur
    foreach ($userIds as $userId) {
        $status = $faker->randomElement(['pending', 'completed', 'shipped', 'delivered']);
        
        // Insertion de la commande
        $stmt = $pdo->prepare("INSERT INTO Command (user_id, status) VALUES (?, ?)");
        $stmt->execute([$userId, $status]);
        $commandId = $pdo->lastInsertId();

        // Insertion des produits pour chaque commande
        for ($k = 0; $k < rand(1, 3); $k++) { // Chaque commande a entre 1 et 3 produits
            $productId = $faker->randomElement(range(1, 20));
            $quantity = rand(1, 5);

            $stmt = $pdo->prepare("INSERT INTO Command_Product (command_id, product_id, quantity) VALUES (?, ?, ?)");
            $stmt->execute([$commandId, $productId, $quantity]);
        }
    }

    echo "Commandes et produits associés ajoutés avec succès !\n";
    echo "Database populated successfully!";

} catch (PDOException $e) {
    echo "Erreur de connexion : " . $e->getMessage();
}
?>
