<template>
	<div>
		<form @submit.prevent="login">
			<div class="form-group">
				<label for="name">Name</label>
				<input
					type="text"
					class="form-control"
					:class="{'is-invalid' : error.name}"
					id="name"
					v-model="form.name"
					autocomplete="off"
					:disabled="loading"
				/>
				<div class="invalid-feedback" v-show="error.name">{{ error.name }}</div>
			</div>
			<div class="form-group">
				<label for="email">Email</label>
				<input
					type="email"
					class="form-control"
					:class="{'is-invalid' : error.email}"
					id="email"
					v-model="form.email"
					autocomplete="off"
					:disabled="loading"
				/>
				<div class="invalid-feedback" v-show="error.email">{{ error.email }}</div>
			</div>
			<div class="form-group">
				<label for="password">Password</label>
				<input
					type="password"
					class="form-control"
					:class="{'is-invalid' : error.password}"
					id="password"
					v-model="form.password"
					:disabled="loading"
				/>
				<div class="invalid-feedback" v-show="error.password">{{ error.password }}</div>
			</div>
			<div class="form-group">
				<label for="password">Password Confirmation</label>
				<input
					type="password"
					class="form-control"
					:class="{'is-invalid' : error.password_confirmation}"
					id="password_confirmation"
					v-model="form.password_confirmation"
					:disabled="loading"
				/>
			</div>
			<div class="form-group">
				<button type="submit" class="btn btn-primary btn-block" :disabled="loading">
					<span v-show="loading">Logging in</span>
					<span v-show="!loading">Register</span>
				</button>
			</div>
		</form>
	</div>
</template>

<script>
	import {api} from "../../config";

	export default {
		data() {
			return {
				loading: false,
				form: {
				    name: null,
					email: null,
					password: null,
					password_confirmation: null
				},
				error: {
				    name: null,
					email: null,
					password: null,
				}
			}
		},
		methods: {
			login() {
				this.loading = true;
				axios.post(api.register, this.form)
					.then(res => {
						this.loading = false;
						this.$noty.success('You have been registered successfully. Welcome!');
						this.$emit('registerSuccess', res.data.data);
					})
					.catch(err => {
						(err.response.data.error) && this.$noty.error(err.response.data.error);

						(err.response.data.errors)
							? this.setErrors(err.response.data.errors)
							: this.clearErrors();

						this.loading = false;
					});
			},
			setErrors(errors) {
				this.error.email = errors.email ? errors.email[0] : null;
				this.error.password = errors.password ? errors.password[0] : null;
			},
			clearErrors() {
				this.error.email = null;
				this.error.password = null;
			}
		}
	}
</script>
