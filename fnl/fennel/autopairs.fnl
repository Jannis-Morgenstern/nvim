(module fennel.autopairs {autoload {nvim aniseed.nvim
                                    autopairs nvim-autopairs
                                    cmp_autopairs nvim-autopairs.completion.cmp
                                    cmp cmp}})

(autopairs.setup {:check_ts true
                  :ts_config {:lua [:string :source]
                              :javascript [:string :template_string]}
                  :disable_filetype [:TelescopePrompt]
                  :fast_wrap {:map :<M-e> :chars ["{" "[" "(" "\"" "'" "`"]}
                  :pattern (string.gsub "[%'%\"%)%>%)%]%}%,]" "%s+" "")
                  :offset 0
                  :end_key "$"
                  :keys :qwertyuiopasdfghjklzxcvbnm
                  :check_comma true
                  :highlight :PmenuSel
                  :highlight_grey :LineNr})

(cmp.event:on :confirm_done
              (cmp_autopairs.on_confirm_done {:map_char {:text ""}}))
