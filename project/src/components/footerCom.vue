<template>
  <footer class="footer">
    <div class="footer-container">
      <div class="footer-section footer-about">
        <h3>Про платформу</h3>
        <p>
          Art<span class="highlight">Share</span> — платформа для обміну
          творчістю, що допомагає митцям ділитися роботами, розвивати свої
          таланти та знаходити однодумців.
        </p>
      </div>
      <div class="footer-section footer-links">
        <h3>Посилання</h3>
        <ul>
          <li><a href="#/">Головна</a></li>
          <li><a href="#/add_post">Додати допис</a></li>
          <li><a href="#/view_posts">Переглянути дописи</a></li>
          <li><a href="#/contacts">Контакти</a></li>
        </ul>
      </div>
      <div class="footer-section footer-contact">
        <h3>Контакти</h3>
        <p><i class="fas fa-phone"></i> +38 (012) 345-6789</p>
        <p><i class="fas fa-envelope"></i> info@artshare.com</p>
        <p><i class="fas fa-map-marker-alt"></i> Київ, Україна</p>
      </div>
      <div class="footer-section footer-social">
        <h3>Соціальні мережі</h3>
        <a href="https://facebook.com" target="_blank"
          ><i class="fab fa-facebook-f"></i
        ></a>
        <a href="https://twitter.com" target="_blank"
          ><i class="fab fa-twitter"></i
        ></a>
        <a href="https://instagram.com" target="_blank"
          ><i class="fab fa-instagram"></i
        ></a>
        <a href="https://linkedin.com" target="_blank"
          ><i class="fab fa-linkedin-in"></i
        ></a>
      </div>
    </div>
    <div class="footer-bottom">
      <span>&copy; 2024 ArtShare. Всі права захищено.</span>
    </div>
  </footer>
</template>

<script>
export default {};
</script>

<style scoped>
.footer {
  background-color: white;
  color: #424551;
  padding: 30px 0;
  font-family: "Roboto", sans-serif;
  border-top: 3px solid #424551;
  border-bottom: 3px solid #424551;
}
.footer-container {
  display: flex;
  justify-content: space-between;
  flex-wrap: wrap;
  gap: 20px;
  max-width: 1000px;
  margin: 0 auto;
}
.footer-section {
  flex: 1;
  min-width: 220px;
}
.footer-section h3 {
  font-size: 1.2em;
  color: #424551;
  margin-bottom: 10px;
}
.footer-section p,
.footer-section ul {
  font-size: 0.9em;
  line-height: 1.6;
}
.footer-section ul {
  list-style: none;
  padding: 0;
}
.footer-section ul li {
  margin-bottom: 10px;
}
.footer-section ul li a {
  color: #424551;
  text-decoration: none;
  font-weight: 700;
  transition: color 0.3s;
}
.footer-section ul li a:hover {
  color: #fbcd35;
}
.footer-section i {
  margin-right: 10px;
}
.footer-social a {
  color: #424551;
  font-size: 1.5em;
  margin-right: 10px;
  text-decoration: none;
  transition: color 0.3s;
}
.footer-social a:hover {
  color: #fbcd35;
}
.footer-bottom {
  text-align: center;
  margin-top: 20px;
  font-size: 0.9em;
  color: #424551;
}
.footer-section .highlight {
  color: #fbcd35;
}
</style>
