// @ts-nocheck
import { getArticleMetas } from '$lib/server/article';

import type { PageServerLoad } from './$types';

export const load = async () => {
	const posts = await getArticleMetas('src/routes/posts');
	// const todos = await getArticleMetas('src/routes/todos');
	return {
		posts,
		// todos
	};
};
;null as any as PageServerLoad;