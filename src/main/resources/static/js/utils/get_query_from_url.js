function getQueryFromUrl(key = "", searchUrl){
  let urlSearchParams = new URLSearchParams(searchUrl);
  return urlSearchParams.get(key);
}
export default getQueryFromUrl;