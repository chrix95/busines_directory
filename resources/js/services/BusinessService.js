import Api from "./Api";
import axios from 'axios';
const config = {
  headers: { 'content-type': 'multipart/form-data' }
}
export default {
  search(params) {
    return axios.get(`business/search?name=${params}`);
  },
  get_one_business(id) {
    return Api().get(`business/${id}`);
  },
  create_business(credentials) {
    return Api().post("business", credentials, config);
  },
  upload_image(id, credentials) {
    return Api().post(`business/upload/${id}`, credentials, config);
  },
  update_business(id, credentials) {
    return Api().post(`business/${id}`, credentials, config);
  },
  delete_business(id) {
    return Api().delete(`business/${id}`);
  },
  update_status(id, status) {
    return Api().get(`business/status/${id}/${status}`);
  }
};
