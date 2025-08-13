# Documentation Overivew

The [Documentation Site](https://materials-commons.github.io/) for Materials Commons.

See shell scripts in scripts folder for information on building the documentation.

To update documentation for the CLI

  1. In mccli run ./build_docs.sh
  2. In this project
      a. `cd materials-commons-cli`
      b. `rm -rf html`
      c. `cp -r <mcclidir>/doc/build/html .`
      d. `cd html`
      e. `../../convert_sphinx_output.sh`
  3. Now check into git and push

