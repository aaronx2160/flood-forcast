import axios from 'axios'
import { Message } from 'element-ui'
let message = Message
const http = async (type, url, data) => {
  let res
  type = type.toUpperCase()
  switch (type) {
    case 'GET':
      res = await axios.get(url)
      break
    case 'POST':
      res = await axios.post(url, data)
      break
    case 'DELETE':
      res = await axios.delete(url)
      break
    case 'PUT':
      res = await axios.put(url, data)
      break
    default:
      res = {
        data: null,
        meta: { status: 404, msg: 'unavailable http method' }
      }
  }
  if (res.status !== 200) {
    message.error(res.statusText.toString())
  } else if (res.data.meta.status !== 200) {
    message.error(JSON.stringify(res.data.meta.msg))
  } else {
    return res.data.data
  }
}

export default http
