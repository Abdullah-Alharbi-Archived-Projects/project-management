<template>
  <div class="home d-flex h-100 w-100 justify-content-center align-items-center flex-column">
    <h1 class="mb-2">Welcome to PMT</h1>
    <p class="lead">
      A Full-Stack Web App built by
      <span class="engineer">Abdullah Alharbi</span>
    </p>

    <div class="tech my-3">
      <h3>Technlogies:</h3>

      <div class="front-end my-4">
        <strong>Front-End:</strong>
        <ul>
          <li>
            Framework:
            <a href="#!">Vue.js</a>
          </li>
          <li>
            Bundler:
            <a href="#!">Webpack</a>
          </li>
          <li>
            Component UI:
            <a href="#!">Element UI</a>
          </li>
          <li>
            Grid System:
            <a href="#!">Bootstrap Grid</a>
          </li>
          <li>Type: Server-side Rendering</li>
        </ul>
      </div>
      <div class="back-end">
        <strong>Back-end</strong>

        <ul>
          <li>
            Language:
            <a href="#!">Ruby</a>
          </li>
          <li>
            Framework:
            <a href="#!">Ruby on Rails</a>
          </li>
          <li>
            Database:
            <a href="#!">Postgresql</a>
          </li>
        </ul>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "app",
};
</script>

<style>
.h-100 {
  height: 100%;
}

.w-100 {
  width: 100%;
}
</style>