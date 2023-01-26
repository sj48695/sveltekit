import * as client_hooks from '../../src/hooks.client.ts';

export { matchers } from './client-matchers.js';

export const nodes = [() => import('./nodes/0'),
	() => import('./nodes/1'),
	() => import('./nodes/2'),
	() => import('./nodes/3'),
	() => import('./nodes/4')];

export const server_loads = [0];

export const dictionary = {
	"/": [~2],
	"/posts/hello": [3],
	"/todos": [4]
};

export const hooks = {
	handleError: client_hooks.handleError || (({ error }) => { console.error(error) }),
};