<template>
  <div class="user-details">
    <div>
      <div class="heading">
        <img src="https://bulma.io/images/placeholders/128x128.png" />
        <div class="name">{{ user.name }}</div>
        <div class="username">@{{ user.username }}</div>
        <div class="username">ID: {{ user.id }}</div>
      </div>
      <div class="details">
        <span class="label">
          Email:
        </span>
        <div class="email">
          <i class="fa fa-envelope"></i>
          {{ user.email }}
        </div>
        <span class="label">
          Phone:
        </span>
        <div class="phone">
          <i class="fa fa-phone"></i>
          {{ user.phone }}
        </div>
        <span class="label">
          Website:
        </span>
        <div class="website">
          <i class="fa fa-browser"></i>
          {{ user.website }}
        </div>
        <div class="other-details">
          <span class="label">
            Address:
          </span>
          <div class="address">
            <i class="fa fa-location-dot"></i>
            {{ address }}
          </div>
          <span class="label">
            Company:
          </span>
          <div class="company" v-if="user.company">
            <span class="name">{{ user.company.name }}</span>
            <br />
            <span>{{ user.company.catchPhrase }}</span>
            <br />
            <span>{{ user.company.bs }}</span>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'UserDetails',
  props: {
    user: {
      type: Object,
      default() {
        return null
      }
    }
  },
  computed: {
    address() {
      if (this.user) {
        let address = this.user.address
        return `${address.street} ${address.suite}, ${address.city} ${address.zipcode}`
      }
    }
  }
}
</script>

<style scoped>
  .user-details {
    margin: 0 auto;
    padding: 2em;
  }
  .user-details .heading {
    text-align: center;
  }

  .user-details .details {
    margin-top: 2em
  }
  .user-details .name {
    font-size: 120%;
    font-weight: bold;
    margin: 0.5em 0;
  }
  .user-details .company .name {
    font-size: 110%;
    font-weight: bold;
  }
  .other-details {
    padding-top: 1em;
  }
  .label {
    font-weight: 500;
    padding-top: 1em;
  }
</style>
