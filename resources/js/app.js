import $ from 'jquery';
import Vue from 'vue';
import VueNoty from 'vuejs-noty';
import axios from 'axios';

window.$ = window.jQuery = $;
window.axios = axios;
require('bootstrap');

Vue.use(VueNoty, {
	progressBar: false,
	layout: 'bottomRight',
	theme: 'bootstrap-v4',
	timeout: 3000
});

import vSelect from 'vue-select'
Vue.component('v-select', vSelect);

import router from './router';
import store from './store/index';
import App from './components/App.vue';
import accessToken from './helpers/access-token';

axios.interceptors.request.use(config => {
	config.headers['X-Requested-With'] = 'XMLHttpRequest';

	if (accessToken.getToken()) {
        config.headers['Authorization'] = 'Bearer ' + accessToken.getToken();
    }

	return config;
}, error => {
	return Promise.reject(error);
});

axios.interceptors.response.use(response => {
	return response;
}, error => {
	let status = error.response.status;

	if (status === 401) {
        store.dispatch('unsetAuthUser')
            .then(() => {
                accessToken.removeToken();
                router.push({name: 'login'});
            });
	}

	return Promise.reject(error);
});

Vue.component('app', App);


import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';
import locale from 'element-ui/lib/locale/lang/en';

Vue.use(ElementUI, { locale });

const app = new Vue({
	router,
	store
}).$mount('#app');
