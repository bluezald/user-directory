import axios from 'axios'

const serviceInstance = axios.create({
  baseURL: 'https://jsonplaceholder.typicode.com',
})

export default {
  getUsers: async () => {
    return serviceInstance.get(`/users`)
  },
}
