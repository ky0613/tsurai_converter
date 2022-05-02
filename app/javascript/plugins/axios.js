import axios from "axios";

const production = "https://tsurai-converter.herokuapp.com";
const development = "http://127.0.0.1:3000";
const url = process.env.NODE_ENV === "production" ? production : development;

const axiosConfig = axios.create({ baseURL: `${url}/api/` });

export default axiosConfig;
