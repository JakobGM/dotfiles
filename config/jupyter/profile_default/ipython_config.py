from powerline.bindings.ipython.since_5 import PowerlinePrompts

c = get_config()
c.TerminalInteractiveShell.simple_prompt = False
c.TerminalInteractiveShell.prompts_class = PowerlinePrompts

c.InteractiveShellApp.exec_files = [
    'autoimport.py',
    'otovo.py',
]
