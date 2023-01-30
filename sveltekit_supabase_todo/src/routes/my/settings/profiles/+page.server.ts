import type { Actions } from './$types';
import { error } from '@sveltejs/kit';
import { getImageUrl } from '$lib/utils';

export const actions: Actions = {
	updateProfile: async ({ request, locals }) => {
		let data = await request.formData();
		let filename = data.get('avatar');
		console.log('filename', filename);
		try {
			const {
				sb: { storage },
				session: { user }
			} = locals;
			// const avatar_url = await getImageUrl({
			// 	storage,
			// 	bucket: 'avatars',
			// 	filename,
			// 	transform: {
			// 		width: 500,
			// 		height: 600
			// 	}
			// });
			const updates = {
				id: user.id,
				username: data.get('username'),
				website: data.get('website'),
				avatar_url: filename,
				updated_at: new Date()
			};
			const result = await locals.sb.from('profiles').upsert(updates);
		} catch (err) {
			console.log('ERROR: ', err);

			throw error(400, 'Something went wrong updating your profile');
		}

		return {
			success: true
		};
	}
};
