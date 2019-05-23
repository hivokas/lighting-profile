<template>
	<div>
		<form @submit.prevent="updateAccount">

			<div v-for="flatPart in flatParts">
				<h2>{{ flatPart.name }}</h2>

                <flat-part-item
                        :flat-part="flatPart"
                        :flat-type-id="flatTypeId"
                        :values="filledFieldValuesByFlatPartId(flatPart.id)"
                ></flat-part-item>



			</div>


            <div class="form-group">
                <button class="btn btn-danger" @click="deleteProfile">
                    Remove profile
                </button>
            </div>
		</form>
	</div>
</template>

<script>
	import {api} from "../../../config";
    import FlatPartItem from './FlatPartItem.vue'

    export default {
        components: {
            'flat-part-item': FlatPartItem
        },
		data() {
			return {
				loading: false,
				error: {
					name: '',
					email: ''
				},
				flatParts: [],
                filledFlatParts: [],
				form: {},
			};
		},
		computed: {
            flatTypeId() {
                return this.$route.params.flatTypeId;
            }
		    // flatParts() {
			//
		    //     // return this.$store.state.auth.get
			// }
		},
		// computed: mapState({
		// 	form: state => {
		// 		return {...state.auth};
		// 	}
		// }),
		created: function () {
		    this.loadFlatPartsForCurrentFlatType();
		    this.loadFilledFlatParts();
		},
		methods: {
            deleteProfile() {
                axios.delete(api.detachFlatType(this.$route.params.flatTypeId))
                    .then(() => {
                        this.loadFilledFlatTypes();
                        this.$router.push({name: 'dashboard'});
                    });
            },
		    loadFlatPartsForCurrentFlatType() {
		        axios.get(api.flatType(this.$route.params.flatTypeId))
					.then(response => {
					    this.flatParts = response.data.data.flat_parts;
					    // console.log(response);
					});
			},
            loadFilledFlatParts() {
                axios.get(api.flatParts)
                    .then(response => {
                        this.filledFlatParts = response.data.data;
                        // console.log(response);
                    });
            },
            async loadFilledFlatTypes() {
                let {data: {data: attachedFlatTypes}} = await axios.get(api.attachedFlatTypes);
                await this.$store.dispatch('setAttachedFlatTypes', attachedFlatTypes);
            },
            filledFieldValuesByFlatPartId(id) {
		        let values = (this.filledFlatParts.find(filledFlatPart => {
                    return filledFlatPart.id === id;
                }) || {}).values || {};

		        console.log('v', values);

		        return values;
            },
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
