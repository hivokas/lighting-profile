<template>
	<div>
		<h3 class="mb-4">Edit Account</h3>
		<div class="card">
			<div class="card-body">
				<edit-account-form @updateSuccess="updateSuccess"></edit-account-form>
			</div>
		</div>
	</div>
</template>

<script>
	import EditAccountForm from './EditAccountForm.vue'
	import {mapActions} from 'vuex';

	export default {
		components: {
			'edit-account-form': EditAccountForm
		},
		methods: {
			...mapActions([
				'setAuthUser'
			]),
			updateSuccess(data) {
				this.setAuthUser(data);
				this.$router.push({name: 'account'});
			}
		}
	}
</script>
