<template>
  <div class="row w-100">
    <div v-for="card in cards" :key="card.id" class="card col-3 ml-15">
      <card :card="card"></card>

      <div v-for="task in card.tasks" :key="task.id" class="tasks">
        <task :task="task"></task>
      </div>

      <create-task :card="card" :tasks="tasks" @update-tasks="addTask"></create-task>
    </div>
  </div>
</template>

<script>
import Task from "./task";
import CreateTask from "./create_task";
import Card from "./card";

export default {
  name: "cards",
  data() {
    return {
      cards: [],
      tasks: []
    };
  },
  methods: {
    addTask(task) {
      const card = this.$data.cards.filter(c => c.id === task.card_id)[0];
      card.tasks.push(task);
    }
  },
  created() {
    var element = document.querySelector("#cards");
    var data = element ? JSON.parse(element.dataset.cards) : null;
    this.$data.cards = data;
  },
  components: { Task, Card, CreateTask }
};
</script>

<style>
.card {
  background-color: #dfe6e9;
  margin: 0;
  padding: 0;
}

.w-100 {
  width: 100%;
}

.ml-15 {
  margin-left: 15px;
}
.tasks {
  margin-top: 10px;
}
</style>
