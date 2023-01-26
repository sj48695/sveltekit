import * as universal from '../entries/pages/_layout.ts.js';
import * as server from '../entries/pages/_layout.server.ts.js';

export const index = 0;
export const component = async () => (await import('../entries/pages/_layout.svelte.js')).default;
export const file = '_app/immutable/components/pages/_layout.svelte-5e2d031b.js';
export { universal };
export { server };
export const imports = ["_app/immutable/components/pages/_layout.svelte-5e2d031b.js","_app/immutable/chunks/index-49ed38d8.js","_app/immutable/chunks/supabaseClient-b2c95310.js","_app/immutable/chunks/index-59ef50aa.js","_app/immutable/chunks/browser-ponyfill-10e9505f.js","_app/immutable/chunks/singletons-86285720.js","_app/immutable/modules/pages/_layout.ts-9152242c.js","_app/immutable/chunks/_layout-f2b853d2.js","_app/immutable/chunks/index-59ef50aa.js","_app/immutable/chunks/browser-ponyfill-10e9505f.js"];
export const stylesheets = ["_app/immutable/assets/_layout-b5b4feb9.css"];
export const fonts = [];
