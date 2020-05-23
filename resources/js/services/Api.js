/* eslint-disable no-undef */
import axios from "axios";

// create a new axios instance
const instance = axios.create({
  baseURL: `http://127.0.0.1:8000/api/v1/`
});

export default () => instance;
