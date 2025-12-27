require('minuet').setup {
    cmp = {
        enable_auto_complete = false,
    },
    virtual_text = {
        keymap = {
            dismiss = '<A-e>',
        },
    },
    provider = 'openai_fim_compatible',
    n_completions = 1,
    context_window = 512,
    provider_options = {
        claude = {
            model = 'claude-sonnet-4-20250514',
            stream = true,
            api_key = 'ANTHROPIC_API_KEY',
            end_point = 'https://api.anthropic.com/v1/messages',
        },
        openai_compatible = {
            name = 'Ollama',
            model = 'gpt-oss:latest',
            api_key = 'TERM',
            end_point = 'http://localhost:11434/chat/completions',
        },
        openai_fim_compatible = {
            api_key = 'TERM',
            name = 'Ollama Qwen2 Coder',
            end_point = 'http://localhost:11434/v1/completions',
            model = 'qwen2.5-coder:7b',
            optional = {
                max_tokens = 56,
                top_p = 0.9,
            },
        },
    }
}
