import Vue from "vue";
import Vuex from "vuex";
import axios from "../plugins/axios";

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    lists: [],
  },
  getters: {
    lists: (state) => state.lists,
  },
  mutations: {
    setLists: (state, lists) => (state.lists = lists),
  },
  actions: {
    fetchLists: async ({ commit }) => {
      const response = await axios.get("youtube_lists");
      commit("setLists", response.data.items);
    },
  },
});
