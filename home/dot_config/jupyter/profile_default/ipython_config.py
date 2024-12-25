c = get_config()

try:
    from powerline.bindings.ipython.since_5 import PowerlinePrompts

    c.TerminalInteractiveShell.simple_prompt = False
    c.TerminalInteractiveShell.prompts_class = PowerlinePrompts
except ModuleNotFoundError:
    pass

c.InteractiveShellApp.exec_files = [
    "autoimport.py",
]
