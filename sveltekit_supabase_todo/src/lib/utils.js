export const getImageUrl = async ({storage, bucket, filename, transform}) => {
  const {data: {publicUrl}} = await storage.from(bucket).getPublicUrl(filename, {
    transform,
  })
  return publicUrl;
}