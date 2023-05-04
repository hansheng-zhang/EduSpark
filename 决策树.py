import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.tree import DecisionTreeClassifier
from sklearn.metrics import accuracy_score
from sklearn import tree
import matplotlib.pyplot as plt

# Create a sample dataset
data = {
    'GPA': [3.2, 3.8, 3.4, 3.6, 3.9, 3.1, 3.5, 3.7],
    'TOEFL_Score': [100, 115, 105, 110, 120, 95, 108, 112],
    'Program_Ranking': [3, 1, 2, 1, 1, 3, 2, 1],
    'Recommended': ['No', 'Yes', 'Yes', 'Yes', 'Yes', 'No', 'Yes', 'Yes']
}

# Convert the dataset to a DataFrame
df = pd.DataFrame(data)

# Map the Recommended column to numerical values (0 for No, 1 for Yes)
df['Recommended'] = df['Recommended'].map({'No': 0, 'Yes': 1})

# Split the dataset into features (X) and target (y) variables
X = df.drop('Recommended', axis=1)
y = df['Recommended']

# Split the dataset into training and testing sets
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# Create and fit the decision tree classifier
clf = DecisionTreeClassifier(max_depth=5)
clf.fit(X_train, y_train)

# Predict the recommendations for the test set
y_pred = clf.predict(X_test)

# Calculate the accuracy of the classifier
accuracy = accuracy_score(y_test, y_pred)
print(f'Accuracy: {accuracy}')

# Visualize the decision tree
plt.figure(figsize=(12, 8))
tree.plot_tree(clf, filled=True, rounded=True, class_names=['No', 'Yes'], feature_names=X.columns)
plt.show()
