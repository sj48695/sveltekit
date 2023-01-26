import fss from "fs";
import fs from "fs/promises";
import yaml from "js-yaml";
async function getArticleMetas(dir) {
  const promises = (await fs.readdir(dir)).filter((f) => fss.existsSync(`${dir}/${f}/+page.md`)).map((id) => getArticleMeta(dir, id));
  return (await Promise.all(promises)).sort((a, b) => a.publishedAt < b.publishedAt ? 1 : -1);
}
async function getArticleMeta(dir, id) {
  const filepath = `${dir}/${id}/+page.md`;
  const f = await fs.readFile(filepath);
  const mtime = (await fs.stat(filepath)).mtime;
  return extractMeta(id, f.toString(), mtime);
}
function extractMeta(id, markdown, mtime) {
  const S = "---\n";
  const raw = markdown.substring(S.length, markdown.indexOf(S, S.length)).trim();
  const frontmatter = yaml.load(raw);
  return {
    ...frontmatter,
    id,
    draft: !!frontmatter.draft,
    modifiedAt: mtime.toISOString()
  };
}
const load = async () => {
  const posts = await getArticleMetas("src/routes/posts");
  return {
    posts
    // todos
  };
};
export {
  load
};
