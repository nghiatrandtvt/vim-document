local function setup_jdtls()
  local jdtls = require('jdtls')
  local root_markers = { '.git', 'mvnw', 'gradlew', 'pom.xml', 'build.gradle' }
  local root_dir = require('jdtls.setup').find_root(root_markers)
  local config = {
    cmd = { "jdtls" }, -- can use full path to jdtls. If only jdtls, need to set PATH
    --root_dir = vim.fn.getcwd(),
	root_dir = root_dir,
    settings = {
      java = {
        home = "<JAVA_HOME>",
      },
    },
  }
  jdtls.start_or_attach(config)
end

-- run jdtls when open Java
vim.api.nvim_create_autocmd("FileType", {
  pattern = "java",
  callback = setup_jdtls,
})
