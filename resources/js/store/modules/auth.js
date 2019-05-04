/*
|--------------------------------------------------------------------------
| Mutation Types
|--------------------------------------------------------------------------
*/
export const SET_USER = 'SET_USER';
export const UNSET_USER = 'UNSET_USER';
export const SET_ATTACHED_FLAT_TYPES = 'SET_ATTACHED_FLAT_TYPES';
export const UNSET_ATTACHED_FLAT_TYPES = 'UNSET_ATTACHED_FLAT_TYPES';

/*
|--------------------------------------------------------------------------
| Initial State
|--------------------------------------------------------------------------
*/
const initialState = {
	name: null,
	email: null,
	attachedFlatTypes: [],
};

/*
|--------------------------------------------------------------------------
| Mutations
|--------------------------------------------------------------------------
*/
const mutations = {
	[SET_USER](state, payload) {
		state.name = payload.user.name;
		state.email = payload.user.email;
	},
	[UNSET_USER](state, payload) {
		state.name = null;
		state.email = null;
	},
	[SET_ATTACHED_FLAT_TYPES](state, payload) {
        state.attachedFlatTypes = payload.attachedFlatTypes;
    },
	[UNSET_ATTACHED_FLAT_TYPES](state, payload) {
        state.attachedFlatTypes = [];
    },
};

/*
|--------------------------------------------------------------------------
| Actions
|--------------------------------------------------------------------------
*/
const actions = {
	setAuthUser: (context, user) => {
		context.commit(SET_USER, {user})
	},
	unsetAuthUser: (context) => {
		context.commit(UNSET_USER);
	},
	setAttachedFlatTypes: (context, attachedFlatTypes) => {
		context.commit(SET_ATTACHED_FLAT_TYPES, {attachedFlatTypes})
	},
	unsetAttachedFlatTypes: (context) => {
		context.commit(UNSET_ATTACHED_FLAT_TYPES);
	},
};

/*
|--------------------------------------------------------------------------
| Getters
|--------------------------------------------------------------------------
*/
const getters = {
	isLoggedIn: (state) => {
		return !!(state.name && state.email);
	}
};

/*
|--------------------------------------------------------------------------
| Export the module
|--------------------------------------------------------------------------
*/
export default {
	state: initialState,
	mutations,
	actions,
	getters
}