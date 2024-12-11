CREATE DATABASE ArtShare;
USE ArtShare;

CREATE TABLE Categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE Posts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    image_path VARCHAR(255) NOT NULL,
    category_id INT NOT NULL,
    description TEXT NOT NULL,
    details TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO Categories (name) VALUES
('Мистецтво'),
('Фотографія'),
('Дизайн'),
('Графіка'),
('Скульптура');

INSERT INTO Posts (title, image_path, category_id, description, details) VALUES
('Іван Петров', 'images/landscape1.jpg', 1, 'Олійний живопис на полотні', 'Розміри: 60x80 см'),
('Олена Ковальчук', 'images/sunset.jpg', 2, 'Фотографія природи', 'Місце зйомки: Карпати'),
('Марія Сидоренко', 'images/ui-design.jpg', 3, 'Концепт-дизайн для фінансового додатку', 'Інструменти: Figma, Adobe XD'),
('Дмитро Кравченко', 'images/sculpture1.jpg', 5, 'Абстрактна скульптура з бронзи', 'Вага: 15 кг'),
('Анна Черненко', 'images/graphic-poster.jpg', 4, 'Плакат у стилі Bauhaus', 'Розмір: A2'),
('Олександра Бойко', 'images/portrait.jpg', 1, 'Акварельний портрет', 'Розмір: 30x40 см'),
('Микола Левченко', 'images/city-night.jpg', 2, 'Фотографія вулиць Києва', 'Час зйомки: 22:00'),
('Ірина Горбенко', 'images/logo-design.jpg', 3, 'Логотип для IT-компанії', 'Стиль: мінімалізм'),
('Віталій Остапенко', 'images/classic-sculpture.jpg', 5, 'Копія Давида Мікеланджело', 'Матеріал: мармур'),
('Катерина Шевченко', 'images/book-illustration.jpg', 1, 'Ілюстрація для дитячої книги', 'Техніка: цифровий малюнок'),
('Сергій Кучеренко', 'images/winter-landscape.jpg', 1, 'Масляні фарби на полотні', 'Розмір: 70x90 см'),
('Юлія Савченко', 'images/forest.jpg', 2, 'Зелений ліс вранці', 'Камера: Canon EOS 5D'),
('Валерій Руденко', 'images/business-card.jpg', 3, 'Візитка для юриста', 'Стиль: класичний'),
('Олексій Мельник', 'images/animal-sculpture.jpg', 5, 'Скульптура коня', 'Матеріал: дерево'),
('Лариса Зайцева', 'images/graphic-art.jpg', 4, 'Цифровий графічний арт', 'Техніка: Procreate'),
('Наталія Козаченко', 'images/sea.jpg', 2, 'Море під час шторму', 'Місце: Одеса'),
('Андрій Ткаченко', 'images/banner-design.jpg', 3, 'Банер для онлайн-магазину', 'Розмір: 1200x628'),
('Євген Гончарук', 'images/modern-sculpture.jpg', 5, 'Сучасна скульптура з металу', 'Висота: 2 м'),
('Олег Бондар', 'images/abstract-painting.jpg', 1, 'Абстракція акрилом', 'Розміри: 50x60 см'),
('Оксана Литвиненко', 'images/tshirt-design.jpg', 4, 'Принт для футболки', 'Техніка: векторна графіка');

