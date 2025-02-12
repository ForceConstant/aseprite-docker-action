# Aseprite Docker Action

Action to run [Aseprite](https://github.com/aseprite/aseprite) in docker container for exporting and CI for script.

## Usage

Files in `$GITHUB_WORKSPACE` are mounted to docker container.
You can get exit code as output, and stdout and stderr as file (`stdout.txt` and `stderr.txt` respectively.)
Details on [`./action.yml`](./action.yml).

### Running Script

```yaml
- uses: actions/checkout@v4

- name: Run sample-script.lua
  uses: Tsukina-7mochi/aseprite-docker-action
  id: run-sample-script
  with:
    args: '--script path/to/sample-script.lua'

- name: Print result
  run: |
    echo "exit code: ${{ steps.run-sample-script.outputs.exit-code }}"
    echo "stdout:"
    cat stdout.txt
    echo "stderr:"
    cat stderr.txt
```
