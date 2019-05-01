<template>
	<div class="container">
		<div class="row">
			<div class="col-12 col-md-6 col-lg-8">
				<div class="page-header">
					<h1 class="display-4">Register</h1>
				</div>
			</div>
			<div class="col-12 col-md-6 col-lg-4">
				<div class="card">
					<div class="card-body">
						<login-form @registerSuccess="registerSuccess"></login-form>
					</div>
				</div>
			</div>
		</div>
	</div>
</template>

<script>
	import RegisterForm from './../register/RegisterForm.vue'
	import accessToken from '../../helpers/access-token';
	import {mapActions} from "vuex";

	export default {
		components: {
			'login-form': RegisterForm
		},
		methods: {
			...mapActions([
				'setAuthUser'
			]),
			registerSuccess(data) {
			    accessToken.setToken(data.access_token);
				this.$router.push({name: 'account'});
			}
		}
	}
</script>
