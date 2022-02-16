<template>
  <div class="empty_state">
    <i class="fa-solid fa-face-disappointed"></i>
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