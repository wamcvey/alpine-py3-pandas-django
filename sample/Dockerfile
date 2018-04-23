FROM jackton1/alpine-python3-numpy-pandas:latest

RUN $VENV_PYTHON_PATH -c "import pandas as pd; test = pd.DataFrame({'test': '1'}, index=[0]); print(test);"
