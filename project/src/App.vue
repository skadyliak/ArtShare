<template>
  <headerCom />
  <div class="margin">
    <router-view></router-view>
  </div>
  <footerCom />
</template>

<script>
import headerCom from "./components/headerCom.vue";
import footerCom from "./components/footerCom.vue";

export default {
  name: "App",
  components: {
    headerCom,
    footerCom,
  },
};
</script>

<style>
* {
  box-sizing: border-box;
}

html {
  height: 100%;
  margin: 0;
  padding: 0;
}
body {
  font-family: "Lato", sans-serif;
  margin: 70px 0 -170px;
  padding: 0;
}
html {
  scroll-behavior: smooth;
}
</style>
