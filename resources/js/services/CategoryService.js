import Api from "./Api";
export default {
  get_one_category(id) {
    return Api().get("category/" + id);
  },
  create_category(credentials) {
    return Api().post("category", credentials);
  },
  update_category(id, credentials) {
    return Api().put("category/" + id, credentials);
  },
  delete_category(id) {
    return Api().delete("category/" + id);
  }
};
