# Overview 
This is a basic baseimage with alpine, python 3.7, pandas (and numpy), and 
some django libraries pre-installed

# Updating
First update the desired components in requirements.in

Then `pip-compile`

### Platform: alpine

```bash
docker run -it --rm wamcvey/alpine-py3-pandas-django:latest python3 -c "import pandas as pd; pd.test();"
```

