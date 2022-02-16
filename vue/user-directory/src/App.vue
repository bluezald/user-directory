<template>
  <nav class="navbar" role="navigation" aria-label="main navigation">
  </nav>
  <div class="main-content">
    <div class="columns" id="mail-app">
      <div class="column is-4 users is-fullheight" id="message-feed">
        <UserSearchControl
          :is-loading="isLoading"
          @didUpdateName="handleFilterByName($event)"
          @didUpdateId="handleFilterById($event)"
        />
        <div v-if="filtered.length && !isLoading">
          <UserRow
            v-for="(user, index) in filtered"
            class="card"
            @click="showDetails(user)"
            :key="index"
            :name="user.name"
            :id="user.id"
            :email="user.email"
            :phone="user.phone"
          />
        </div>
        <EmptyContent v-else />
      </div>
      <UserDetails v-if="selected" :user="selected" />

    </div>
  </div>
</template>

<script>
import UserRow from './components/UserRow.vue'
import UserDetails from './components/UserDetails.vue'
import UserSearchControl from './components/UserSearchControl.vue'
import EmptyContent from './components/EmptyContent.vue'
import userService from './services/userService.js'

export default {
  components: {
    UserRow,
    UserDetails,
    UserSearchControl,
    EmptyContent,
  },
  data() {
    return {
      users: [],
      filtered: [],
      isLoading: false,
      selected: null
    }
  },
  watch: {
    users(val) {
      this.filtered = val
    },
  },
  methods: {
    getUsers: async function () {
      this.isLoading = true
      try {
        const response = await userService.getUsers()
        this.users = response?.data || []
        console.log(this.users)
      } catch (error) {
        console.log(error)
      }
      this.isLoading = false
    },
    handleFilterByName(value) {
      let updated = []
      updated = this.users.filter((item) => {
        return item.name.includes(value)
      })
      if (updated.length === 0 && !value) {
        updated = this.users
      }
      console.log(updated)
      this.filtered = updated
    },
    handleFilterById(value) {
      let updated = []
      updated = this.users.filter((item) => {
        return item.id === value
      })
      if (updated.length === 0 && !value) {
        updated = this.users
      }
      console.log(updated)
      this.filtered = updated
    },
    showDetails(user) {
      this.selected = user
    }
  },
  mounted() {
    this.getUsers()
  },
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  color: #2c3e50;
}
.navbar {
  background-color: #485CC3 !important;
}
.main-content {
  padding: 2em;
}
</style>
