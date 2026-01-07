return {
  'nvim-java/nvim-java',
  config = function()
    require('java').setup {
      root_markers = {
        'settings.gradle',
        'settings.gradle.kts',
        'pom.xml',
        'build.gradle',
        'mvnw',
        'gradlew',
        'build.gradle',
        'build.gradle.kts',
      },
      checks = {
        nvim_version = true, -- Check Neovim version
        nvim_jdtls_conflict = true, -- Check for nvim-jdtls conflict
      },
      -- JDK installation
      jdk = {
        auto_install = false,
      },
      jdtls = {
        settings = {
          java = {
            configuration = {
              runtimes = {
                {
                  name = 'JavaSE-22',
                  path = 'C:\\Program Files\\Java\\jdk-22',
                  default = true,
                },
              },
              updateBuildConfiguration = 'automatic',
            },
            -- Eclipse settings
            eclipse = {
              downloadSources = true,
            },
            maven = {
              downloadSources = true,
            },
            implementationsCodeLens = {
              enabled = true,
            },
            referencesCodeLens = {
              enabled = true,
            },
            references = {
              includeDecompiledSources = true,
            },
            format = {
              enabled = true,
            },
          },
        },
      },

      -- Extensions
      lombok = {
        enable = true,
        version = '1.18.40',
      },

      java_test = {
        enable = true,
        version = '0.40.1',
      },

      java_debug_adapter = {
        enable = true,
        version = '0.58.2',
      },

      spring_boot_tools = {
        enable = true,
        version = '1.55.1',
      },

      -- Logging
      log = {
        use_console = true,
        use_file = true,
        level = 'info',
        log_file = vim.fn.stdpath 'state' .. '/nvim-java.log',
        max_lines = 1000,
        show_location = false,
      },
    }
    vim.lsp.enable 'jdtls'
  end,
}
