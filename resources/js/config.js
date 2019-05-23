const apiDomain = '/api';
export const siteName = 'PLPMS';

export const api = {
	login: apiDomain + '/login',
	register: apiDomain + '/register',
	currentAccount: apiDomain + '/me/account',
	updateAccount: apiDomain + '/me/account',
	updatePassword: apiDomain + '/me/password',
    attachedFlatTypes: apiDomain + '/me/flat-types',
    flatTypes: apiDomain + '/flat-types',
    flatType: (flatTypeId) => {
        return apiDomain + '/flat-types/' + flatTypeId;
    },
	attachFlatType: (flatTypeId) => {
		return apiDomain + '/me/flat-types/' + flatTypeId;
	},
	flatParts: apiDomain + '/me/flat-parts',
	fillFlatPart: (flatPartId) => {
        return apiDomain + '/me/flat-parts/' + flatPartId;
    },
	detachFlatType: (flatTypeId) => {
        return apiDomain + '/me/flat-types/' + flatTypeId;
    },
};
