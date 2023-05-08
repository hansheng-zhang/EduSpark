import numpy as np
import pandas as pd
from sklearn.tree import DecisionTreeClassifier
from sklearn.model_selection import train_test_split
from sklearn.metrics import classification_report
from sklearn import tree
import matplotlib.pyplot as plt

# Get the data from the database (skip this step)

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
