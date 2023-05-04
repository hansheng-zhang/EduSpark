import pandas as pd
import numpy as np
from sklearn.model_selection import train_test_split
from sklearn.tree import DecisionTreeClassifier
from sklearn.metrics import accuracy_score
from sklearn import tree
import matplotlib.pyplot as plt

# Generate a random dataset with 30 data points
np.random.seed(42)
GPA = np.random.uniform(2.5, 4.0, 30)
TOEFL_Score = np.random.randint(80, 121, 30)
Program_Ranking = np.random.randint(1, 4, 30)
Recommended = []

# Set some simple rules for generating recommendations
for i in range(30):
    if GPA[i] >= 3.5 and TOEFL_Score[i] >= 105:
        Recommended.append('Yes')
    elif Program_Ranking[i] == 1 and TOEFL_Score[i] >= 100:
        Recommended.append('Yes')
    else:
        Recommended.append('No')

# Create a DataFrame from the dataset
data = {
    'GPA': GPA,
    'TOEFL_Score': TOEFL_Score,
    'Program_Ranking': Program_Ranking,
    'Recommended': Recommended
}
df = pd.DataFrame(data)

# Map the Recommended column to numerical values (0 for No, 1 for Yes)
df['Recommended'] = df['Recommended'].map({'No': 0, 'Yes': 1})

# Split the dataset into features (X) and target (y) variables
X = df.drop('Recommended', axis=1)
y = df['Recommended']

# Split the dataset into training and testing sets
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42)

# Create and fit the decision tree classifier with a higher max_depth
clf = DecisionTreeClassifier(max_depth=5)
clf.fit(X_train, y_train)

# Predict the recommendations for the test set
y_pred = clf.predict(X_test)

# Calculate the accuracy of the classifier
accuracy = accuracy_score(y_test, y_pred)
print(f'Accuracy: {accuracy}')

# Visualize the decision tree
fig, ax = plt.subplots(figsize=(12, 12))
tree.plot_tree(clf, ax=ax, feature_names=['GPA', 'TOEFL_Score', 'Program_Ranking'], class_names=['No', 'Yes'], filled=True)
plt.show()
