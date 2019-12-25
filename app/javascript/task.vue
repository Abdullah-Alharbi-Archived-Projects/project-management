<template>
  <div class="task">
    <strong>id: {{ task.id }}</strong>
    <div class="name">{{ task.name }}</div>
  </div>
</template>

<script>
export default {
  name: "task",
  props: ["task"]
};
</script>

<style>
.task {
  background-color: #636e72;
  padding: 8px;
  color: #ffffff;
  margin-bottom: 15px;
  overflow-y: auto;
}
</style>
