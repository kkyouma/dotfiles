return {
  'nvim-tree/nvim-web-devicons',
  config = function()
    require('nvim-web-devicons').setup {
      default = true, -- icono genérico estético
      override = {
        -- ========================================
        -- DATA ENGINEERING (formatos y bases)
        -- ========================================
        ['ipynb'] = { icon = '', color = '#F57C00', name = 'Jupyter' },
        ['avro'] = { icon = '󰈙', color = '#EF6C00', name = 'Avro' },
        ['sql'] = { icon = '', color = '#00BCD4', name = 'Sql' },
        ['db'] = { icon = '', color = '#00ACC1', name = 'Database' },
        ['psql'] = { icon = '', color = '#336791', name = 'Postgres' },
        ['mysql'] = { icon = '', color = '#4479A1', name = 'MySQL' },
        ['bigquery'] = { icon = '󱇶', color = '#4285F4', name = 'BigQuery' },
        ['sqlite'] = { icon = '', color = '#039BE5', name = 'SQLite' },
        ['sqlite3'] = { icon = '', color = '#0277BD', name = 'SQLite3' },
        ['duckdb'] = { icon = '', color = '#FFD700', name = 'DuckDB' },
        ['kql'] = { icon = '󰠮', color = '#00B8D4', name = 'Kusto' },

        -- Columnar
        ['parquet'] = { icon = '󰈙', color = '#0288D1', name = 'Parquet' },
        ['orc'] = { icon = '󰈙', color = '#8E24AA', name = 'ORC' },
        ['feather'] = { icon = '󰈙', color = '#26A69A', name = 'Feather' },

        -- Tabular
        ['csv'] = { icon = '󰈛', color = '#8BC34A', name = 'CSV' },
        ['tsv'] = { icon = '󰈛', color = '#7CB342', name = 'TSV' },
        ['psv'] = { icon = '󰈛', color = '#689F38', name = 'PSV' },
        ['xlsx'] = { icon = '󰈛', color = '#2E7D32', name = 'Excel' },
        ['ods'] = { icon = '󰈛', color = '#1B5E20', name = 'ODS' },

        -- Bin
        ['pkl'] = { icon = '', color = '#3572A5', name = 'Pickle' },
        ['pickle'] = { icon = '', color = '#3572A5', name = 'Pickle' },
        ['bin'] = { icon = '', color = '#FF6E40', name = 'Bin' },

        -- Semistructured
        ['json'] = { icon = '󰘦', color = '#FBC02D', name = 'JSON' },
        ['jsonl'] = { icon = '󰘦', color = '#F57F17', name = 'JSONL' },
        ['xml'] = { icon = '󰈮', color = '#EF6C00', name = 'XML' },
        ['yaml'] = { icon = '󰈙', color = '#9C4221', name = 'YAML' },
        ['yml'] = { icon = '󰈙', color = '#9C4221', name = 'Yaml' },

        -- Unstructured
        ['png'] = { icon = '󰈟', color = '#25A69A', name = 'Png' },
        ['jpg'] = { icon = '󰈟', color = '#25A69A', name = 'Jpg' },
        ['jpeg'] = { icon = '󰈟', color = '#25A69A', name = 'Jpeg' },
        ['gif'] = { icon = '󰈟', color = '#25A69A', name = 'Gif' },

        ['zip'] = { icon = '󰗄', color = '#AFB42B', name = 'Zip' },
        ['tar'] = { icon = '󰗄', color = '#AFB42B', name = 'Zip' },
        ['rar'] = { icon = '󰗄', color = '#AFB42B', name = 'Rar' },

        ['txt'] = { icon = '󰧮', color = '#41A5F5', name = 'Txt' },

        -- ========================================
        -- INFRAESTRUCTURA COMO CÓDIGO
        -- ========================================
        ['tf'] = { icon = '', color = '#5C6BC0', name = 'Terraform' },
        ['tfvars'] = { icon = '', color = '#5C6BC0', name = 'TerraformVars' },
        ['hcl'] = { icon = '', color = '#5C6BC0', name = 'HCL' },
        ['tfstate'] = { icon = '', color = '#5C6BC0', name = 'Terraform' },
        ['terraformignore'] = { icon = '', color = '#5C6BC0', name = 'Terraform' },
        ['tf.json'] = { icon = '', color = '#5C6BC0', name = 'TerraformJSON' },

        -- ========================================
        -- LENGUAJES DE PROGRAMACIÓN
        -- ========================================
        ['java'] = { icon = '󰅶', color = '#E76F00', name = 'Java' },
        ['rs'] = { icon = '', color = '#DEA584', name = 'Rust' },
        ['js'] = { icon = '', color = '#F7DF1E', name = 'JavaScript' },
        ['ts'] = { icon = '󰛦', color = '#007ACC', name = 'TypeScript' },
        ['go'] = { icon = '', color = '#00ADD8', name = 'Go' },
        ['scala'] = { icon = '', color = '#DC322F', name = 'Scala' },
        ['r'] = { icon = '󰟔', color = '#198CE7', name = 'R' },
        ['jl'] = { icon = '', color = '#9558B2', name = 'Julia' },
        ['astro'] = { icon = '', color = '#7B4DFF', name = 'Astro' },
        ['cpp'] = { icon = '', color = '#f34b7d', name = 'CPlusPlus' },

        -- sh
        ['sh'] = { icon = '', color = '#FF7043', name = 'Bash' },
        ['zsh'] = { icon = '', color = '#FF7043', name = 'Zsh' },

        -- ========================================
        -- CIENTÍFICO / DOCUMENTACIÓN
        -- ========================================
        ['tex'] = { icon = '', color = '#00BFA5', name = 'Latex' },
        ['bib'] = { icon = '󱉟', color = '#007ACC', name = 'BibTeX' },
        ['rmd'] = { icon = '', color = '#41A5F5', name = 'Rmd' },
        ['mdx'] = { icon = '', color = '#FFCA28', name = 'MDX' },
        ['md'] = { icon = '', color = '#41A5F5', name = 'Markdown' },

        -- ========================================
        -- CONFIGURACIÓN Y HERRAMIENTAS
        -- ========================================
        ['env'] = { icon = '', color = '#FFB300', name = 'Env' },
        ['LICENSE.txt'] = { icon = '󰄤', color = '#FF5722', name = 'Licensee' },

        -- Git
        ['gitignore'] = { icon = '󰊢', color = '#F05033', name = 'Gitignore' },
        ['gitattributes'] = { icon = '󰊢', color = '#F05033', name = 'Gitattributes' },
      },
      override_by_filename = {
        ['README.md'] = { icon = '󰋼', color = '#41A5F5', name = 'CustomReadme' },
        ['.env'] = { icon = '', color = '#FFB300', name = 'Env' },
        ['.env.example'] = { icon = '', color = '#FFA000', name = 'EnvExample' },
        ['makefile'] = { icon = '', color = '#EF5350', name = 'Makefile' },
        ['poetry.lock'] = { icon = '', color = '#00ADD8', name = 'PoetryLock' },
        ['Cargo.toml'] = { icon = '', color = '#DEA584', name = 'Cargo' },
        ['Cargo.lock'] = { icon = '', color = '#DEA584', name = 'CargoLock' },
        ['google-services.json'] = { icon = '', color = '#FEC007', name = 'CargoLock' },

        -- Python
        ['requirements.txt'] = { icon = '󱁻', color = '#3572A5', name = 'Requirements' },
        ['.python-version'] = { icon = '󱁻', color = '#3572A5', name = 'PythonVersion' },
        ['pyproject.toml'] = { icon = '', color = '#EF5350', name = 'PyProject' },

        -- Kubernetes
        ['kubernetes.yaml'] = { icon = '󱃾', color = '#438AFF', name = 'Kubernetes' },
        ['kubernetes.yml'] = { icon = '󱃾', color = '#438AFF', name = 'Kubernetes' },
        ['k8s.yml'] = { icon = '󱃾', color = '#438AFF', name = 'Kubernetes' },
      },
    }
  end,
}
