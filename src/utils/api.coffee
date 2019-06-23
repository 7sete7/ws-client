import axios from 'axios'

api = axios.create
    baseUrl: process.env.SERVER_URL

export default api