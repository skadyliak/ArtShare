const express = require("express");
const mysql = require("mysql2");
const multer = require("multer");
const path = require("path");
const cors = require("cors");
const app = express();
const port = 3000;

app.use(cors());

const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, "public/images");
  },
  filename: (req, file, cb) => {
    const ext = path.extname(file.originalname);
    const filename = Date.now() + ext;
    cb(null, filename);
  },
});

const upload = multer({ storage: storage });

const db = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "12384562",
  database: "ArtShare",
});

db.connect((err) => {
  if (err) {
    console.error("Помилка підключення до бази даних:", err);
    return;
  }
  console.log("Підключено до бази даних MySQL");
});

app.use(express.json());
app.use(express.static("public"));

app.get("/categories", (req, res) => {
  const query = "SELECT * FROM Categories";
  db.query(query, (err, results) => {
    if (err) {
      return res.status(500).json({ error: "Помилка отримання категорій" });
    }
    res.json(results);
  });
});

app.post("/posts", upload.single("image"), (req, res) => {
  const { title, category_id, description, details } = req.body;
  const image_path = req.file ? `images/${req.file.filename}` : "";

  if (!title || !image_path || !category_id || !description) {
    return res
      .status(400)
      .json({ error: "Всі обов’язкові поля мають бути заповнені" });
  }

  const query = `INSERT INTO Posts (title, image_path, category_id, description, details) VALUES (?, ?, ?, ?, ?)`;
  const values = [title, image_path, category_id, description, details];

  db.query(query, values, (err, result) => {
    if (err) {
      return res.status(500).json({ error: "Помилка додавання поста" });
    }
    res.json({ message: "Пост успішно додано", postId: result.insertId });
  });
});

app.get("/posts", (req, res) => {
  const query = `
      SELECT Posts.id, Posts.title, Posts.image_path, Posts.description, Posts.details, Categories.name AS category_name 
      FROM Posts 
      INNER JOIN Categories ON Posts.category_id = Categories.id
      ORDER BY Posts.created_at DESC
    `;

  db.query(query, (err, results) => {
    if (err) {
      return res.status(500).json({ error: "Помилка отримання постів" });
    }
    res.json(results);
  });
});

app.listen(port, () => {
  console.log(`Сервер запущено на http://localhost:${port}`);
});
