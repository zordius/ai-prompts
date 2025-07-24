# Task: Run Markdown Linter and Fix Issues

1. **Check for `lint:md` Command**:
   - Inspect the `package.json` file:
     - If a `lint:md` command exists, proceed with the linting process.
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

2. **Run the Linter**:
   - Execute the following command to lint Markdown files:

     ```bash
     npm run lint:md
     ```

3. **Analyze Lint Results**:
   - The linter will output issues in the following format:

     ```
     /path/to/file.md:line:column LINT_CODE/description Additional details
     ```

   - Group issues **by file**:
     - Ensure all fixes for a specific file are applied together in one batch to minimize update iterations.
     - Skip any file that has no reported lint errors.

4. **Fix Issues**:
   - For each file with linting issues:
     - Review the line, column, and lint code details provided in the error report.
     - Apply corrections based on the nature of each issue. Specifically:
       - For **line length issues (`MD013`)**:
         - Re-distribute lines within items or paragraphs to keep lines as long as possible while still adhering to the line-length rule.
         - Prioritize readability and structured formatting while redistributing content.
       - For other issues (e.g., `MD009`, `MD022`, `MD047`):
         - Apply fixes adhering to Markdown linting rules and project-specific conventions.
     - Finalize all fixes into a **single patch** and apply them *once* to avoid making multiple updates to the same file.
