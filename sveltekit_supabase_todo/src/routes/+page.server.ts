// import { getArticleMetas } from '$lib/server/article';

import type { PageServerLoad } from './$types';

export const load: PageServerLoad = async () => {
	// const posts = await getArticleMetas('src/routes/posts');
	// const todos = await getArticleMetas('src/routes/todos');
	return {
		posts: [],
		// todos
	};
};
