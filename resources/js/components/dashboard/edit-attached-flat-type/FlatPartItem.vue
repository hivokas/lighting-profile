<template>
    <div>
        <form @submit.prevent="fillFlatPart">
            <!--<h4>{{ this.flatPart }}</h4>-->
            <!--<h4>{{ this.flatTypeId }}</h4>-->
            <!--<h4>{{ this.form }}</h4>-->
            <div class="form-group">
                <label for="brightness-percentage">Brightness Percentage (0-100)</label>
                <!--<input-->
                        <!--type="number"-->
                        <!--class="form-control"-->
                        <!--id="brightness-percentage"-->
                        <!--v-model="form.brightness_percentage"-->
                        <!--:disabled="loading"-->
                <!--/>-->
                <el-slider v-model="form.brightness_percentage"></el-slider>
                <div style="color: red;" v-show="error.brightness_percentage">{{ error.brightness_percentage }}</div>
            </div>
            <div class="form-group">
                <!--<label for="reacts-to-movements">Reacts To Movements</label>-->
                <!--<input-->
                        <!--type="checkbox"-->
                        <!--id="reacts-to-movements"-->
                        <!--v-model="form.reacts_to_movements"-->
                        <!--:disabled="loading"-->
                <!--/>-->
                <el-checkbox v-model="form.reacts_to_movements">Reacts To Movements</el-checkbox>
                <div style="color: red;" v-show="error.reacts_to_movements">{{ error.reacts_to_movements }}</div>
            </div>
            <div class="form-group">
                <label for="turn-off-timer">Turn Off Timer (sec.)</label>
                <!--<input-->
                        <!--type="number"-->
                        <!--class="form-control"-->
                        <!--id="turn-off-timer"-->
                        <!--v-model="form.turn_off_timer"-->
                        <!--:disabled="loading"-->

                <!--/>-->
                <el-slider v-model="form.turn_off_timer" :max="3600"></el-slider>

                <div style="color: red;" v-show="error.turn_off_timer">{{ error.turn_off_timer }}</div>
            </div>

            <div class="form-group">
                <label for="color">Color</label>
                <br>

                <el-color-picker v-model="form.color"></el-color-picker>

                <div style="color: red;" v-show="error.color">{{ error.color }}</div>
            </div>

            <button type="submit" class="btn btn-primary" :disabled="loading">
                <span v-show="loading">Saving</span>
                <span v-show="!loading">Save</span>
            </button>
        </form>
        <hr>
    </div>
</template>

<script>
    import {api} from "../../../config";

    export default {
        props: ['flatPart', 'flatTypeId', 'values'],
        data() {
            return {
                form: {
                    brightness_percentage: null,
                    reacts_to_movements: null,
                    turn_off_timer: null,
                    color: '#FFFFFF',
                },
                loading: false,
                error: {}
            };
        },
        watch: {
            values: function (values) {
                this.form = values || {};
            }
        },
        methods: {
            fillFlatPart() {
                this.loading = true;
                axios.put(api.fillFlatPart(this.flatPart.id), this.form)
                    .then(res => {
                        this.clearErrors();
                        console.log(res);

                        // this.loading = false;
                        // this.$noty.success('You have been registered successfully. Welcome!');
                        // this.$emit('registerSuccess', res.data.data);
                        this.loading = false;
                    })
                    .catch(err => {
                        (err.response.data.error) && this.$noty.error(err.response.data.error);

                        // (err.response.data.error) && this.$noty.error(err.response.data.error);
                        //
                        // (err.response.data.errors)
                        //     ? this.setErrors(err.response.data.errors)
                        //     : this.clearErrors();
                        //

                        (err.response.data.errors)
                            ? this.setErrors(err.response.data.errors)
                            : this.clearErrors();
                        
                        this.loading = false;
                    });
            },
            setErrors(errors) {
                this.error.brightness_percentage = errors.brightness_percentage ? errors.brightness_percentage[0] : null;
                this.error.reacts_to_movements = errors.reacts_to_movements ? errors.reacts_to_movements[0] : null;
                this.error.turn_off_timer = errors.turn_off_timer ? errors.turn_off_timer[0] : null;

                console.log(this.error);
            },
            clearErrors() {
                this.error.brightness_percentage = null;
                this.error.reacts_to_movements = null;
                this.error.turn_off_timer = null;
            }
        },
    }
</script>
