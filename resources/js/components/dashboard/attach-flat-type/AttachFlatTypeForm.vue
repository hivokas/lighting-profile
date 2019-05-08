<template>
	<div>
		<form @submit.prevent="attachFlatType">
			<v-select v-model="selectedFlatType" :options="this.attachableFlatTypes" label="name"></v-select>

				<!--<div class="invalid-feedback" v-show="error.email">{{ error.email }}</div>-->

			<button type="submit" class="btn btn-primary mt-3" :disabled="loading || selectedFlatType === null">
				<span v-show="loading">Attaching flat type</span>
				<span v-show="!loading">Attach flat type</span>
			</button>
		</form>
	</div>
</template>

<script>
	import {api} from "../../../config";

	export default {
		data() {
			return {
				loading: false,
				flatTypes: [],
                selectedFlatType: null,
			};
		},
		computed: {
		    attachableFlatTypes() {
		        return this.flatTypes.filter(flatType => {
		            return this.$store.state.auth.attachedFlatTypes.map(attachedFlatType => {
		                return attachedFlatType.id;
					}).indexOf(flatType.id) === -1;
                });
			}
		},
		methods: {
		    loadFlatTypes() {
                axios.get(api.flatTypes)
                    .then(response => {
                        this.flatTypes = response.data.data;
                    });
			},
            attachFlatType() {
		        this.loading = true;

				axios.put(api.attachFlatType(this.selectedFlatType.id))
					.then(response => {
                        this.loading = false;
                        this.$noty.success('Flat type attached successfully');
                        this.loadFilledFlatTypes();
					    this.$emit('attachSuccess', this.selectedFlatType);
					});
            },
            async loadFilledFlatTypes() {
                let {data: {data: attachedFlatTypes}} = await axios.get(api.attachedFlatTypes);
                await this.$store.dispatch('setAttachedFlatTypes', attachedFlatTypes);
            },
		},
		created: function () {
		    this.loadFlatTypes();
		}
	}
</script>
