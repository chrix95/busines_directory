import Api from "./Api";
export default {
  view_a_listing(id) {
    return Api().get(`business/${id}?view=true`);
  },
  update_rating(id, rate) {
    return Api().get(`business/rating/${id}/${rate}`);
  }
};
