export const manifest = {
	appDir: "_app",
	appPath: "_app",
	assets: new Set(["favicon.png"]),
	mimeTypes: {".png":"image/png"},
	_: {
		entry: {"file":"_app/immutable/start-4e521c04.js","imports":["_app/immutable/start-4e521c04.js","_app/immutable/chunks/index-49ed38d8.js","_app/immutable/chunks/singletons-86285720.js","_app/immutable/chunks/index-59ef50aa.js","_app/immutable/chunks/browser-ponyfill-10e9505f.js","_app/immutable/chunks/supabaseClient-b2c95310.js"],"stylesheets":[],"fonts":[]},
		nodes: [
			() => import('./nodes/0.js'),
			() => import('./nodes/1.js')
		],
		routes: [
			
		],
		matchers: async () => {
			
			return {  };
		}
	}
};
