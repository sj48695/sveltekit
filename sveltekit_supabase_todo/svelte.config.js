// import adapter from '@sveltejs/adapter-static'
// import adapter from '@sveltejs/adapter-auto'
import adapter from '@sveltejs/adapter-netlify'
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
    adapter: adapter({
      // if true, will create a Netlify Edge Function rather
      // than using standard Node-based functions
      edge: false,
 
      // if true, will split your app into multiple functions
      // instead of creating a single one for the entire app.
      // if `edge` is true, this option cannot be used
      split: false
    }),
  },
}

export default config