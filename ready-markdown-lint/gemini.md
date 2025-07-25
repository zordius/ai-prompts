# Task: Ready Markdown Linter

1. **Check for `lint:md` Command**:
   - Inspect the `package.json` file:
     - If the `lint:md` command exists:
       - Respond with: `"The lint:md command is ready."`
     - If the `lint:md` command is missing:
       - Install the necessary linter packages:

         ```bash
         npm install markdownlint-cli markdownlint-cli2 --save-dev
         ```

       - Add the following `lint:md` script to `package.json`:

         ```json
         "scripts": {
           "lint:md": "markdownlint-cli2 '**/*.md' '#node_modules' --fix"
         }
         ```

   - Ensure the `lint:md` command is functional after setup by reporting success or errors if any occur.
