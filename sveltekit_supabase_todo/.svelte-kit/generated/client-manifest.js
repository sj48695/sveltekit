import * as client_hooks from '../../src/hooks.client.ts';

export { matchers } from './client-matchers.js';

export const nodes = [() => import('./nodes/0'),
	() => import('./nodes/1'),
	() => import('./nodes/2'),
	() => import('./nodes/3'),
	() => import('./nodes/4'),
	() => import('./nodes/5'),
	() => import('./nodes/6')];

export const server_loads = [0];

export const dictionary = {
	"/": [~3],
	"/my/settings/profiles": [~4,[2]],
	"/posts/hello": [5],
	"/todos": [6]
};

export const hooks = {
	handleError: client_hooks.handleError || (({ error }) => { console.error(error) }),
};