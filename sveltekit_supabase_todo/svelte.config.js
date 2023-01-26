import adapter from '@sveltejs/adapter-static'
import {
  mdsvex
} from 'mdsvex'
import preprocess from 'svelte-preprocess'

import mdsvexConfig from './mdsvex.config.js'

/** @type {import('@sveltejs/kit').Config} */
const config = {
  extensions: ['.svelte', '.md'],
  preprocess: [preprocess(), mdsvex(mdsvexConfig)],

  kit: {
    adapter: adapter(),
  },
}

export default config