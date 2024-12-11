<template>
  <main>
    <section class="full-width-image">
      <img src="../assets/main.jpg" alt="Art Inspiration" />
      <div class="image-text">
        <h1>Discover the Art Within</h1>
      </div>
    </section>
    <section class="borders">
      <div class="art-love-section">
        <div class="text-left">
          <h2>Ви любите мистецтво?</h2>
        </div>
        <div class="text-right">
          <p>
            Ознайомтесь з роботами інших митців, поділіться своєю творчістю та
            надихайтесь. Мистецтво об'єднує нас усіх!
          </p>
          <a href="#/view_posts" class="btn-link">Переглянути роботи</a>
        </div>
      </div>
    </section>
    <section class="about-section">
      <div class="marquee-section marquee-background">
        <marquee>Celebrating the power of creativity</marquee>
      </div>
      <div class="about-content">
        <div class="about-text">
          <h2>Що <span class="highlight">ми робимо</span>?</h2>
          <p class="mission">
            Ми — спільнота художників та поціновувачів мистецтва, яка прагне
            популяризувати силу творчості.
          </p>
        </div>
        <div class="about-images">
          <img src="../assets/art-1.jpg" alt="Творча робота 1" />
          <img src="../assets/art-2.jpg" alt="Творча робота 2" />
          <img src="../assets/art-3.webp" alt="Творча робота 3" />
        </div>
      </div>
      <div class="about-description">
        <p>
          Наша місія — об'єднати людей завдяки творчості та уяві, а також надати
          платформу для митців, щоб вони могли демонструвати свої роботи та
          взаємодіяти зі своєю аудиторією.
        </p>
      </div>
    </section>
    <section class="join-artists-section">
      <div class="join-artists-content">
        <div class="text-left">
          <h2>Приєднуйтесь до нашої спільноти художників!</h2>
        </div>
        <div class="text-right">
          <p>
            Діліться своїми роботами, отримуйте зворотний зв'язок і надихайте
            інших. Наша платформа допоможе вам знайти свою аудиторію.
          </p>
          <a href="#/add_post" class="btn-link">Додати свою роботу</a>
        </div>
      </div>
    </section>
  </main>
</template>

<script>
export default {};
</script>

<style scoped>
.full-width-image {
  position: relative;
  width: 100%;
  height: 500px;
  overflow: hidden;
  margin-top: 70px;
}
.full-width-image img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  object-position: top;
}
.image-text {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  color: white;
  font-size: 2.5rem;
  padding: 10px 20px;
  border-radius: 5px;
}

/* Art Love Section */
.borders {
  border-top: 3px solid #424551;
  border-bottom: 3px solid #424551;
  padding: 100px 20px;
  margin: 50px 0;
}
.art-love-section {
  display: flex;
  justify-content: space-between;
  align-items: center;
  gap: 70px;
  max-width: 900px;
  margin: 0 auto;
}
.text-left {
  flex: 1;
}
.text-left h2 {
  font-size: 2rem;
}
.text-right {
  flex: 1;
}
.text-right p {
  font-size: 1rem;
  text-align: left;
  margin-bottom: 20px;
  color: #424551;
}
.btn-link {
  display: inline-block;
  text-decoration: none;
  color: white;
  background-color: #fbcd35;
  padding: 10px 15px;
  border-radius: 5px;
  transition: background-color 0.3s;
}
.btn-link:hover {
  background-color: #c09402;
}

/* Marquee Section */
.marquee-section {
  padding: 20px;
  background-color: #fbcd35;
  text-align: center;
}
.marquee-background {
  overflow: hidden;
  color: #424551;
  font-size: 1.5rem;
  font-weight: bold;
}
.about-content {
  display: flex;
  flex-wrap: wrap;
  align-items: center;
  justify-content: space-between;
  max-width: 1000px;
  margin: 30px auto;
}

.about-text {
  flex: 1;
  margin-right: 20px;
}

.about-text h2 {
  font-size: 2.5rem;
  color: #333;
  position: relative;
}

.about-text h2 .highlight {
  background-color: #fbcd35;
  padding: 0 5px;
}

.about-text p {
  font-size: 1rem;
  color: #555;
  line-height: 1.6;
}

.about-text .mission {
  margin-top: 20px;
  font-size: 1.2rem;
  color: #333;
  font-weight: bold;
}

.about-images {
  width: 60%;
  display: flex;
  gap: 10px;
  justify-content: center;
}

.about-images img {
  width: 30%;
  border-radius: 5px;
  object-fit: cover;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.about-description {
  max-width: 800px;
  text-align: center;
  margin: 0 auto;
  font-size: 18px;
  line-height: 30px;
}
/* Join Artists Section */
.join-artists-section {
  padding: 100px 20px;
  background-color: #f9f9f9;
  border-top: 3px solid #424551;
  margin: 50px 0 0;
}

.join-artists-content {
  display: flex;
  justify-content: space-between;
  align-items: center;
  gap: 50px;
  max-width: 900px;
  margin: 0 auto;
}

.join-artists-content .text-left {
  flex: 1;
}

.join-artists-content .text-left h2 {
  font-size: 2rem;
  color: #333;
  margin-bottom: 20px;
}

.join-artists-content .text-left p {
  font-size: 1rem;
  line-height: 1.6;
  color: #555;
}

.join-artists-content .text-right {
  flex: 1;
}

.join-artists-content .btn-link {
  display: inline-block;
  text-decoration: none;
  color: white;
  background-color: #fbcd35;
  padding: 15px 20px;
  font-size: 15px;
  border-radius: 5px;
  transition: background-color 0.3s ease;
}

.join-artists-content .btn-link:hover {
  background-color: #c09402;
}
</style>
