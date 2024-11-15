-- Table des joueurs (Players)
CREATE TABLE Players (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    birth_date DATE NOT NULL
);

-- Table des jeux (Games)
CREATE TABLE Games (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    genre VARCHAR(50) NOT NULL,
    age_rating INT NOT NULL
);

-- Table des salles (Rooms)
CREATE TABLE Rooms (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    max_players INT NOT NULL
);

-- Table des sessions (Sessions)
CREATE TABLE Sessions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    game_id INT NOT NULL,
    room_id INT NOT NULL,
    start_time DATETIME NOT NULL,
    end_time DATETIME NOT NULL,
    FOREIGN KEY (game_id) REFERENCES Games(id) ON DELETE CASCADE,
    FOREIGN KEY (room_id) REFERENCES Rooms(id) ON DELETE CASCADE
);

-- Table des scores (Scores)
CREATE TABLE Scores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    session_id INT NOT NULL,
    player_id INT NOT NULL,
    score INT NOT NULL,
    FOREIGN KEY (session_id) REFERENCES Sessions(id) ON DELETE CASCADE,
    FOREIGN KEY (player_id) REFERENCES Players(id) ON DELETE CASCADE
);
