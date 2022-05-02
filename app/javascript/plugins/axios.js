import axios from "axios";

const production = "https://tsurai-converter.herokuapp.com/api/v1/";
const development = "http://127.0.0.1:3000/api/v1/";
const url = process.env.NODE_ENV === "production" ? production : development;

const axiosConfig = axios.create({ baseURL: `${url}` });

export default axiosConfig;
