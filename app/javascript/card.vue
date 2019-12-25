<template>
  <div class="card-title">
    <strong>{{ card.title }}</strong>
  </div>
</template>

<script>
export default {
  name: "card",
  props: ["card"]
};
</script>

<style>
.card-title {
  background-color: #74b9ff;
  color: #fff;
  width: 100%;
  padding: 8px;
}
</style>
