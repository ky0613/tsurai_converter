import Vue from "vue";
import Vuex from "vuex";

import youtube from "./modules/youtube";
import spotify from "./modules/spotify";

Vue.use(Vuex);

export default new Vuex.Store({
  modules: {
    youtube,
    spotify,
  },
});
