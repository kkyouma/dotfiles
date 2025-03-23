return {
  'nvim-tree/nvim-web-devicons',
  config = function()
    require('nvim-web-devicons').setup {
      override = {
        -- Language/file type extensions
        ['js'] = {
          icon = ' ',
          color = '#EFD81D',
          name = 'JavaScript',
        },
        ['ts'] = {
          icon = '󰛦 ',
          color = '#3178C6',
          name = 'TypeScript',
        },
        -- ['py'] = {
        --   icon = ' ',
        --   color = '#3776AB',
        --   name = 'Python',
        -- },
        ['ipynb'] = {
          icon = ' ',
          color = '#F37626',
          name = 'Jupyter',
        },
        ['pkl'] = {
          icon = ' ',
          color = '#B8DBE4',
          name = 'pickle',
        },
        ['pickle'] = {
          icon = ' ',
          color = '#B8DBE4',
          name = 'pickle',
        },
        ['json'] = {
          icon = ' ',
          color = '#FFB300',
          name = 'Json',
        },
        ['tsv'] = {
          icon = ' ',
          color = '#8BC34A',
          name = 'Tsv',
        },
        ['parquet'] = {
          icon = ' ',
          color = '#7FAAE4',
          name = 'Parquet',
        },
        ['yml'] = {
          icon = ' ',
          color = '#CB171E',
          name = 'Yaml',
        },
        -- ['tex'] = {
        --   icon = ' ',
        --   color = '#008080',
        --   name = 'Latex',
        -- },
        -- Special files
        ['package.json'] = {
          icon = '󰎙 ',
          color = '#5FA04E',
          name = 'PackageJson',
        },
        ['package-lock.json'] = {
          icon = '󰎙 ',
          color = '#5FA04E',
          name = 'PackageLockJson',
        },
        ['LICENSE.txt'] = {
          icon = '󰿃 ',
          color = '#FD5621',
          iter_color = '64',
          name = 'Licensee',
        },

        ['tsconfig.json'] = {
          icon = ' ',
          color = '#3178C6',
          name = 'TypeScriptConfig',
        },
        ['dockerfile'] = {
          icon = ' ',
          color = '#018EF5',
          name = 'Docker',
        },
        ['.env'] = {
          icon = ' ',
          color = '#89915B',
          name = 'Env',
        },
      },
      override_by_filename = {
        ['astro.config.mjs'] = {
          icon = ' ',
          name = 'JavaScript',
        },
        ['README.md'] = {
          icon = '󰋼 ',
          color = '#41A5F5',
          name = 'CustomReadme',
        },
        ['requirements.txt'] = {
          icon = ' ',
          color = '#EF5350',
          name = 'Requirements',
        },
        ['docker-compose.yml'] = {
          icon = ' ',
          color = '#018EF5',
          name = 'DockerCompose',
        },
        ['Makefile'] = {
          icon = '  ',
          color = '#EF5350',
          name = 'Makefile',
        },
        ['.env.local'] = {
          icon = ' ',
          color = '#89915B',
          name = 'EnvLocal',
        },
        ['config.yaml'] = {
          icon = ' ',
          color = '#6D3BBF',
          name = 'Config',
        },
      },
      override_by_extension = {
        ['md'] = {
          icon = ' ',
          color = '#0157A5',
          name = 'Markdown',
        },
        ['jpg'] = {
          icon = '󰋩 ',
          color = '#25A69A',
          name = 'Jpg',
        },
        ['png'] = {
          icon = '󰥶 ',
          color = '#25A69A',
          name = 'Png',
        },
        ['pdf'] = {
          icon = ' ',
          color = '#D33833',
          name = 'Pdf',
        },
        ['csv'] = {
          icon = ' ',
          color = '#8BC34A',
          name = 'Csv',
        },
        ['xlsx'] = {
          icon = '󱎏 ',
          color = '#8BC34A',
          name = 'Csv',
        },
        ['test.py'] = {
          icon = '󰙨 ',
          color = '#FFCA28',
          name = 'TestPy',
        },
      },
    }
  end,
}
