import Vue from 'vue';
import VueRouter from 'vue-router';
import accessToken from './helpers/access-token';

Vue.use(VueRouter);

import store from './store/index';
import routes from './routes';

import {api} from "./config";

const router = new VueRouter({
	mode: 'history',
	routes
});

router.beforeEach(async (to, from, next) => {
	// just logged in: localStorage has token, but state does not have auth user
	if (accessToken.getToken() && !store.getters.isLoggedIn) {
		let {data: {data: authUser}} = await axios.get(api.currentAccount);
		await store.dispatch('setAuthUser', authUser);
	}

	if (to.meta.requiresAuth) {
		if (store.getters.isLoggedIn || accessToken.getToken())
			return next();
		else
			return next({name: 'login'});
	}
	if (to.meta.requiresGuest) {
		if (store.getters.isLoggedIn || accessToken.getToken())
			return next({name: 'index'});
		else
			return next();
	}
	next();
});

export default router;
