import Home from './components/home/Home.vue';
import Login from './components/login/Login.vue';
import Register from './components/register/Register.vue';
import AccountWrapper from './components/account/AccountWrapper.vue';
import DashboardWrapper from './components/dashboard/DashboardWrapper.vue';
import Dashboard from './components/dashboard/Dashboard.vue';
import AttachFlatType from './components/dashboard/attach-flat-type/AttachFlatType.vue';
import EditAttachedFlatType from './components/dashboard/edit-attached-flat-type/EditAttachedFlatType.vue';
import Account from './components/account/Account.vue';
import EditAccount from './components/account/edit-account/EditAccount.vue';
import EditPassword from './components/account/edit-password/EditPassword.vue';

export default [
	{
		path: '/',
		name: 'index',
		component: Home,
		meta: {}
	},
	{
		path: '/login',
		name: 'login',
		component: Login,
		meta: {requiresGuest: true}
	},
	{
		path: '/register',
		name: 'register',
		component: Register,
		meta: {requiresGuest: true}
	},
	{
		path: '/account',
		component: AccountWrapper,
		children: [
			{
				path: '',
				name: 'account',
				component: Account,
				meta: {requiresAuth: true}
			},
			{
				path: 'edit-account',
				name: 'account.editAccount',
				component: EditAccount,
				meta: {requiresAuth: true}
			},
			{
				path: 'edit-password',
				name: 'account.editPassword',
				component: EditPassword,
				meta: {requiresAuth: true}
			}
		]
	},
	{
		path: '/dashboard',
        component: DashboardWrapper,
		children: [
			{
				path: '',
                redirect: {
                    name: 'dashboard.attachedFlatTypes.create'
                },
				name: 'dashboard',
				meta: {requiresAuth: true}
			},
			{
				path: 'attached-flat-types/create',
				name: 'dashboard.attachedFlatTypes.create',
				component: AttachFlatType,
				meta: {requiresAuth: true}
			},
			{
				path: 'attached-flat-types/:flatTypeId',
				name: 'dashboard.attachedFlatTypes.show',
				component: EditAttachedFlatType,
				meta: {requiresAuth: true}
			},
            {
                path: '*',
                redirect: {
                    name: 'dashboard'
                }
            },
		]
	},
];