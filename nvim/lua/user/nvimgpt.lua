local status_nvimgpt_ok, nvimgpt = pcall(require, "nvim-gpt")
if not status_nvimgpt_ok then
	return
end

nvimgpt.setup {
    -- which backend to use: 'gpt-3.5-turbo', 'gpt-4', 'gpt-4-32k', 'creative', 'balanced', 'percise', 'google-search'
    model = 'balanced',
    -- may provide specific parameters like temperature depends on models
    params = {
        ['gpt-3.5-turbo'] = {
            -- see https://platform.openai.com/docs/api-reference/chat/create
            temperature = 0.85,
            top_p = 1,
            n = 1,
            presence_penalty = 0,
            frequency_penalty = 0,
        },
        ['gpt-4'] = {
            -- same as above
        },
        ['gpt-4-32k'] = {
            -- same as above
        },
        ['google-search'] = {
            -- see https://pypi.org/project/googlesearch-python
            num_results = 10,
            sleep_interval = 0,
            timeout = 5,
            lang = 'en',
            format = '# {title}\n{url}\n\n{desc}',
        },
    },
    -- '|/_\\' = rotating loading symbol, '_ ' = blinking on and off, '' = disable
    cursors = '|/_\\',
    -- this is how we quote code when :'<,'>GPTCode
    code_quote = '{question}\n```{filetype}\n{code}\n```',
    -- this is how we quote language type when :GPTWrite
    in_language = '{question}\n(in {filetype})',
    -- title indicating human question in GPT window
    question_title = '\n🙂:',
    -- title indicating bot answer in GPT window
    answer_title = '\n🤖:',
    -- marker use when human requests to regenerate
    regenerate_title = '🔄',
    -- whether to show bot's welcome messages on start up: 'fancy', '🤖 {}', 'none'
    welcome_messages = '🤖 {}',
    -- GPT window width
    window_width = 45,
    -- GPT window specific options
    window_options = {
        wrap = true,
        list = false,
        cursorline = true,
        number = false,
        relativenumber = false,
    },
    -- whether we lock to last line when answer: none, last-char, last-line, force
    lock_last_line = 'force',
    -- GPT window update interval (ms) when streaming the answer
    update_interval = 180,
    -- automatically add default keymaps (see 'Keymaps' section below)
    no_default_keymaps = false,
    -- preset templates, can be used like @p or @plain in :GPT or :GPTCode
    question_templates = [[
Note that you shall only output the plain answer, with no additional text like 'Sure' or 'Here is the result'.
Please wrap the final answer with triple quotes like ```answer```.
The answer is wrong, please try again.
Write a test for this code.
Write an documentation or API reference for this code.
Could you find any possible BUGs in this code?
Write a benchmark for this code. You may want to use the Google Benchmark as framework.
Rewrite to simplify this.
Edit the code to fix the problem.
How to fix this error?
Explain the purpose of this code, step by step.
Rename the variable and function names to make them more readable.
Rewrite to make this code more readable and maintainable.
This line is too long and complex. Could you split it for readability?
Please reduce duplication by following the Don't Repeat Yourself principle.
Complete the missing part of code with given context.
Implement the function based on its calling signature.
Here is a markdown file that have several links in the format [name](link), please fill the links according to given name. You may want to search the web if you are not sure about the link.
Make this expression longer and fullfilling.
Let's think step by step.
Could you verify this?
You may want to search the web.
Since the output length is limited. Please omit the unchanged part with ellipses. Only output the changed or newly-added part.
Please provide multiple different versions of answer for reference.
Fix possible grammar issues or typos in my writing.
Rewrite with better choices of words.
Translate from Chinese to English, or English to Chinese.
]],
}
