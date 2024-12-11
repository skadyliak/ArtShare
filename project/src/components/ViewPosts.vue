<template>
  <div class="posts-container">
    <aside class="sidebar">
      <h3>Сортування</h3>
      <label>
        <input
          type="radio"
          name="sort"
          value="title"
          v-model="sortBy"
          @change="applyFilters"
        />
        За назвою
      </label>
      <label>
        <input
          type="radio"
          name="sort"
          value="date"
          v-model="sortBy"
          @change="applyFilters"
        />
        За датою
      </label>

      <h3>Категорії</h3>
      <div v-for="category in categories" :key="category">
        <label>
          <input
            type="checkbox"
            :value="category"
            v-model="selectedCategories"
            @change="applyFilters"
          />
          {{ category }}
        </label>
      </div>

      <h3>Пошук за назвою</h3>
      <input
        type="text"
        v-model="filters.title"
        placeholder="Пошук по назві"
        @input="applyFilters"
      />

      <h3>Пошук за описом</h3>
      <input
        type="text"
        v-model="filters.description"
        placeholder="Пошук по опису"
        @input="applyFilters"
      />
    </aside>

    <div class="posts">
      <h1>Список постів</h1>
      <div v-if="error" class="error">{{ error }}</div>
      <div v-if="loading" class="loading">Завантаження постів...</div>
      <div v-else class="post-list">
        <div v-for="post in paginatedPosts" :key="post.id" class="post-card">
          <img :src="post.image_path" alt="Post Image" class="post-image" />
          <div class="post-content">
            <h2 class="post-title">{{ post.title }}</h2>
            <p class="post-category">Категорія: {{ post.category_name }}</p>
            <p class="post-description">{{ post.description }}</p>
            <button @click="openModal(post)" class="view-details">
              Детальніше
            </button>
          </div>
        </div>
      </div>

      <div class="pagination">
        <button @click="prevPage" :disabled="currentPage === 1">Назад</button>
        <span>Сторінка {{ currentPage }} з {{ totalPages }}</span>
        <button @click="nextPage" :disabled="currentPage === totalPages">
          Вперед
        </button>
      </div>
    </div>

    <div v-if="showModal" class="modal" @click.self="closeModal">
      <div class="modal-content">
        <span class="close" @click="closeModal">&times;</span>
        <div class="image-cont">
          <img
            :src="modalPost.image_path"
            alt="Post Image"
            class="modal-image"
          />
        </div>
        <h2>{{ modalPost.title }}</h2>
        <p><strong>Категорія:</strong> {{ modalPost.category_name }}</p>
        <p><strong>Опис:</strong> {{ modalPost.description }}</p>
        <p><strong>Деталі:</strong> {{ modalPost.details }}</p>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";

export default {
  data() {
    return {
      posts: [],
      filteredPosts: [],
      categories: [],
      selectedCategories: [],
      loading: true,
      error: null,
      filters: {
        title: "",
        description: "",
      },
      sortBy: "date",
      currentPage: 1,
      postsPerPage: 4,
      showModal: false,
      modalPost: {},
    };
  },
  computed: {
    totalPages() {
      return Math.ceil(this.filteredPosts.length / this.postsPerPage);
    },
    paginatedPosts() {
      const start = (this.currentPage - 1) * this.postsPerPage;
      const end = start + this.postsPerPage;
      return this.filteredPosts.slice(start, end);
    },
  },
  methods: {
    async fetchPosts() {
      try {
        const response = await axios.get("http://localhost:3000/posts");
        this.posts = response.data;
        this.filteredPosts = this.posts;
        this.categories = [
          ...new Set(this.posts.map((post) => post.category_name)),
        ];
      } catch (err) {
        this.error = err.response?.data?.error || "Помилка завантаження постів";
      } finally {
        this.loading = false;
      }
    },
    openModal(post) {
      this.modalPost = post;
      this.showModal = true;
    },
    closeModal() {
      this.showModal = false;
    },
    applyFilters() {
      this.filteredPosts = this.posts
        .filter((post) => {
          const matchesTitle =
            !this.filters.title ||
            post.title.toLowerCase().includes(this.filters.title.toLowerCase());
          const matchesDescription =
            !this.filters.description ||
            post.description
              .toLowerCase()
              .includes(this.filters.description.toLowerCase());
          const matchesCategory =
            !this.selectedCategories.length ||
            this.selectedCategories.includes(post.category_name);
          return matchesTitle && matchesDescription && matchesCategory;
        })
        .sort((a, b) => {
          if (this.sortBy === "title") {
            return a.title.localeCompare(b.title);
          } else if (this.sortBy === "date") {
            return new Date(b.date) - new Date(a.date);
          }
          return 0;
        });

      this.currentPage = 1;
    },

    prevPage() {
      if (this.currentPage > 1) this.currentPage--;
    },
    nextPage() {
      if (this.currentPage < this.totalPages) this.currentPage++;
    },
  },
  created() {
    this.fetchPosts();
  },
};
</script>

<style scoped>
.modal {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.5);
  display: flex;
  justify-content: center;
  align-items: center;
  z-index: 1000;
}

.modal-content {
  background-color: white;
  padding: 40px;
  border-radius: 8px;
  width: 800px;
  max-width: 90%;
  max-height: 80%;
  overflow-y: auto;
}

.image-cont {
  display: flex;
  justify-content: center;
}

.modal-image {
  width: 700px;
  height: auto;
  object-fit: contain;
}

.close {
  position: absolute;
  top: 10px;
  right: 10px;
  font-size: 40px;
  background-color: white;
  padding: 2px 10px;
  border-radius: 5px;
  cursor: pointer;
}
.posts-container {
  max-width: 1000px;
  margin: 0 auto;
  display: flex;
  justify-content: center;
  gap: 20px;
  font-family: Arial, sans-serif;
}

.sidebar {
  width: 250px;
  padding: 20px;
  background-color: #f4f4f4;
  border-radius: 8px;
}

.sidebar h3 {
  font-size: 18px;
  margin-bottom: 15px;
}

.sidebar label,
.sidebar input {
  margin-bottom: 10px;
}

.posts {
  flex: 1;
  padding: 20px;
}

.error {
  color: red;
  font-weight: bold;
}

.loading {
  color: #555;
  font-style: italic;
}

.post-list {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  gap: 20px;
}

.post-card {
  border: 1px solid #ccc;
  border-radius: 8px;
  overflow: hidden;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  transition: transform 0.2s;
}

.post-card:hover {
  transform: translateY(-5px);
}

.post-image {
  width: 100%;
  height: 250px;
  object-fit: cover;
}

.post-content {
  padding: 15px;
}

.post-title {
  font-size: 18px;
  margin: 0 0 10px;
  color: #333;
}

.post-category {
  font-size: 14px;
  color: #666;
  margin: 0 0 10px;
}

.post-description {
  font-size: 16px;
  margin: 0 0 10px;
  color: #444;
}

.view-details {
  padding: 8px 12px;
  font-size: 14px;
  color: white;
  background-color: #ff9e2c;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  transition: background-color 0.2s;
}

.view-details:hover {
  background-color: #e88b1f;
}

.pagination {
  margin-top: 20px;
  display: flex;
  justify-content: center;
  align-items: center;
  gap: 10px;
}

.pagination button {
  padding: 8px 12px;
  font-size: 14px;
  color: white;
  background-color: #ff9e2c;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  transition: background-color 0.2s;
}

.pagination button:disabled {
  background-color: #ddd;
  cursor: not-allowed;
}

.pagination button:hover:not(:disabled) {
  background-color: #e88b1f;
}
</style>
