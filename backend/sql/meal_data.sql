USE meal1;

START TRANSACTION;
SET NAMES utf8mb4;

-- ============================
-- USERS
-- ============================
INSERT INTO users (username, password, role) VALUES
('marco', '$2y$10$abcdefghijklmnopqrstuvxyzABCDE1234567890abcd', 'admin'),
('chef_anna', '$2y$10$abcdefghijklmnopqrstuvxyzABCDE1234567890abcd', 'editor'),
('guest', '$2y$10$abcdefghijklmnopqrstuvxyzABCDE1234567890abcd', 'viewer');

-- ============================
-- INGREDIENTS
-- ============================
INSERT INTO ingredients (name) VALUES
('Pasta'),
('Pomodoro'),
('Basilico'),
('Olio d\'oliva'),
('Sale'),
('Pepe'),
('Farina'),
('Latte'),
('Uova'),
('Zucchero'),
('Burro'),
('Cacao'),
('Mandorle'),
('Tofu'),
('Spinaci'),
('Aglio');

-- ============================
-- UNIT OF MEASUREMENT
-- ============================
INSERT INTO unit_of_measurement (measurement) VALUES
('g'),
('kg'),
('ml'),
('l'),
('cucchiaio'),
('cucchiaino'),
('pezzo'),
('foglia'),
('spicchio');

-- ============================
-- MEASURED_IN
-- ============================
INSERT INTO measured_in VALUES
('Pasta', 'g'),
('Pomodoro', 'g'),
('Pomodoro', 'pezzo'),
('Basilico', 'foglia'),
('Olio d\'oliva', 'ml'),
('Sale', 'g'),
('Pepe', 'g'),
('Farina', 'g'),
('Latte', 'ml'),
('Uova', 'pezzo'),
('Zucchero', 'g'),
('Burro', 'g'),
('Cacao', 'g'),
('Mandorle', 'g'),
('Tofu', 'g'),
('Spinaci', 'g'),
('Aglio', 'spicchio');

-- ============================
-- RECIPES
-- ============================
INSERT INTO recipes (
  recipe_id, name, prep_time, difficulty, description, course,
  recipe_image, isVegan, isLactoseFree, isGlutenFree, isProteinRich,
  USERS_username
) VALUES
(1, 'Pasta al Pomodoro', 20, 'Facile',
 'Un grande classico italiano: pasta con sugo di pomodoro fresco e basilico.',
 'Primo',
 0x89504E470D0A1A0A00000000, FALSE, TRUE, FALSE, FALSE,
 'marco'),

(2, 'Torta al Cioccolato', 60, 'Media',
 'Torta soffice al cacao con glassa al cioccolato.',
 'Dolce',
 0x89504E470D0A1A0A00000000, FALSE, FALSE, FALSE, FALSE,
 'chef_anna'),

(3, 'Tofu Saltato con Spinaci', 15, 'Facile',
 'Piatto vegano ricco di proteine, con tofu croccante e spinaci freschi.',
 'Secondo',
 0x89504E470D0A1A0A00000000, TRUE, TRUE, TRUE, TRUE,
 'marco');

-- ============================
-- HAS
-- ============================

-- Pasta al Pomodoro
INSERT INTO has VALUES
(1, 'Pasta', 100),
(1, 'Pomodoro', 150),
(1, 'Basilico', 3),
(1, 'Olio d\'oliva', 10),
(1, 'Sale', 5);

-- Torta al Cioccolato
INSERT INTO has VALUES
(2, 'Farina', 200),
(2, 'Zucchero', 150),
(2, 'Burro', 100),
(2, 'Uova', 3),
(2, 'Cacao', 50),
(2, 'Latte', 200);

-- Tofu Saltato con Spinaci
INSERT INTO has VALUES
(3, 'Tofu', 150),
(3, 'Spinaci', 100),
(3, 'Aglio', 1),
(3, 'Olio d\'oliva', 10),
(3, 'Sale', 3);

-- ============================
-- PREPARATIONS
-- ============================

-- Pasta al Pomodoro
INSERT INTO preparations VALUES
(1, 1, 'Cuocere la pasta in acqua salata.'),
(1, 2, 'Preparare il sugo con pomodoro e olio.'),
(1, 3, 'Unire pasta e sugo e aggiungere basilico.');

-- Torta al Cioccolato
INSERT INTO preparations VALUES
(2, 1, 'Mescolare farina, zucchero e cacao.'),
(2, 2, 'Aggiungere burro fuso, latte e uova.'),
(2, 3, 'Infornare a 180°C per 40 minuti.');

-- Tofu Saltato con Spinaci
INSERT INTO preparations VALUES
(3, 1, 'Saltare il tofu in padella con olio.'),
(3, 2, 'Aggiungere spinaci e aglio.'),
(3, 3, 'Cuocere per 5 minuti e servire.');

COMMIT;
