local lsp_capabilities = require('blink.cmp').get_lsp_capabilities()

lsp_capabilities.textDocument.completion.completionItem.snippetSupport = true

return {
    settings = {
        neocmake = {
            init_options = {
                format = {
                    enable = true,
                },
                lint = {
                    enable = true,
                },
                scan_cmake_in_package = true, -- was false?
                semantic_token = false,
            },
            capabilites = lsp_capabilities,
        },
    },
}
