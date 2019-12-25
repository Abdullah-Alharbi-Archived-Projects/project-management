<template>
  <div>
    <input
      type="text"
      placeholder="add new task (Press Enter to add)..."
      v-model="task_name"
      @keyup.enter="_create(card)"
    />
  </div>
</template>

<script>
import axios from "axios";

export default {
  name: "add-task",
  props: ["card", "tasks"],
  data() {
    return {
      task_name: ""
    };
  },
  methods: {
    async _create({ id: card_id }) {
      const task = {
        card_id,
        name: this.$data.task_name
      };

      try {
        const response = await axios.post(
          window.location.pathname + `/${card_id}/tasks/`,
          task
        );
        console.log(response, task);

        // this.$props.tasks.push(task);
        this.$emit("update-tasks", task);
        this.$data.task_name = ""; // clear input
      } catch (error) {
        console.log(error, window.location.pathname + `/${card_id}/tasks/`);
      }
    }
  }
};
</script>

<style></style>
