import pymysql
import numpy as np
import pandas as pd
from sklearn.tree import DecisionTreeClassifier
from sklearn.model_selection import train_test_split
from sklearn.metrics import classification_report
from sklearn import tree
import matplotlib.pyplot as plt

# Connect to the database
connection = pymysql.connect(host='localhost',
                             user='<your_username>',
                             password='<your_password>',
                             db='EduSpark',
                             charset='utf8mb4',
                             cursorclass=pymysql.cursors.DictCursor)

# Execute SQL query and fetch the data
try:
    with connection.cursor() as cursor:
        sql = """
        SELECT u.QSranking as QS_ranking, a.toefl_score as TOEFL_Score, a.gre_score as GRE_Score, a.GPA
        FROM applications app
        JOIN appliers a ON app.applier_id = a.applier_id
        JOIN program p ON app.program_id = p.Program_ID
        JOIN university u ON p.University_ID = u.UID
        """
        cursor.execute(sql)
        data = cursor.fetchall()
finally:
    connection.close()

# Convert the fetched data into a DataFrame
data = pd.DataFrame(data)

# Split the dataset into features and labels
X = data[['TOEFL_Score', 'GRE_Score', 'GPA']]
y = data['QS_ranking']

# Split the data into training and testing sets
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42)

# Create the decision tree classifier
clf = DecisionTreeClassifier()

# Train the model
clf.fit(X_train, y_train)

# Make predictions on the test set
y_pred = clf.predict(X_test)

# Evaluate the model
print(classification_report(y_test, y_pred))
# Visualize the decision tree
fig, ax = plt.subplots(figsize=(12, 12))
tree.plot_tree(clf, ax=ax, feature_names=['TOEFL_Score', 'GRE_Score', 'GPA'], class_names=['1-10', '11-30', '31-50', '50-100', '>100'], filled=True)
plt.show()
