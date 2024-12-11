<template>
  <section class="post-form">
    <div class="form-container">
      <form @submit.prevent="submitPost">
        <div class="form-group">
          <label for="title"
            ><i class="fas fa-signature"></i> Підпис роботи</label
          >
          <input
            type="text"
            id="title"
            v-model="post.title"
            placeholder="Введіть назву..."
            required
          />
        </div>

        <div class="form-group">
          <label for="image"><i class="fas fa-image"></i> Фотографія</label>
          <input type="file" id="image" @change="handleFileChange" required />
          <p class="error-message" v-if="fileError">{{ fileError }}</p>
        </div>

        <div class="form-group">
          <label for="category"><i class="fas fa-tags"></i> Категорія</label>
          <select id="category" v-model="post.category">
            <option
              v-for="category in categories"
              :key="category.id"
              :value="category.id"
            >
              {{ category.name }}
            </option>
          </select>
        </div>

        <div class="form-group">
          <label for="text"><i class="fas fa-edit"></i> Опис</label>
          <textarea
            id="text"
            v-model="post.text"
            placeholder="Напишіть про вашу роботу..."
            required
          ></textarea>
        </div>

        <div class="form-group">
          <label for="details"><i class="fas fa-info-circle"></i> Деталі</label>
          <textarea
            id="details"
            v-model="post.details"
            placeholder="Додаткові деталі"
          ></textarea>
        </div>

        <button type="submit" class="submit-btn">
          <i class="fas fa-paper-plane"></i> Додати пост
        </button>
      </form>
    </div>
  </section>

  <section class="post-gallery">
    <h2><i class="fas fa-eye"></i> Попередній перегляд</h2>
    <div class="gallery-preview">
      <img :src="previewImage" alt="Preview Image" v-if="previewImage" />
      <div v-else>Завантажте фотографію, щоб побачити попередній перегляд.</div>
    </div>
  </section>
</template>

<script>
import axios from "axios";
import Swal from "sweetalert2";

export default {
  data() {
    return {
      post: {
        title: "",
        image: null,
        category: "",
        text: "",
        details: "",
      },
      categories: [],
      previewImage: null,
      fileError: "",
    };
  },
  methods: {
    handleFileChange(event) {
      const file = event.target.files[0];
      if (file) {
        const allowedTypes = [
          "image/jpeg",
          "image/png",
          "image/gif",
          "image/webp",
        ];
        if (!allowedTypes.includes(file.type)) {
          this.fileError =
            "Будь ласка, завантажте фото у форматі JPG, PNG, GIF або WEBP.";
          this.previewImage = null;
          this.post.image = null;
          return;
        }

        this.fileError = "";
        this.previewImage = URL.createObjectURL(file);
        this.post.image = file;
      }
    },
    submitPost() {
      if (!this.post.image) {
        Swal.fire({
          icon: "error",
          title: "Помилка",
          text: "Будь ласка, завантажте фото.",
          confirmButtonColor: "#FFC107",
        });
        return;
      }

      const formData = new FormData();
      formData.append("title", this.post.title);
      formData.append("image", this.post.image);
      formData.append("category_id", this.post.category);
      formData.append("description", this.post.text);
      formData.append("details", this.post.details);

      axios
        .post("http://localhost:3000/posts", formData)
        .then(() => {
          Swal.fire({
            icon: "success",
            title: "Успіх!",
            text: "Пост успішно додано!",
            confirmButtonColor: "#FFC107",
          }).then(() => {
            // Очищення полів
            this.post = {
              title: "",
              image: null,
              category: "",
              text: "",
              details: "",
            };
            this.previewImage = null;
            this.fileError = "";
            // Перенаправлення
            this.$router.push("/view_posts");
          });
        })
        .catch((error) => {
          console.error("Error posting:", error);
          Swal.fire({
            icon: "error",
            title: "Помилка",
            text: "Щось пішло не так. Спробуйте ще раз.",
            confirmButtonColor: "#FFC107",
          });
        });
    },
  },
  created() {
    axios
      .get("http://localhost:3000/categories")
      .then((response) => {
        this.categories = response.data;
      })
      .catch((error) => {
        console.error("Error fetching categories:", error);
      });
  },
};
</script>

<style scoped>
.error-message {
  color: #e74c3c;
  font-size: 0.9rem;
  margin-top: 5px;
}

.post-hero {
  padding: 50px 20px;
  background: linear-gradient(135deg, #ffdb1e, #ff9e2c);
  color: #fff;
  text-align: center;
  font-family: "Arial", sans-serif;
}

.post-hero .hero-content h1 {
  font-size: 3.5rem;
  margin-bottom: 10px;
  text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.2);
}

.post-hero .hero-content p {
  font-size: 1.2rem;
  margin-top: 10px;
  text-shadow: 1px 1px 4px rgba(0, 0, 0, 0.3);
}

.post-form {
  max-width: 600px;
  margin: 30px auto;
  background: rgba(255, 255, 255, 0.9);
  border-radius: 15px;
  box-shadow: 0 6px 10px rgba(0, 0, 0, 0.15);
  padding: 40px;
}

.form-container {
  display: flex;
  flex-direction: column;
  gap: 25px;
}

.form-group label {
  font-weight: bold;
  color: #333;
  margin: 14px 0;
  display: block;
  font-size: 15px;
}

.form-group label i {
  color: #ffd33d;
  margin-right: 5px;
}

.form-group input,
.form-group select,
.form-group textarea {
  width: 100%;
  margin-top: 5px;
  padding: 12px;
  border: 2px solid #ddd;
  border-radius: 8px;
  transition: border-color 0.3s ease;
}

.form-group input:focus,
.form-group select:focus,
.form-group textarea:focus {
  border-color: #ff9e2c;
  outline: none;
  box-shadow: 0 0 5px rgba(255, 158, 44, 0.7);
}

textarea {
  height: 120px;
}

.submit-btn {
  background: linear-gradient(135deg, #ffdb1e, #ff9e2c);
  color: #fff;
  padding: 15px;
  border: none;
  border-radius: 8px;
  font-size: 1.2rem;
  font-weight: bold;
  cursor: pointer;
  margin: 20px auto;
  transition: transform 0.3s ease, background-color 0.3s ease;
  text-shadow: 1px 1px 5px rgba(0, 0, 0, 0.2);
}

.submit-btn:hover {
  transform: translateY(-3px);
  background: linear-gradient(135deg, #ffd33d, #ff871e);
}

.post-gallery {
  max-width: 800px;
  margin: 30px auto;
  text-align: center;
}

.post-gallery h2 {
  font-size: 2rem;
  color: #333;
  margin-bottom: 20px;
}

.gallery-preview img {
  max-width: 100%;
  border-radius: 15px;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
  margin-top: 20px;
}

.gallery-preview {
  font-size: 1.2rem;
  color: #424551;
  font-style: italic;
}
</style>
