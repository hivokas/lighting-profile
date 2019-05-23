<template>
	<div>
		<h3 class="mb-4">Edit attached flat type</h3>
		<div class="card">
			<div class="card-body">
				<edit-attached-flat-type-form @updateSuccess="updateSuccess"></edit-attached-flat-type-form>
			</div>
		</div>
	</div>
</template>

<script>
	import EditAttachedFlatTypeForm from './EditAttachedFlatTypeForm.vue'

	export default {
		components: {
			'edit-attached-flat-type-form': EditAttachedFlatTypeForm
		},
		methods: {
			updateSuccess(data) {
				// this.setAuthUser(data);
				// this.$router.push({name: 'account'});
			},
		},
        created: function () {
		    console.log('created');
        }
	}
</script>
