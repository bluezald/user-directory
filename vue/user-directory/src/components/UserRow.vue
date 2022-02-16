<template>
  <div class="card-content">
    <article class="media">
      <figure class="media-left">
        <p class="image is-64x64">
          <img src="https://bulma.io/images/placeholders/128x128.png" />
        </p>
      </figure>
      <div class="media-content">
        <div class="content">
          <p>
            <strong>{{ name }}</strong> <small>ID: {{ id }}</small>
            <br />
            {{ phone }}
          </p>
        </div>
        <nav class="level is-mobile">
          <div class="level-left">
            <a class="level-item">
              <span class="icon is-small"><i class="fas fa-envelope"></i></span>
              {{ email }}
            </a>
          </div>
        </nav>
      </div>
    </article>
  </div>
</template>

<script>
export default {
  name: 'UserRow',
  props: {
    id: {
      type: Number,
      default() {
        return 0
      },
    },
    name: {
      type: String,
      default() {
        return ''
      },
    },
    email: {
      type: String,
      default() {
        return ''
      },
    },
    phone: {
      type: String,
      default() {
        return ''
      },
    },
  }
}
</script>

<style scoped>
.card-content {
  cursor: pointer;
}

.card-content:hover {
  background-color: #f3f9ff;
}
.content {
  text-align: left;
}

.level-item span {
  margin-right: 4px;
}
</style>
