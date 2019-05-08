<template>
	<div>
		<h3 class="mb-4">{{user.name}}'s Dashboard</h3>
	</div>
</template>

<script>
	import {mapState} from 'vuex'

	export default {
		computed: mapState({
			user: state => state.auth
		})
	}
</script>
