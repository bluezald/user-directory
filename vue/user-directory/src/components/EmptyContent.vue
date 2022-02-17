<template>
  <div class="empty-state">
    <i class="fa fa-face-disappointed"></i>
    <h3 class="">{{ title }}</h3>
    <p>{{ description }}</p>
  </div>
</template>

<script>

export default {
  name: 'EmptyContent',
  props: {
    title: {
      type: String,
      default() {
        return 'No Users Found'
      }
    },
    description: {
      type: String,
      default() {
        return 'There\'s no users based on your search query...'
      }
    }
  }
}
</script>

<style scoped>
.empty-state {
  text-align: center;
  padding-top: 4em;
}
</style>