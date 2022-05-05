import axios from "../../plugins/axios";

export default {
  state: {
    youtubeLists: [],
  },
  getters: {
    youtubeLists: (state) => state.youtubeLists,
  },
  mutations: {
    setYoutubeLists: (state, lists) => (state.youtubeLists = lists),
  },
  actions: {
    fetchYoutubeLists: async ({ commit }, { searchQuery }) => {
      const response = await axios.get("youtube_lists", {
        params: { query: searchQuery },
      });
      commit("setYoutubeLists", response.data.items);
    },
  },
};
