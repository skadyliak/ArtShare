<template>
  <header>
    <nav>
      <div class="logo">
        <a href="#/" class="header-text">
          Art<span class="highlight">Share</span>
          <i class="fas fa-palette"></i>
        </a>
      </div>
      <div class="burger-icon" @click="toggleMenu">
        <i class="fas fa-bars"></i>
      </div>
      <div :class="['nav-links', { 'is-active': isMenuOpen }]">
        <ul class="nav-links">
          <li :class="{ active: isActive('/') }">
            <a href="#/">Головна</a>
          </li>
          <li :class="{ active: isActive('/add_post') }">
            <a href="#/add_post">Додати допис</a>
          </li>
          <li :class="{ active: isActive('/view_posts') }">
            <a href="#/view_posts">Переглянути дописи</a>
          </li>
          <li :class="{ active: isActive('/contacts') }">
            <a href="#/contacts">Контакти</a>
          </li>
        </ul>
      </div>
    </nav>
  </header>
</template>

<script>
export default {
  data() {
    return {
      isLoggedIn: false,
      isMenuOpen: false,
    };
  },
  created() {
    this.checkAuthStatus();
  },
  methods: {
    isActive(link) {
      return this.$route.path === link;
    },
    checkAuthStatus() {
      this.isLoggedIn = localStorage.getItem("isLoggedIn") === "true";
    },
    logout() {
      localStorage.removeItem("token");
      localStorage.setItem("isLoggedIn", "false");
      this.isLoggedIn = false;
      this.$router.push("/login");
    },
    toggleMenu() {
      this.isMenuOpen = !this.isMenuOpen;
    },
  },
  watch: {
    $route() {
      this.checkAuthStatus();
      this.isMenuOpen = false;
    },
  },
};
</script>

<style>
header {
  background-color: white;
  position: fixed;
  top: 0;
  width: 100%;
  z-index: 1000;
  height: 78px;
  border-top: 3px solid #424551;
  border-bottom: 3px solid #424551;
  padding: 15px 0;
}

.header-text {
  font-weight: 700;
  font-size: 35px;
  color: #424551;
  text-decoration: none;
}

.header-text .lightbulb {
  color: #fd462e;
  margin-left: 10px;
}

nav {
  background-color: white;
  display: flex;
  align-items: center;
  justify-content: space-between;
  margin: 0 auto 0;
  max-width: 1000px;
}

.nav-links ul li.active a,
.nav-links ul li a:hover {
  background-color: #fbcd35;
  border-radius: 5px;
}

.nav-links,
.auth-links {
  display: flex;
  align-items: center;
}

.nav-links ul {
  display: flex;
  list-style-type: none;
  gap: 1.5em;
}

.nav-links ul li a,
.auth-links a {
  color: #424551;
  text-decoration: none;
  font-weight: 700;
  padding: 8px;
}

.auth-links a {
  background-color: #fd462e;
  padding: 8px 15px;
  border-radius: 5px;
  color: white;
  transition: 0.5s ease;
}

.auth-links a:hover {
  background-color: white;
  color: #fd462e;
}

.auth-links div {
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  gap: 20px;
}

.burger-icon {
  display: none;
}

.logo .highlight {
  color: #fbcd35;
}

.logo i {
  margin-left: 10px;
  color: #fbcd35;
  font-size: 22px;
}
</style>
