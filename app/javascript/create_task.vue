<template>
  <div>
    <input
      type="text"
      placeholder="add new task (Press Enter to add)..."
      v-model="task_name"
      @keyup.enter="_create(card)"
      class="new-task"
    />
  </div>
</template>

<script>
import axios from "axios";

export default {
  name: "add-task",
  props: ["card"],
  data() {
    return {
      task_name: ""
    };
  },
  methods: {
    async _create({ id: card_id }) {
      const task = {
        name: this.$data.task_name
      };

      try {
        const response = await axios.post(
          window.location.pathname + `/${card_id}/tasks.json`,
          task
        );
        console.log(response);
        this.$emit("update-tasks", response.data);
        this.$data.task_name = ""; // clear input
      } catch (error) {
        console.log(error, window.location.pathname + `/${card_id}/tasks/`);
      }
    }
  }
};
</script>

<style>
.new-task {
  padding: 8px;
  font-size: 18px;
  font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
  border: none;
  margin-bottom: 15px;
  width: 100%;
}
</style>
