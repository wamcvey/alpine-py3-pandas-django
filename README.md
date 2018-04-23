# Overview
This image [jackton1/alpine-python3-numpy-pandas]() contains data science packages(numpy, pandas) with python3.6 alpine linux as the base image.

### Platform: alpine 3.6
Packages available out-of-the-box:
python: 3.6.4
pip: 10.0.1

### Python packages:
- botocore: 1.10.2
- awscli: 1.15.2
- numpy: 1.14.0
- pandas: 0.22.0

# Usage
Use like you would any other base image:
```
FROM jackton1/alpine-python3-numpy-pandas:latest
RUN python3 -c "import pandas as pd; test = pd.DataFrame({'test': '1'}, index=[0]);"
```

# Versioning
The latest tag matches the most recent release, so jackton1/alpine-python3-numpy-pandas:latest will use the newest stable version available.
