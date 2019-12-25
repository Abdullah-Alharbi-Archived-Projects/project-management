<template>
  <div class="add_card">
    <el-button @click="visible = true">Add Card</el-button>
    <el-dialog :visible.sync="visible" title="Hello world">
      <p>Try Element</p>
    </el-dialog>
  </div>
</template>

<script>
export default {
  name: "add-card",
  data() {
    return {
      visible: false
    };
  }
};
</script>

<style>
</style>