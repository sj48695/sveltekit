import { redirect } from '@sveltejs/kit';
import type { LayoutServerLoad } from './$types';
import { getServerSession } from '@supabase/auth-helpers-sveltekit';

export const load: LayoutServerLoad = async (event) => {
	let session = await getServerSession(event);
	// console.log("session", session);
	if (!session) {
		// throw redirect(303, '/');
	}
	// throw redirect(303, "/login")
	return {
		session
	};
};
