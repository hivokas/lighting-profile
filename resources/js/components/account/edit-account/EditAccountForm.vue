<template>
	<div>
		<form @submit.prevent="updateAccount">
			<div class="form-group">
				<label for="name">Name</label>
				<input
					type="text"
					class="form-control"
					:class="{'is-invalid' : error.name}"
					id="name"
					v-model="form.name"
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
					:disabled="loading"
				/>
				<div class="invalid-feedback" v-show="error.email">{{ error.email }}</div>
			</div>
			<button type="submit" class="btn btn-primary" :disabled="loading">
				<span v-show="loading">Updating Account</span>
				<span v-show="!loading">Update Account</span>
			</button>
		</form>
	</div>
</template>

<script>
	import {mapState} from 'vuex'
	import {api} from "../../../config";

	export default {
		data() {
			return {
				loading: false,
				error: {
					name: '',
					email: ''
				}
			};
		},
		computed: mapState({
			form: state => {
				return {...state.auth};
			}
		}),
		methods: {
			updateAccount() {
				this.loading = true;
				axios.put(api.updateAccount, this.form)
					.then((res) => {
						this.loading = false;
						this.$noty.success('Account Updated');
						this.$emit('updateSuccess', res.data.data);
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
				this.error.name = errors.name ? errors.name[0] : null;
				this.error.email = errors.email ? errors.email[0] : null;
			},
			clearErrors() {
				this.error.name = null;
				this.error.email = null;
			}
		}
	}
</script>
