<template>
	<div>
		<h3 class="mb-4">Attach flat type</h3>
		<div class="card">
			<div class="card-body">
				<attach-flat-type-form @attachSuccess="attachSuccess"></attach-flat-type-form>
			</div>
		</div>
	</div>
</template>

<script>
	import AttachFlatTypeForm from './AttachFlatTypeForm.vue'
	import {mapActions} from 'vuex';

	export default {
		components: {
			'attach-flat-type-form': AttachFlatTypeForm
		},
		methods: {
			...mapActions([
				'setAuthUser'
			]),
			// updateSuccess(data) {
			// 	this.setAuthUser(data);
			// 	this.$router.push({name: 'account'});
			// },
            attachSuccess(data) {
				// this.setAuthUser(data);
				this.$router.push({
					name: 'dashboard.attachedFlatTypes.show',
					params: {
					    flatTypeId: data.id,
					}
				});
			},
		}
	}
</script>
