from setuptools import setup, find_packages

setup(
    name="analyze-trello",
    version="0.1.0",
    description="Meltano project file bundle of Matatika datasets for tap-trello",
    packages=find_packages(),
    package_data={
        "bundle": [
            "analyze/datasets/tap-trello/*.yml",
            "orchestrate/tap-trello/elt.sh"
        ]
    },
)
