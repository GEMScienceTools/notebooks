from ipynb_runner import get_ipnb


class TestGmpeSmtk(object):
    def test_notebooks(self):
        notebooks = []

        for f in ["."]:
            notebooks += get_ipnb(f)

        for notebook in notebooks:
            yield self.check_notebook, notebook

    def check_notebook(self, notebook):
        from ipynb_runner import test_notebook
        assert test_notebook(notebook)
