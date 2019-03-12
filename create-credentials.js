const { PLUGIN_GIT_LOGIN, PLUGIN_GIT_PASSWORD } = process.env;

if (PLUGIN_GIT_LOGIN && PLUGIN_GIT_PASSWORD) {
  console.log(`${encodeURIComponent(PLUGIN_GIT_LOGIN)}:${encodeURIComponent(PLUGIN_GIT_PASSWORD)}`);
}
