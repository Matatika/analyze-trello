# analyze-trello

Meltano project [file bundle](https://meltano.com/docs/command-line-interface.html#file-bundle) of Matatika datasets for `tap-trello`. These datasets are automatically added to your Matatika workspace when you initialize a `tap-trello` pipeline.

Files:
- [`analyze/datasets`](./bundle/analyze/datasets) (directory)

### Adding this file bundle to your own Meltano project

Add plugin to `discovery.yml`:
```yaml
files:
- name: analyze-trello
  namespace: tap_trello
  repo: https://github.com/Matatika/analyze-trello.git
  pip_url: git+https://github.com/Matatika/analyze-trello.git
```

Add plugin to your Meltano project:
```bash
# Add only the file bundle
meltano add files analyze-trello

# Add the file bundle as a related plugin through adding the extractor
meltano add extractor --include-related tap-trello
```

### Adding this along with tap-trello as a custom plug-in for in Matatika

Go to data imports, click on `Custom Data Source` and copy and paste in:

```yaml
extractors:
  - name: tap-trello
    namespace: tap_trello
    pip_url: git+https://github.com/Matatika/tap-trello.git
    capabilities:
      - state
      - discover
      - catalog
    settings:
      - name: example_setting_one
        kind: password
      - name: example_setting_two
files:
  - name: analyze-trello
    namespace: tap_trello
    update:
      analyze/datasets/tap-trello: true
    pip_url: git+https://github.com/Matatika/analyze-trello.git
```