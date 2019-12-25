<template>
  <div class="task" @dblclick="onDbClick">
    <strong>id: {{ task.id }}</strong>
    <br />
    <strong class="name" v-if="!editMode">{{ task.name }}</strong>
    <div class="edit-mode" v-else>
      <div class="flex">
        <input
          type="text"
          placeholder="Edit Task name"
          v-model="task.name"
          @keyup.enter="enter"
          @keyup.esc="editMode = false"
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
</template>

<script>
import fetch from "node-fetch";

export default {
  name: "task",
  props: ["task"],
  data() {
    return {
      editMode: false
    };
  },
  methods: {
    onDbClick() {
      this.$data.editMode = true;
    },
    enter() {
      this.$data.editMode = false;
      // raise event to parent -> card
      this.$emit("update-task", this.$props.task);
    },
    async destroy() {
      const task = this.$props.task;
      try {
        const response = await fetch(
          window.location.pathname + `/${task.card_id}/tasks/${task.id}/`,
          {
            method: "DELETE"
          }
        );
        console.log(response);
        this.$data.editMode = false;

        this.$emit("delete-task", task);
      } catch (error) {
        console.log(
          error,
          window.location.pathname + `/${task.card_id}/tasks/`
        );
      }
    }
  }
};
</script>

<style>
.task {
  background-color: #636e72;
  color: #ffffff;
  margin: 0;
  padding: 10px;
  margin-bottom: 15px;
  width: 95%;
  font-size: 18px;
  font-family: "Gill Sans", "Gill Sans MT", Calibri, "Trebuchet MS", sans-serif;
}
.input {
  padding: 8px;
  font-size: 18px;
  font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
  border: none;
  outline: none;
  margin: 0 15px;
}

.flex {
  display: flex;
  justify-content: center;
  align-items: center;
}
.fz-18 {
  font-size: 18px;
}
</style>
