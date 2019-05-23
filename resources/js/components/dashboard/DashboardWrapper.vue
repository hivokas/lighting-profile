<template>
	<div class="container">
		<div class="row">
			<div class="col-12 col-md-3">
				<nav class="nav flex-column nav-pills mb-4">
                    <router-link :to="{name: 'dashboard.attachedFlatTypes.create'}" class="nav-link" activeClass="active" exact>
                        <b>Attach flat type</b>
                    </router-link>

                    <span v-for="attachedFlatType in attachedFlatTypes">
                        <div class="nav-link">
                            {{ attachedFlatType.name }}
                        </div>
<!--						<router-link :to="{name: 'dashboard.attachedFlatTypes.show', params: {flatTypeId: attachedFlatType.id}}" class="nav-link" activeClass="active" exact>-->
<!--							{{ attachedFlatType.name }}-->
<!--						</router-link>-->
					</span>
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
    import {api} from "../../config";

    export default {
		computed: {
            attachedFlatTypes: function () {
                return this.$store.state.auth.attachedFlatTypes;
			}
		},
		methods: {
            async loadFilledFlatTypes() {
                let {data: {data: attachedFlatTypes}} = await axios.get(api.attachedFlatTypes);
                await this.$store.dispatch('setAttachedFlatTypes', attachedFlatTypes);
			}
		},
		created: function () {
            this.loadFilledFlatTypes();
		}
	}
</script>
