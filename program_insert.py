import pandas as pd
from sqlalchemy import create_engine

# 读取Excel文件
file_path = '项目插入信息.xlsx'
sheet_name = 'Sheet1'
df = pd.read_excel(file_path, sheet_name=sheet_name, engine='openpyxl')

# 创建一个到数据库的连接（Mac使用的语句，不知道windows是否相同，root后要填密码，我的没有填）
db_connection_string = "mysql+pymysql://root:@localhost:3306/Eduspark"
engine = create_engine(db_connection_string)

# 将数据插入SQL表格
table_name = 'Programs'
df.to_sql(table_name, engine, if_exists='replace', index=False)
