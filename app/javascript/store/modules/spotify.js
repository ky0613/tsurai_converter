import axios from "../../plugins/axios";

export default {
  state: {
    spotifyLists: [],
  },
  getters: {
    spotifyLists: (state) => state.spotifyLists,
  },
  mutations: {
    setSpotifyLists: (state, lists) => (state.spotifyLists = lists),
  },
  actions: {
    fetchSpotifyLists: async ({ commit }, { listType, searchQuery }) => {
      const response = await axios.get("spotify_lists", {
        params: { type: listType, query: searchQuery },
      });
      commit("setSpotifyLists", response.data);
    },
  },
};
