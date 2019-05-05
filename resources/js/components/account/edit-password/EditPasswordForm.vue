<template>
	<div>
		<form @submit.prevent="updatePassword">
			<div class="form-group">
				<label for="new-password">New Password</label>
				<input
					type="password"
					class="form-control"
					:class="{'is-invalid' : error.password}"
					id="new-password"
					v-model="form.password"
					:disabled="loading"
				/>
				<div class="invalid-feedback" v-show="error.password">{{ error.password }}</div>
			</div>
			<div class="form-group">
				<label for="confirm-new-password">Confirm New Password</label>
				<input
					type="password"
					class="form-control"
					:class="{'is-invalid' : error.password_confirmation}"
					id="confirm-new-password"
					v-model="form.password_confirmation"
					:disabled="loading"
				/>
				<div class="invalid-feedback" v-show="error.password_confirmation">{{ error.password_confirmation }}</div>
			</div>

			<button type="submit" class="btn btn-primary" :disabled="loading">
				<span v-show="loading">Updating Password</span>
				<span v-show="!loading">Update Password</span>
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
				form: {
					password: '',
					password_confirmation: ''
				},
				error: {
					password: '',
					password_confirmation: ''
				}
			}
		},
		methods: {
			updatePassword() {
				this.loading = true;
				axios.put(api.updatePassword, this.form)
					.then((res) => {
						this.loading = false;
						this.$noty.success('Password updated');
						this.$emit('updateSuccess');
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
				this.error.password = errors.password ? errors.password[0] : null;
				this.error.password_confirmation = errors.password_confirmation ? errors.password_confirmation[0] : null;
			},
			clearErrors() {
				this.error.password = null;
				this.error.password_confirmation = null;
			}
		}
	}
</script>
