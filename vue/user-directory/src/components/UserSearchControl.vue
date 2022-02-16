<template>
  <div>
    <form @submit.prevent="search" style="width: 100%">
      <div class="field has-addons" :class="{ 'is-loading': isLoading }">
        <div class="control is-medium has-icons-left" style="width: 100%">
          <input
            class="input"
            type="search"
            placeholder="Search Name..."
            v-model="filters.name"
            :disabled="isLoading"
          />
          <span class="icon is-left">
            <i class="fas fa-magnifying-glass"></i>
          </span>
        </div>
        <div class="control">
          <input
            class="input"
            type="number"
            placeholder="ID..."
            v-model="filters.id"
            :disabled="isLoading"
          />
        </div>
        <div class="control">
          <button type="submit" class="button is-info">Search</button>
        </div>
      </div>
    </form>
  </div>
</template>

<script>
export default {
  name: 'UserSearchControl',
  props: {
    isLoading: Boolean,
  },
  emits: ['didUpdateName', 'didUpdateId', 'didSearch'],
  data() {
    return {
      filters: {
        name: '',
        id: null,
      },
    }
  },
  watch: {
    'filters.name': function (val) {
      this.$emit('didUpdateName', val)
    },
    'filters.id': function (val) {
      this.$emit('didUpdateId', val)
    },
  },
  methods: {
    search() {
      this.$emit('didSearch', this.filters)
    },
  },
}
</script>
