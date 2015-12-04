class TestGmpeSmtk(object):
    def test_notebook(self):
        from ipynb_runner import get_ipnb
        notebooks = []

        for f in ["."]:
            notebooks += get_ipnb(f)

        for notebook in notebooks:
            yield self.check_notebook, notebook

    def check_notebook(self, notebook):
        from ipynb_runner import run_notebook
        assert run_notebook(notebook)
