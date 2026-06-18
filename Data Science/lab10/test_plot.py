import pandas as pd

# Load the local CSV to mimic the notebook
df = pd.read_csv("time_series_covid19_confirmed_global.csv")
df.drop(columns=['Lat','Long','Province/State'], inplace=True, errors='ignore')
confirmed_cases = df.groupby('Country/Region').sum()
confirmed_cases = confirmed_cases.transpose()
confirmed_cases.index.name = 'date'

countries = ['Taiwan*', 'Brazil', 'Korea, South', 'US', 'China', 'Singapore']
confirmed_cases = confirmed_cases[countries]

# 1. Get dates in YYYY-MM format
dates = pd.to_datetime(confirmed_cases.index)
year_month = dates.strftime('%Y-%m')

# 2. Get the index positions of the first day of each month
temp_series = pd.Series(year_month)
tick_indices = temp_series.drop_duplicates(keep='first').index.tolist()
tick_labels = temp_series.drop_duplicates(keep='first').tolist()

print("Tick indices:", tick_indices)
print("Tick labels:", tick_labels)
