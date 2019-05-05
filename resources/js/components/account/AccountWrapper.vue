<template>
	<div class="container">
		<div class="row">
			<div class="col-12 col-md-3">
				<nav class="nav flex-column nav-pills mb-4">
					<router-link :to="{name: 'account'}" class="nav-link" activeClass="active" exact>
						View Account
					</router-link>
					<router-link :to="{name: 'account.editAccount'}" class="nav-link" activeClass="active" exact>
						Edit Account
					</router-link>
					<router-link :to="{name: 'account.editPassword'}" class="nav-link" activeClass="active" exact>
						Edit Password
					</router-link>
				</nav>
			</div>
			<div class="col-12 col-md-9">
				<transition name="fade" mode="out-in">
					<router-view></router-view>
				</transition>
			</div>
		</div>
	</div>
</template>

<script>
	export default {}
</script>
