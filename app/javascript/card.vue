<template>
  <div class="card">
    <div class="sticky-top">
      <div class="card-title" @dblclick="onDbClick">
        <strong v-if="!editCard">{{ card.title }}</strong>
        <div class="edit" v-else>
          <input
            type="text"
            placeholder="Edit Card name"
            v-model="newTitle"
            @keyup.enter="enter"
            @keyup.esc="clear"
            class="input"
            ref="editable"
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

    <div class="sticky-bottom background add-task">
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
      editCard: false,
      newTitle: `${this.$props.card.title}`,
    };
  },
  methods: {
    destroyTask(task) {
      const card = this.$props.card;
      card.tasks = card.tasks.filter((t) => t.id !== task.id);
    },
    addTask(task) {
      const card = this.$props.card;
      card.tasks.push(task);
    },
    clear() {
      this.editCard = false;
      this.newTitle = `${this.$props.card.title}`;
    },
    updateTask(task) {
      const location = window.location.href.split("/");

      const org_id = location[4];
      const project_id = location[6];

      const url =
        window.location.pathname + `/${task.card_id}/tasks/${task.id}`;

      fetch(url, {
        method: "PATCH",
        body: urlencoded({
          task: { name: task.name, position: task.position },
        }),
        headers: { "Content-Type": "application/x-www-form-urlencoded" },
      })
        .then((response) => response.json())
        .catch((err) => console.log);
    },
    log({ added, moved }) {
      if (added) {
        this._send(added);
      }

      if (moved) {
        this._send(moved);
      }
    },
    _send(data) {
      const task = data.element;
      task.position = data.newIndex == 0 ? 1 : data.newIndex - 1;
      const old_card_id = task.card_id;
      task.card_id = this.card.id;

      this.$emit("moved-task", {
        task,
        card_id: this.card.id,
        old_card_id,
      }); // raise event to parent
    },
    onDbClick() {
      this.$data.editCard = true;
      this.$nextTick(() => this.$refs.editable.focus());
    },
    enter() {
      this.$data.editCard = false;
      this.$props.card.title = this.newTitle;
      // raise event to parent -> card
      this.$emit("update-card", this.$props.card);
    },
    async destroy() {
      const card = this.$props.card;
      try {
        const response = await fetch(
          window.location.pathname + `/${card.id}/`,
          {
            method: "DELETE",
          }
        );
        console.log(response);
        this.$data.editMode = false;

        this.$emit("delete-card", card);
      } catch (error) {
        console.log(error, window.location.pathname + `/${card.id}/cards/`);
      }
    },
  },
  components: { CreateTask, Task, draggable },
};
</script>

<style>
.card {
  background-color: #dfe6e9;
  margin: 0;
  padding: 0;
  overflow-y: auto;
  height: 700px;
  max-height: 700px;
  min-width: 300px;
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
  font-size: 18px;
  border-radius: 4px 4px 0 0;
}

.tasks {
  margin-top: 10px;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}
.background {
  padding: 5px;
  background-color: #636e72;
  border-radius: 0 0 4px 4px;
}

.add-task {
  display: flex;
  justify-content: center;
  align-items: center;
}
</style>
