import pandas as pd
from sqlalchemy import create_engine

# Connect to database
db_connection_string = "mysql+pymysql://root:@localhost:3306/Eduspark"
engine = create_engine(db_connection_string)


# 1. University
file_path = 'University/University.xlsx'
sheet_name = 'Sheet1'
df = pd.read_excel(file_path, sheet_name=sheet_name, engine='openpyxl')

table_name = 'university'
df.to_sql(table_name, engine, if_exists='append', index=False)

# 2. University_major
file_path = 'University/Major.xlsx'
sheet_name = 'Sheet1'
df = pd.read_excel(file_path, sheet_name=sheet_name, engine='openpyxl')

table_name = 'uni_maj'
df.to_sql(table_name, engine, if_exists='append', index=False)

# 3. Programs
file_path = 'Program/Program.xlsx'
sheet_name = 'Sheet1'
df = pd.read_excel(file_path, sheet_name=sheet_name, engine='openpyxl')

table_name = 'program'
df.to_sql(table_name, engine, if_exists='append', index=False)

# 4. Employment
file_path = 'Program/Employment.xlsx'
sheet_name = 'Sheet1'
df = pd.read_excel(file_path, sheet_name=sheet_name, engine='openpyxl')

table_name = 'employment'
df.to_sql(table_name, engine, if_exists='append', index=False)

# 5. Standardized test
file_path = 'Program/Standardized test.xlsx'
sheet_name = 'Sheet1'
df = pd.read_excel(file_path, sheet_name=sheet_name, engine='openpyxl')

table_name = 'standardized_test'
df.to_sql(table_name, engine, if_exists='append', index=False)

# 6. Undergraduate university
file_path = 'Application/Undergraduate university.xlsx'
sheet_name = 'Sheet1'
df = pd.read_excel(file_path, sheet_name=sheet_name, engine='openpyxl')

table_name = 'undergra_univers'
df.to_sql(table_name, engine, if_exists='append', index=False)

# 7. Appliers
file_path = 'Application/Appliers.xlsx'
sheet_name = 'Sheet1'
df = pd.read_excel(file_path, sheet_name=sheet_name, engine='openpyxl')

table_name = 'appliers'
df.to_sql(table_name, engine, if_exists='append', index=False)

# 8. Applications
file_path = 'Application/Applications.xlsx'
sheet_name = 'Sheet1'
df = pd.read_excel(file_path, sheet_name=sheet_name, engine='openpyxl')

table_name = 'applications'
df.to_sql(table_name, engine, if_exists='append', index=False)
