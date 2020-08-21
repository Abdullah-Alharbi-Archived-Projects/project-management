<template>
  <div class="d-flex w-100 pt-5">
    <div v-for="card in cards" :key="card.id" class="col-3 ml-15">
      <card
        :card="card"
        @update-card="updateCard"
        @delete-card="destroyCard"
        @moved-task="movedTask"
      ></card>
    </div>
  </div>
</template>

<script>
import Card from "./card";
import fetch from "node-fetch";
import urlencoded from "form-urlencoded";

export default {
  name: "cards",
  data() {
    return {
      cards: [],
    };
  },
  methods: {
    movedTask({ task, card_id, old_card_id }) {
      fetch(
        window.location.href +
          `/${old_card_id ? old_card_id : task.card_id}/tasks/${task.id}`,
        {
          method: "PATCH",
          body: urlencoded({
            task: {
              name: task.name,
              card_id: card_id ? card_id : task.card_id,
              position: task.position,
            },
          }),
          headers: { "Content-Type": "application/x-www-form-urlencoded" },
        }
      )
        .then((response) => response.json())
        .then((data) => console.log(data, this.$props.card))
        .catch((err) => console.log);
    },
    updateCard(card) {
      fetch(window.location.href + `/${card.id}/`, {
        method: "PATCH",
        body: urlencoded({
          card: { title: card.title, position: card.position },
        }),
        headers: { "Content-Type": "application/x-www-form-urlencoded" },
      })
        .then((response) => response.json())
        .catch((err) => console.log);
    },
    destroyCard(card) {
      const cards = this.$data.cards.filter((c) => c.id !== card.id);
      this.$data.cards = cards;
    },
  },
  created() {
    var element = document.querySelector("#cards");
    var data = element ? JSON.parse(element.dataset.cards) : null;
    this.$data.cards = data;
    element.remove();
  },
  components: { Card },
};
</script>

<style>
.w-100 {
  width: 100%;
}
.p-5 {
  padding: 15px;
}
.ml-15 {
  margin-left: 15px;
}
</style>
