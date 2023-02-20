import { prisma } from '$lib/server/prisma';
import type { PageServerLoad, Actions } from './$types';
import { error } from '@sveltejs/kit';
import { getImageUrl } from '$lib/utils';

export const load: PageServerLoad = async ({ locals }) => {
  const getProfileUser =  async (userId: string | undefined) => {
    if (!userId) return;
    try {
      const profile = await prisma.profile.findUnique({
        where: {
          id: userId
        }
      });
      return profile;
    } catch (e) {
      console.error(e);
      throw error(500, 'Something Wrong!!!');
    }
  };

  return {
    profile: getProfileUser(locals.session?.user?.id),
  }
};

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

      // const updates = {
      //   id: user.id,
      //   username: data.get('username'),
      //   website: data.get('website'),
      //   avatar_url: filename,
      //   updated_at: new Date()
      // };
      // const result = await locals.sb.from('profiles').upsert(updates);
      
      const updates = {
        id: user.id,
        username: data.get('username'),
        // website: data.get('website'),
        avatar_url: filename,
        updated_at: new Date()
      };
      await prisma.profile.update({
        where: {
          id: user.id
        },
        data: updates,
      })
    } catch (err) {
      console.log('ERROR: ', err);

      throw error(400, 'Something went wrong updating your profile');
    }

    return {
      success: true
    };
  }
};
