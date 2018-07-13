# pre-commit with yapf + isort

If you want to have isort sorting your imports and yapf formatting your code,
and check for this with pre-commit you need this!

- For pre-commit: see https://github.com/pre-commit/pre-commit
- For yapf: see https://github.com/google/yapf
- For isort: see https://github.com/timothycrosley/isort


### Using yapf+isort with pre-commit

Add this to your `.pre-commit-config.yaml`:

    -   repo: https://github.com/philall/pre-commit-yapf-isort
        sha: ''  # Use the sha / tag you want to point at
        hooks:
        -   id: yapf-isort
