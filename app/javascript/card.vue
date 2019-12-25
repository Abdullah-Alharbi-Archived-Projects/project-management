<template>
  <div class="card">
    <div class="sticky-top">
      <div class="card-title" @dblclick="onDbClick">
        <strong v-if="!editCard">{{ card.title }}</strong>
        <div class="edit" v-else>
          <input
            type="text"
            placeholder="Edit Card name"
            v-model="card.title"
            @keyup.enter="enter"
            class="input"
            :autofocus="true"
          />

          <el-button
            type="danger"
            icon="el-icon-delete"
            size="mini"
            class="fz-18"
            @click.prevent="destroy"
            circle
          ></el-button>
        </div>
      </div>
    </div>

    <draggable
      v-model="card.tasks"
      @change="log"
      @start="drag = true"
      @end="drag = false"
      :group="{ name: 'card', pull: true, put: true }"
    >
      <div v-for="task in card.tasks" :key="task.id" class="tasks">
        <task :task="task" @update-task="updateTask" @delete-task="destroyTask"></task>
      </div>
    </draggable>

    <div class="sticky-bottom background">
      <create-task :card="card" @update-tasks="addTask"></create-task>
    </div>
  </div>
</template>

<script>
import Task from "./task";
import CreateTask from "./create_task";
import draggable from "vuedraggable";
import fetch from "node-fetch";
import urlencoded from "form-urlencoded";

export default {
  name: "card",
  props: ["card"],
  data() {
    return {
      editCard: false
    };
  },
  methods: {
    destroyTask(task) {
      const card = this.$props.card;
      card.tasks = card.tasks.filter(t => t.id !== task.id);
    },
    addTask(task) {
      const card = this.$props.card;
      console.log(task);
      card.tasks.push(task);
    },
    updateTask(task) {
      const url = this.generate(task);

      fetch(url, {
        method: "PATCH",
        body: urlencoded({
          task: { name: task.name, position: task.position }
        }),
        headers: { "Content-Type": "application/x-www-form-urlencoded" }
      })
        .then(response => response.json())
        .catch(err => console.log);
    },
    log({ added, moved }) {
      if (added) {
        this._send(added);
      }

      if (moved) {
        this._send(moved);
        console.log(moved);
      }
    },
    _send(data) {
      const task = data.element;
      task.position = data.newIndex;
      console.log(task.position);

      this.$emit("moved-task", task); // raise event to parent
    },
    onDbClick() {
      this.$data.editCard = true;
    },
    enter() {
      this.$data.editCard = false;
      // raise event to parent -> card
      this.$emit("update-card", this.$props.card);
    },
    async destroy() {
      const card = this.$props.card;
      try {
        const response = await fetch(
          window.location.pathname + `/${card.id}/`,
          {
            method: "DELETE"
          }
        );
        console.log(response);
        this.$data.editMode = false;

        this.$emit("delete-card", card);
      } catch (error) {
        console.log(error, window.location.pathname + `/${card.id}/cards/`);
      }
    }
  },
  components: { CreateTask, Task, draggable }
};
</script>

<style>
.card {
  background-color: #dfe6e9;
  margin: 0;
  padding: 0 15px;
  overflow-y: auto;
  height: auto;
  max-height: 500px;
  position: relative;
}
.sticky-top {
  position: sticky;
  top: 0;
}
.sticky-bottom {
  position: sticky;
  bottom: 0;
}
.card-title {
  background-color: #74b9ff;
  color: #fff;
  width: 100%;
  padding: 8px;
}

.tasks {
  margin-top: 10px;
}
.background {
  padding: 5px;
  background-color: #636e72;
}
</style>
