<template>
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary mb-4">
		<div class="container">
			<router-link class="navbar-brand" :to="{name: 'index'}" v-once>{{ siteName }}</router-link>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ml-auto">
					<router-link :to="{name: 'index'}" tag="li" class="nav-item" activeClass="active" exact>
						<a class="nav-link">Home</a>
					</router-link>
					<router-link v-show="!isLoggedIn" :to="{name: 'login'}" tag="li" class="nav-item" activeClass="active" exact>
						<a class="nav-link">Login</a>
					</router-link>
					<router-link v-show="!isLoggedIn" :to="{name: 'register'}" tag="li" class="nav-item" activeClass="active" exact>
						<a class="nav-link">Register</a>
					</router-link>
					<router-link v-show="isLoggedIn" :to="{name: 'dashboard'}" tag="li" class="nav-item" activeClass="active">
						<a class="nav-link">Dashboard</a>
					</router-link>
					<router-link v-show="isLoggedIn" :to="{name: 'account'}" tag="li" class="nav-item" activeClass="active">
						<a class="nav-link">Account</a>
					</router-link>
					<li class="nav-item" v-show="isLoggedIn">
						<a class="nav-link" href="#" @click.prevent="logout">Logout</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>
</template>

<script>
	import {siteName} from './../../config';
	import {mapGetters} from 'vuex';
	import accessToken from '../../helpers/access-token';

	export default {
		data() {
			return {
				siteName: siteName
			}
		},
		computed: mapGetters([
			'isLoggedIn'
		]),
		methods: {
			logout() {
				accessToken.removeToken();
				this.$store.dispatch('unsetAuthUser')
					.then(() => {
						this.$noty.success('You are logged out');
						this.$router.push({name: 'login'});
					});
			}
		}
	}
</script>
