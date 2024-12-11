<template>
  <section class="contact-hero">
    <div class="hero-content">
      <h1>Зв'яжіться з нами</h1>
      <p>Ми тут, щоб допомогти вам і відповісти на всі ваші запитання!</p>
    </div>
    <div class="contact-details details-content">
      <div class="contact-info">
        <h2>Контактна інформація</h2>
        <ul>
          <li><i class="fas fa-phone"></i> +380 (67) 123-45-67</li>
          <li><i class="fas fa-envelope"></i> info@artcommunity.com</li>
          <li><i class="fas fa-map-marker-alt"></i> Київ, Україна</li>
        </ul>
      </div>
      <div class="contact-socials">
        <h2>Соціальні мережі</h2>
        <ul>
          <li>
            <a href="#"><i class="fab fa-facebook"></i> Facebook</a>
          </li>
          <li>
            <a href="#"><i class="fab fa-instagram"></i> Instagram</a>
          </li>
          <li>
            <a href="#"><i class="fab fa-twitter"></i> Twitter</a>
          </li>
        </ul>
      </div>
    </div>
  </section>
  <section class="contact-gallery">
    <h2>Кращі роботи</h2>
    <div class="gallery-images">
      <img src="../assets/cont-1.jpg" alt="Галерея 1" />
      <img src="../assets/cont-2.webp" alt="Галерея 2" />
      <img src="../assets/cont-3.webp" alt="Галерея 3" />
    </div>
  </section>

  <section class="contact-map">
    <div class="map-cont">
      <h2>Де ми знаходимося</h2>
      <div class="map-container">
        <iframe
          src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3176.9552279147813!2d30.5234!3d50.4501!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x40d4cc1dce5b1237%3A0x6d3f25e42bd1234!2sKyiv!5e0!3m2!1sen!2sua!4v1637551627310!5m2!1sen!2sua"
          width="1000"
          height="400"
          style="border: 0"
          loading="lazy"
        ></iframe>
      </div>
    </div>
  </section>
</template>

<style>
.contact-hero {
  padding: 50px 20px;
  display: flex;
  max-width: 1000px;
  margin: 0 auto;
  align-items: center;
  justify-content: space-between;
}

.contact-hero .hero-content h1 {
  font-size: 3rem;
  color: #333;
}

.contact-hero img {
  flex: 1;
  max-width: 50%;
  border-radius: 10px;
}

.contact-details {
  background-color: #fbcd35;
  padding: 20px;
  color: #424551;
}
.contact-info,
.contact-socials {
  flex: 1;
}

.contact-info ul,
.contact-socials ul {
  list-style: none;
  padding: 0;
}

.contact-info li,
.contact-socials li {
  font-size: 1.2rem;
  margin-bottom: 10px;
}

.contact-info i,
.contact-socials i {
  margin-right: 10px;
  color: #424551;
}

.contact-socials a {
  color: #424551;
  text-decoration: none;
}

.contact-socials a:hover {
  text-decoration: underline;
}

.contact-gallery {
  text-align: center;
  padding: 50px 20px;
}

.gallery-images {
  display: flex;
  justify-content: center;
  gap: 20px;
  margin-top: 20px;
  max-width: 1000px;
  margin: 0 auto;
}

.gallery-images img {
  width: 30%;
  border-radius: 15px;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
  object-fit: cover;
  transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.gallery-images img:hover {
  transform: scale(1.2);
  box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3);
}

.contact-map {
  padding: 50px 20px;
  background-color: #f4f4f4;
}

.map-cont {
  max-width: 1000px;
  margin: 0 auto;
}

.map-container iframe {
  border-radius: 10px;
}
</style>
