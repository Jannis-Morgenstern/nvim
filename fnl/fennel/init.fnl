(module fennel.init
  {autoload {core aniseed.code
             nvim aniseed.nvim
             util config.util
             str aniseed.string}})

(print
  (vim.inspect [1 2]))
