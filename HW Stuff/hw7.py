#!/usr/bin/env python
# coding: utf-8

# ## HIS Final Project -- Alzheimer's Disease Risk Prediction

# ### Project Overview
# In this project, we aim to develop a decision support system for Alzheimer's disease diagnosis using patient-level data. The goal is to identify key factors that contribute to Alzheimer's risk, especially those that can be modified through lifestyle changes. The model is also intended to provide interpretable results that can support early screening and personalized prevention.
# 

# ### Dataset Description
# The dataset contains patient information including demographics, genetic risk, lifestyle habits, and cognitive test results. The target variable is a binary label indicating whether a patient has been diagnosed with Alzheimer’s.
# 
# 
# #### 🧍 Demographic Information
# 
# | Column                    | Description                                                                 |
# |---------------------------|-----------------------------------------------------------------------------|
# | `age`                     | Age of the individual in years.                                             |
# | `gender`                  | Biological sex (Male, Female).                                        |
# | `education_level`         | Years of formal education level.                   |
# | `income_level`            | Income bracket (Low, Medium, High).                                   |
# | `employment_status`       | Employment condition (Employed, Retired, Unemployed).                 |
# | `marital_status`          | Marital status (Single, Married, Widowed).                            |
# | `urban_vs_rural_living`   | Living environment (Urban or Rural).                                        |
# 
# 
# #### 🧘 Lifestyle and Behavioral Factors
# 
# | Column                    | Description                                                                 |
# |---------------------------|-----------------------------------------------------------------------------|
# | `physical_activity_level` | Frequency or intensity of physical activity (Low, Medium, High).      |
# | `smoking_status`          | Smoking behavior (Never, Former, Current).                            |
# | `alcohol_consumption`     | Frequency or pattern of alcohol consumption (Never, Occasionally, Regularly).    |
# | `dietary_habits`          | Quality of diet (Healthy, Average, Unhealthy).                        |
# | `sleep_quality`           | Self-reported sleep quality (Poor, Average, Good).                    |
# | `stress_levels`           | Reported level of stress (Low, Medium, High).                         |
# | `social_engagement_level` | Level of social interaction and community engagement.                       |
# 
# 
# #### 🩺 Medical History and Risk Factors
# 
# | Column                    | Description                                                                 |
# |---------------------------|-----------------------------------------------------------------------------|
# | `diabetes`                | Whether the individual has diabetes (Yes/No).                               |
# | `hypertension`            | Presence of high blood pressure (Yes/No).                                   |
# | `cholesterol_level`       | Blood cholesterol level (Normal, High).                               |
# | `depression_level`        | Severity of depression symptoms (Low, Medium, High).                  |
# | `cognitive_test_score`    | Score from cognitive function tests (higher = better cognition).            |
# | `bmi`                     | Body Mass Index, a measure of body fat based on height and weight.          |
# | `air_pollution_exposure`  | Level of exposure to air pollution (Low, Medium, High).               |
# 
# 
# #### 🧬 Genetic and Family History
# 
# | Column                    | Description                                                                 |
# |---------------------------|-----------------------------------------------------------------------------|
# | `family_history`          | Family history of Alzheimer’s (Yes/No).                                     |
# | `genetic_risk_factor`     | Genetic predisposition for Alzheimer’s (e.g., APOE-e4) (Yes/No).            |
# 
# 
# #### 🎯 Target Variables
# 
# | Column                    | Description                                                                 |
# |---------------------------|-----------------------------------------------------------------------------|
# | `Alzheimer's Diagnosis`   | Original diagnosis field (e.g., Yes/No).  
# 

# ### Data Preparation

# In this section, we import necessary packages and modules, read the data file, and then perform data cleaning to prepare data for analysis

# In[4]:


# import modules and packages
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
from matplotlib.colors import ListedColormap
import warnings
import scipy.stats as stats

from sklearn.pipeline import Pipeline
from sklearn.compose import ColumnTransformer
from sklearn.preprocessing import OneHotEncoder, StandardScaler
from sklearn.linear_model import LogisticRegression
from sklearn.tree import DecisionTreeClassifier
from sklearn.ensemble import ExtraTreesClassifier
from sklearn.ensemble import RandomForestClassifier, GradientBoostingClassifier, AdaBoostClassifier
from sklearn.discriminant_analysis import LinearDiscriminantAnalysis
from sklearn.metrics import accuracy_score, classification_report, recall_score
from sklearn.model_selection import GridSearchCV


pd.set_option('display.max_columns', None)
pd.set_option('display.width', None)


# In[ ]:


# read the data file
data = pd.read_csv('Data/alzheimers_prediction_dataset_usa.csv')
data.head()


# In[6]:


# data cleaning: rename the column with special character and drop the country column
data.rename(columns={"Alzheimer’s Diagnosis": "Alzheimer's Diagnosis"}, inplace=True)
data.drop(columns=['country'], inplace=True)
data.columns


# ### Exploratory Data Analysis
# To understand the dataset’s structure, detect potential anomalies or missing values, and uncover relationships between variables, we performed both descriptive analysis, univariate analysis, bivariate analysis, and correlation analysis in this part. This step helps guide preprocessing decisions and informs model selection by revealing patterns and distributions within the data.
# 

# #### Descriptive Analysis
# Statistics Summary

# In[7]:


# Check data types and null values in each column
data.info()


# In[8]:


# Perform descriptive statistics for both numerical and categorical columns
print("----------- Descriptive Statistics of Numerical Columns -----------")
print(data.describe().T.round(2))
print("\n---------- Descriptive Statistics of Categorical Columns -----------")
print(data.describe(include='object').T[['count', 'unique', 'top', 'freq']]) 


# #### Univariate Analysis
# This section focuses on analyzing each variable individually to understand its distribution, central tendency, and variability. 

# ##### Continuous Variables

# In[9]:


con_features = ['age', 'education_level', 'bmi', 'cognitive_test_score']
cat_features = data.columns.difference(con_features).drop('Alzheimer\'s Diagnosis')
data_con = data[con_features]

# Set up the subplot with 1 row and 4 columns, increase the width
fig, ax = plt.subplots(nrows=1, ncols=4, figsize=(30, 10))  # Increased width to 30 for wider graphs

# Determine global y-axis limit across all variables
global_ymax = 0
for col in con_features:
    counts, _ = np.histogram(data_con[col].dropna())
    global_ymax = max(global_ymax, counts.max())

# Plot histograms for each continuous variable
for i, col in enumerate(con_features):
    graph = sns.histplot(data=data_con, x=col, kde=True, ax=ax[i],
                         edgecolor='none', color='lightblue', alpha=0.6, line_kws={'lw': 3})
    ax[i].set_xlabel(col, fontsize=16)
    ax[i].set_ylabel('Count', fontsize=16)  # Y-axis label as "Count"
    ax[i].set_title(f'Distribution of {col}', fontsize=16)
    ax[i].grid(color='lightgrey')
    ax[i].set_ylim(0, global_ymax)  # Apply global y-axis limit

# Add a main title for the entire figure
plt.suptitle('Distribution of Continuous Variables (Count)', fontsize=20)  # Main title
plt.tight_layout()
plt.subplots_adjust(top=0.9)
plt.show()


# The distributions of the four continuous variables appear consistent with expectations for a dataset focused on Alzheimer’s risk. Age is evenly distributed across older adults, reflecting a well-represented aging population. Education level shows distinct spikes at common schooling milestones (e.g., 0, 9, 18 years), indicating clustering around formal education stages. BMI is nearly uniformly distributed between 18 and 35. Cognitive test scores are also relatively uniform but show subtle bimodal tendencies, possibly distinguishing individuals with strong cognitive function from those with cognitive decline. No significant anomalies are observed.

# ##### Categorical Variables

# In[10]:


# Determine the number of rows needed based on the number of categorical features
n_features = len(cat_features)
n_cols = 4  # Set 4 graphs in a row
n_rows = (n_features + n_cols - 1) // n_cols  # Calculate rows dynamically

# Set up the subplot for a dynamic layout
fig, ax = plt.subplots(nrows=n_rows, ncols=n_cols, figsize=(20, 5 * n_rows))
ax = ax.flatten()  # Flatten the axes array for easier indexing

# Loop to plot horizontal bar charts for each categorical feature
for i, col in enumerate(cat_features):
    # Calculate frequency percentages for the entire dataset
    counts = data[col].value_counts(normalize=True).mul(100).sort_index()
    
    # Plot horizontal bar chart
    counts.plot(kind='barh', ax=ax[i], color='lightblue', width=0.4)  # Single color for all bars
    
    # Add percentage annotations to the bars
    for bar in ax[i].containers[0]:
        width = bar.get_width()
        if width > 0:  # Only annotate bars with non-zero values
            ax[i].text(width + 1, bar.get_y() + bar.get_height() / 2, f'{width:.1f}%', 
                       va='center', ha='left', fontsize=10, color='black')

    # Set labels and title
    ax[i].set_ylabel(col, fontsize=12)
    ax[i].set_xlabel('Percentage', fontsize=12)
    ax[i].set_title(f'{col}', fontsize=14)
    ax[i].set_xlim([0, 100])
    ax[i].grid(axis='x', color='lightgrey', linestyle='--', linewidth=0.7)

# Turn off any unused axes
for j in range(len(cat_features), len(ax)):
    ax[j].axis('off')

# Adjust the space below the title
plt.suptitle('Distribution of Categorical Variables', fontsize=22)
plt.tight_layout()
plt.subplots_adjust(top=0.93)  # Reduce the top margin to make the space below the title smaller
plt.show()


# The distribution of categorical variables indicates that many features are relatively well-represented across their categories. On the other hand, certain features such as diabetes, genetic_risk_factor, and family_history show a clear concentration in one category. 

# #### Bivariate Analysis
# This section explores the relationships between pairs of variables, with a particular focus on how independent variables relate to the dependent variable—Alzheimer’s diagnosis. By identifying patterns and differences across groups, we aim to uncover variables that are more predictive and suitable for inclusion in the model.

# In[ ]:


warnings.filterwarnings('ignore')  # Suppress all warnings

# Set color palette
sns.set_palette(['#add8e6', '#ffcc99'])  # Light blue for No, Light orange for Yes

# Create the subplots
fig, ax = plt.subplots(len(con_features), 2, figsize=(15, 2.5 * len(con_features)), gridspec_kw={'width_ratios': [1, 2]})  # Reduced figure size

# Loop through each continuous feature to create barplots and KDE plots
for i, col in enumerate(con_features):
    # Barplot showing the mean value of the feature for each target category
    graph = sns.barplot(data=data, x="Alzheimer\'s Diagnosis", y=col, ax=ax[i, 0], palette=['#add8e6', '#ffcc99'])
    
    # KDE plot showing the distribution of the feature for each target category
    sns.kdeplot(data=data[data["Alzheimer\'s Diagnosis"] == 'No'], x=col, fill=True, linewidth=2, ax=ax[i, 1], label='No', color='#add8e6')
    sns.kdeplot(data=data[data["Alzheimer\'s Diagnosis"] == 'Yes'], x=col, fill=True, linewidth=2, ax=ax[i, 1], label='Yes', color='#ffcc99')
    ax[i, 1].set_yticks([])
    ax[i, 1].legend(title='Alzheimer\'s Diagnosis', loc='upper right')
    
    # Add mean values to the barplot
    for cont in graph.containers:
        graph.bar_label(cont, fmt='%.3g')

# Set the title for the entire figure
plt.suptitle('Distribution of Continuous Features Based on Diagnosis', fontsize=18)  # Reduced title font size
plt.tight_layout(rect=[0, 0, 1, 0.95])  # Adjust layout to fit the title
plt.show()


# The comparison of continuous variables by Alzheimer’s diagnosis reveals that age is the most distinguishing factor, with individuals diagnosed with Alzheimer’s averaging 78.8 years old compared to 68.1 for those without a diagnosis. This strong age difference is clearly reflected in the shifted density distribution and highlights age as a key risk factor. In contrast, education level and BMI show nearly identical averages and highly overlapping distributions between the two groups, suggesting minimal association with diagnosis status. Cognitive test scores also have similar means across groups, but the density plot reveals a slightly flatter and broader distribution for the diagnosed group, hinting at greater variability and possible subgroups. Overall, age emerges as the most predictive continuous feature, while the others may require further analysis to uncover meaningful patterns.

# In[12]:


# Filter out categorical features for the univariate analysis, excluding 'Alzheimer\'s Diagnosis'
cat_features = data.columns.difference(con_features).drop('Alzheimer\'s Diagnosis')
alz_yes_cat = data[data['Alzheimer\'s Diagnosis'] == 'Yes'][cat_features]
alz_no_cat = data[data['Alzheimer\'s Diagnosis'] == 'No'][cat_features]

# Determine the number of rows needed based on the number of categorical features
n_features = len(cat_features)
n_cols = 4  # Set 4 graphs in a row
n_rows = (n_features + n_cols - 1) // n_cols  # Calculate rows dynamically

# Set up the subplot for a dynamic layout
fig, ax = plt.subplots(nrows=n_rows, ncols=n_cols, figsize=(20, 5 * n_rows))
ax = ax.flatten()  # Flatten the axes array for easier indexing

# Loop to plot grouped horizontal bar charts for each categorical feature
for i, col in enumerate(cat_features):
    # Calculate frequency percentages for both groups
    yes_counts = alz_yes_cat[col].value_counts(normalize=True).mul(100).sort_index()
    no_counts = alz_no_cat[col].value_counts(normalize=True).mul(100).sort_index()
    
    # Align the indices of both groups
    all_categories = yes_counts.index.union(no_counts.index)
    yes_counts = yes_counts.reindex(all_categories, fill_value=0)
    no_counts = no_counts.reindex(all_categories, fill_value=0)
    
    # Create a DataFrame for plotting
    grouped_data = pd.DataFrame({'Yes': yes_counts, 'No': no_counts})
    
    # Plot grouped horizontal bar chart with thinner bars
    grouped_data.plot(kind='barh', ax=ax[i], color=['#ffcc99', '#add8e6'], width=0.6)  # Reduced width for thinner bars
    
    # Add percentage annotations to the bars
    for bar_group in ax[i].containers:
        for bar in bar_group:
            width = bar.get_width()
            if width > 0:  # Only annotate bars with non-zero values
                ax[i].text(width + 1, bar.get_y() + bar.get_height() / 2, f'{width:.1f}%', 
                           va='center', ha='left', fontsize=10, color='black')

    # Set labels and title
    ax[i].set_ylabel(col, fontsize=12)
    ax[i].set_xlabel('Percentage', fontsize=12)
    ax[i].set_title(f'{col}', fontsize=14)
    ax[i].set_xlim([0, 100])
    ax[i].grid(axis='x', color='lightgrey', linestyle='--', linewidth=0.7)

    # Remove the legend title
    ax[i].legend(title=None)

# Turn off any unused axes
for j in range(len(cat_features), len(ax)):
    ax[j].axis('off')

# Adjust the space below the title
plt.suptitle('Distribution of Categorical Variables Based on Diagnosis', fontsize=22)
plt.tight_layout()
plt.subplots_adjust(top=0.93)  # Reduce the top margin to make the space below the title smaller
plt.show()


# The graphs compare the distribution of categorical variables between individuals diagnosed with Alzheimer’s and those without. Several variables show noticeable differences between groups.
# 
# Notably, a higher percentage of individuals with Alzheimer’s report a genetic risk factor (30.4%) and a family history of Alzheimer’s (37.0%) compared to those without (12.8% and 25.7%, respectively), highlighting their potential predictive value. In contrast, variables such as demongraphic variables (e.g. gender, income_level, urban vs. rural living) and lifestyle variables (e.g. sleep_quality, stress_levels) appear similarly distributed across both groups, suggesting weaker associations with diagnosis. 
# 
# Overall, the analysis reveals that genetic and familial factors tend to differ more meaningfully between diagnosed and non-diagnosed individuals, indicating their relevance for further modeling or risk prediction.

# #### Correlation Analysis
# While the earlier bivariate analysis allowed for visual and group-based comparisons between individual variables and Alzheimer’s diagnosis, the correlation analysis provides a more systematic and quantitative assessment of these relationships. By measuring the strength and direction of associations, correlation analysis allows for clearer prioritization of potential predictors and highlights subtle but statistically meaningful patterns that may not be easily observed through bivariate plots alone.

# In[13]:


from scipy.stats import chi2_contingency


# Encode 'Alzheimer\'s Diagnosis' as a binary variable
data['Diagnosis_Binary'] = data['Alzheimer\'s Diagnosis'].map({'Yes': 1, 'No': 0})

# Select numerical columns for correlation
numerical_columns = con_features + ['Diagnosis_Binary']

# Compute the correlation matrix
correlation_matrix = data[numerical_columns].corr()

# Extract correlations with 'Diagnosis_Binary'
diagnosis_correlation = correlation_matrix.loc[:,['Diagnosis_Binary']].drop('Diagnosis_Binary')
diagnosis_correlation.rename(columns={'Diagnosis_Binary': 'Correlation'}, inplace=True)

# Define a function to calculate Cramér's V
def cramers_v(confusion_matrix):
    """Calculate Cramér's V statistic for categorical-categorical association."""
    chi2 = chi2_contingency(confusion_matrix)[0]
    n = confusion_matrix.sum()
    phi2 = chi2 / n
    r, k = confusion_matrix.shape
    return np.sqrt(phi2 / min(r - 1, k - 1))

# Compute Cramér's V for each categorical column
cat_features = data.select_dtypes(include=['object']).columns.drop('Alzheimer\'s Diagnosis')
categorical_correlations = {}
for col in cat_features:
    confusion_matrix = pd.crosstab(data[col], data['Alzheimer\'s Diagnosis'])
    categorical_correlations[col] = cramers_v(confusion_matrix.values)

# Combine numerical and categorical correlations into a single DataFrame
numerical_corr_df = pd.DataFrame(diagnosis_correlation, columns=['Correlation'])
numerical_corr_df['Type'] = 'Numerical'


categorical_corr_df = pd.DataFrame.from_dict(categorical_correlations, orient='index', columns=['Correlation'])
categorical_corr_df['Type'] = 'Categorical'

# Concatenate the two DataFrames
overall_correlation = pd.concat([numerical_corr_df, categorical_corr_df])

# Sort the correlations in descending order
overall_correlation = overall_correlation.sort_values(by='Correlation', ascending=False)

# Display the overall correlation ranking
print("Overall Correlation Ranking with Alzheimer's Diagnosis:")
print(overall_correlation)


# Although Pearson correlation and Cramér’s V measure different types of relationships, we included both in a unified comparison of association strength with Alzheimer’s diagnosis to prioritize potential predictors across variable types. Therefore, from the correlation analysis, we selected age, family_history, depression_level, sleep_quality, air_pollution_exposure, dietary_habits, physical_activity_level, social_engagement_level, alchohol_consumption, bmi as top 10 of the most predictive variables.

# ### Building Model
# 
# In this section, we used the top features identified from earlier correlation analyses as predictors to build a classification model for Alzheimer's diagnosis. 
# 
# We performed a train-test split and applied preprocessing steps including one-hot encoding for categorical features (dropping the first category to avoid multicollinearity) and standardization for numerical ones.
# 
# We then tested a range of classification models known for their effectiveness and interpretability in binary prediction tasks:
# - Random Forest
# - Logistic Regression
# - Decision Tree
# - Gradient Boosting
# - Extra Trees
# - AdaBoost
# - Linear Discriminant Analysis (LDA)
# 
# These models were selected to cover a variety of algorithmic approaches and to allow feature importance or coefficient interpretation. Performance was evaluated primarily using recall to prioritize minimizing false negatives, with accuracy also tracked for reference.

# #### Get Data from the Database

# In[14]:


train_data = pd.read_csv('Data/training_dataset.csv')
test_data = pd.read_csv('Data/testing_dataset.csv')
print(train_data.head())
print(test_data.head())


# In[15]:


train_data.columns


# In[16]:


# set features and target columns
features = ['genetic_risk_factor', 'family_history', 'depression_level', 'sleep_quality', 'air_pollution_exposure', 'dietary_habits', 'physical_activity_level', 'social_engagement_level', 'alcohol_consumption', 'age' ] #'cognitive_test_score'
target = 'alzheimers_diagnosis'


# In[17]:


# load training and testing data
x_train = train_data[features]
y_train = train_data[target].map({'No': 0, 'Yes': 1})
x_test = test_data[features]
y_test = test_data[target].map({'No': 0, 'Yes': 1})


# In[18]:


# check the data type for each column
train_data.info()


# #### Train and Test the Model

# In[ ]:


# categorize features based on data types
categorical = ['genetic_risk_factor', 'family_history', 'depression_level', 'sleep_quality', 'air_pollution_exposure', 'dietary_habits', 'physical_activity_level', 'social_engagement_level', 'alcohol_consumption']
numerical = ['age'] 

# set preprocessor for preprocessing the features
preprocessor = ColumnTransformer(
    transformers=[
        ('cat', OneHotEncoder(drop='first', handle_unknown='ignore'), categorical),
        ('num', StandardScaler(), numerical)
    ]
)

# remove SVM, Naive Bayes, KNN for not supporting feature importance or coefficients.
models = {
    'Random Forest': RandomForestClassifier(class_weight='balanced',random_state=33),
    'Logistic Regression': LogisticRegression(class_weight='balanced',max_iter=1000),
    'Decision Tree': DecisionTreeClassifier(class_weight='balanced',random_state=33),
    'Gradient Boosting': GradientBoostingClassifier(random_state=33),
    'Extra Trees': ExtraTreesClassifier(random_state=33),
    'AdaBoost': AdaBoostClassifier(random_state=33, algorithm='SAMME',  ),
    'LDA': LinearDiscriminantAnalysis()
}

# train and test each model, and print out their performance for comparison
for name, model in models.items():
    pipeline = Pipeline(steps=[
        ('preprocessor', preprocessor),
        ('model', model)
    ])
    
    pipeline.fit(x_train, y_train)
    y_pred = pipeline.predict(x_test)
    acc = accuracy_score(y_test, y_pred)
    rec = recall_score(y_test, y_pred) 
    print(f"🔍 {name} Accuracy: {acc:.3f}")
    print(f"\n🧠 {name} Recall: {rec:.3f}")
    print(classification_report(y_test, y_pred))


# In[ ]:


# perform grid search to search for parameters that yield the best outcomes
best_model = None
best_model_name = ''
best_recall = 0.0

param_grids = {
    'Random Forest': {
        'model__n_estimators': [100, 200],
        'model__max_depth': [None, 10, 20]
    },
    'Logistic Regression': {
        'model__C': [0.01, 0.1, 1.0, 10],
        'model__penalty': ['l2'],
        'model__solver': ['lbfgs'],
        'model__max_iter': [1000]
    },
    'Decision Tree': {
        'model__max_depth': [None, 10, 20],
        'model__min_samples_split': [2, 5]
    }, # No hyperparameters to tune here
    'Gradient Boosting': {
        'model__n_estimators': [100, 200],
        'model__learning_rate': [0.05, 0.1],
        'model__max_depth': [3, 5]
    },
    'Extra Trees': {
        'model__n_estimators': [100, 200],
        'model__max_depth': [None, 10, 20]
    },
    'AdaBoost': {
        'model__n_estimators': [50, 100],
        'model__learning_rate': [0.5, 1.0]
    },
    'LDA': {}  # Minimal tuning available
}

results = {}

for name, model in models.items():
    pipeline = Pipeline(steps=[
        ('preprocessor', preprocessor),
        ('model', model)
    ])
    
    grid = GridSearchCV(pipeline, param_grids[name], cv = 5, n_jobs=-1)
    grid.fit(x_train, y_train)
    y_pred = grid.predict(x_test)
    
    acc = accuracy_score(y_test, y_pred)
    rec = recall_score(y_test, y_pred)
    if rec > best_recall:
        best_recall = rec
        best_model = pipeline
        best_model_name = name
    # print(f"🔍 {name} Best Params: {grid.best_params_}")
    # #print(f"✅ {name} Accuracy: {acc:.3f}")
    # print(f"🧠 {name} Recall: {rec:.3f}")
    # print(classification_report(y_test, y_pred))
    
    results[name] = {'accuracy': acc, 'recall': rec}

print(f"\n🏆 Best model based on recall: {best_model_name} (Recall: {best_recall:.3f})")


# In[49]:


# Dump the model
# import joblib
# joblib.dump(best_model, 'model.pkl')


# In[53]:


# print(sample_f)


# In[56]:


# testing model response
# load_model = joblib.load('model.pkl')
# prediction = load_model.predict_proba(sample_f)[0, 1]
# print(prediction)


# #### Feature Importance

# In[21]:


model = best_model.named_steps['model']
feature_importance_results = {}
if hasattr(model, 'feature_importances_'):  # Tree-based models
    feature_importances = model.feature_importances_
    feature_names = preprocessor.named_transformers_['cat'].get_feature_names_out(categorical).tolist() + numerical
    feature_importance_df = pd.DataFrame({'Feature': feature_names, 'Importance': feature_importances})
    feature_importance_df = feature_importance_df.sort_values(by='Importance', ascending=False)
    feature_importance_results[best_model_name] = feature_importance_df
    print(f"\n🌲 {best_model_name} Feature Importance:")
    print(feature_importance_df)

elif hasattr(model, 'coef_'):  # Linear models
    coefficients = model.coef_[0]
    feature_names = preprocessor.named_transformers_['cat'].get_feature_names_out(categorical).tolist() + numerical
    feature_importance_df = pd.DataFrame({'Feature': feature_names, 'Coefficient': coefficients})
    feature_importance_df = feature_importance_df.sort_values(by='Coefficient', key=abs, ascending=False)
    feature_importance_results[best_model_name] = feature_importance_df
    print(f"\n🧠 {best_model_name} Coefficients:")
    print(feature_importance_df)

else:
    print(f"\n⚠️ {best_model_name} does not support feature importance or coefficients.")


# #### Compare Patients Predicted with / without Alzheimer's

# In[22]:


# Drop unwanted columns
result_df = test_data.drop(columns=['Unnamed: 0', 'country'])

# Rename the target column to 'actual' and map 'Yes'/'No' to 1/0
result_df = result_df.rename(columns={'alzheimers_diagnosis': 'actual'})
result_df['actual'] = result_df['actual'].map({'No': 0, 'Yes': 1})

# Add predictions
result_df['predicted'] = y_pred
likely_patients = result_df[result_df['predicted'] == 1]
unlikely_patients = result_df[result_df['predicted'] == 0]


# In[23]:


comparison_numeric = pd.DataFrame({
    'Likely (mean)': likely_patients[con_features].mean(),
    'Unlikely (mean)': unlikely_patients[con_features].mean()
})
print(comparison_numeric)


# In[24]:


# Set up the subplot layout
n = len(con_features)
rows = (n + 1) // 2  # calculate number of rows needed for 2 columns
fig, axes = plt.subplots(rows, 2, figsize=(12, 4 * rows))

# Flatten axes for easier iteration
axes = axes.flatten()

for i, col in enumerate(con_features):
    ax = axes[i]
    sns.kdeplot(data=likely_patients, x=col, fill=True, label='Likely', color='lightsalmon', ax=ax)
    sns.kdeplot(data=unlikely_patients, x=col, fill=True, label='Unlikely', color='lightblue', ax=ax)
    ax.set_title(f'Distribution of {col}')
    ax.legend()

# Hide any unused subplots
for j in range(i + 1, len(axes)):
    axes[j].set_visible(False)

plt.tight_layout()
plt.show()


# In[25]:


import matplotlib.pyplot as plt

cols = 2
rows = (len(cat_features) + 1) // cols
fig, axes = plt.subplots(rows, cols, figsize=(14, 4 * rows))
axes = axes.flatten()

for i, col in enumerate(cat_features):
    # 各群組中分類的比例
    cat_counts = pd.crosstab(result_df['predicted'], result_df[col], normalize='index')

    # 繪圖
    cat_counts.T.plot(kind='bar', ax=axes[i], rot=0, color=['lightblue', 'lightsalmon'], alpha = 0.9)

    axes[i].set_title(f'{col} Proportion within Prediction Groups')
    axes[i].set_xlabel(col)
    axes[i].set_ylabel('Proportion')
    axes[i].legend(title='Predicted', labels=['Unlikely', 'Likely'])

# 隱藏多餘圖框
for j in range(i + 1, len(axes)):
    axes[j].set_visible(False)

plt.tight_layout()
plt.show()


# In[26]:


# selected features: age, genetic_risk_factor, family_history, depression_level, sleep_quality, air_pollution_exposure, dietary_habits, physical_activity_level, social_engagement_level, alchohol_consumption


# ### Sensitivity Analysis
# 
# In this section, we examined how sensitive the model's prediction is to changes in individual input features. By modifying one variable at a time for a specific patient, we aim to evaluate the robustness of the model and understand which features have the most influence on the prediction outcome. This analysis helps validate the model’s behavior and informs which factors may be critical to monitor or modify in real-world scenarios.

# In[27]:


sen_data = pd.read_csv('Data/demo_dataset.csv')
sen_data.head()


# #### Case: Patient 1

# In[28]:


sample = sen_data.sample(1, random_state=35)
sample_f = sample[features]
sample_f


# In[29]:


sample


# In[30]:


print(best_model)


# In[31]:


best_model.predict_proba(sample_f)  # show baseline probability


# In[32]:


import shap

# Step 1: Separate model and preprocessor from your best pipeline
model_only = best_model.named_steps['model']
preprocessor_only = best_model.named_steps['preprocessor']

# Step 2: Preprocess your sample and training data
x_train_transformed = preprocessor_only.transform(x_train)
sample_transformed = preprocessor_only.transform(sample_f)

# 取得經過 one-hot encoding 後的欄位名稱
feature_names = preprocessor_only.get_feature_names_out()

# 再指定 feature_names 給 explainer
explainer = shap.Explainer(model_only, x_train_transformed, feature_names=feature_names)

# 再重新計算 shap_values
shap_values = explainer(sample_transformed)

# 畫出 waterfall 圖
shap.plots.waterfall(shap_values[0], max_display=6) #, max_display=6


# In[33]:


from tabulate import tabulate

def explain_alzheimers_risk(shap_values, feature_names, top_n=5):
    shap_array = shap_values[0].values
    feature_contributions = list(zip(feature_names, shap_array))
    top_features = sorted(feature_contributions, key=lambda x: abs(x[1]), reverse=True)[:top_n]

    advice_dict = {
        'num__age': "Age is non-modifiable. Focus on healthy habits like physical activity and brain games.",
        'num__cognitive_test_score': "Engage in cognitive training or mentally stimulating activities.",
        'cat__family_history_Yes': "Family history increases risk. Consider regular screening and counseling.",
        'cat__genetic_risk_factor_Yes': "Genetic risk is fixed. Focus on controllable lifestyle factors.",
        'cat__social_engagement_level_Low': "Increase interaction: join clubs, call friends, or volunteer.",
        'cat__dietary_habits_Unhealthy': "Improve diet: follow Mediterranean or MIND diet.",
        'cat__physical_activity_level_Low': "Incorporate regular physical exercise, even light walking.",
        'cat__sleep_quality_Poor': "Improve sleep hygiene: fixed schedule, reduce screen use before bed.",
        'cat__air_pollution_exposure_Medium': "Stay indoors on polluted days, use air purifiers at home."
    }

    table = []
    for feature, shap_val in top_features:
        direction = "🔺 Increased risk" if shap_val > 0 else "🔻 Decreased risk"
    
        if shap_val > 0:  # Show advice only for increased risk
            advice = advice_dict.get(feature, "No specific advice available.")
        else:
            advice = "Patient is good here!"  # Leave it blank for decreased risk

        table.append([
            feature.replace('num_', '').replace('cat_', ''),
            direction,
            f"{shap_val:.2f}",
            advice
        ])

    print(tabulate(table, headers=["Feature", "Impact", "SHAP Value", "Recommended Action"], tablefmt="github"))

explain_alzheimers_risk(shap_values, feature_names)


# In[34]:


log_odds = explainer.expected_value + shap_values.values[0].sum()
prob = 1 / (1 + np.exp(-log_odds))
print(f"Risk of Getting Alzheimer's: {prob:.3f}")

if prob <= 0.3:
    print("Low risk of Alzheimer's.")
elif prob <= 0.7:
    print("Moderate risk of Alzheimer's.")
else:
    print("High risk of Alzheimer's.")


# In[35]:


def simulate_single_feature_improvement(pipeline, sample_row, feature_changes):
    original_prob = pipeline.predict_proba(sample_row)[0][1]
    original_pred = pipeline.predict(sample_row)[0]
    results = []

    for feature, changes in feature_changes.items():
        for from_val, to_val in changes:
            if sample_row[feature].iloc[0] == from_val:
                modified = sample_row.copy()
                modified.at[sample_row.index[0], feature] = to_val

                new_prob = pipeline.predict_proba(modified)[0][1]
                new_pred = pipeline.predict(modified)[0]

                results.append({
                    'Changed Feature': feature,
                    'From': from_val,
                    'To': to_val,
                    'Original Probability': round(original_prob, 4),
                    'New Probability': round(new_prob, 4),
                    'Difference': round(new_prob - original_prob, 4),
                    'Prediction Changed': new_pred != original_pred
                })

    return pd.DataFrame(results)



label_encodings = {
    'genetic_risk_factor': [('No', 'Yes'), ('Yes', 'No')],
    'family_history': [('No', 'Yes'), ('Yes', 'No')],
    'depression_level': [
        ('Medium', 'Low'), ('Medium', 'High'),
        ('Low', 'High'), ('Low', 'Medium'),
        ('High', 'Low'), ('High', 'Medium')
    ],
    'sleep_quality': [
        ('Average', 'Good'), ('Average', 'Poor'),
        ('Good', 'Average'), ('Good', 'Poor'),
        ('Poor', 'Good'), ('Poor', 'Average')
    ],
    'air_pollution_exposure': [
        ('Medium', 'Low'), ('Medium', 'High'),
        ('Low', 'Medium'), ('Low', 'High'),
        ('High', 'Low'), ('High', 'Medium')
    ],
    'dietary_habits': [
        ('Unhealthy', 'Healthy'), ('Unhealthy', 'Average'),
        ('Average', 'Healthy'), ('Average', 'Unhealthy'),
        ('Healthy', 'Unhealthy'), ('Healthy', 'Average')
    ],
    'physical_activity_level': [
        ('Medium', 'High'), ('Medium', 'Low'),
        ('Low', 'High'), ('Low', 'Medium'),
        ('High', 'Low'), ('High', 'Medium')
    ],
    'social_engagement_level': [
        ('Low', 'High'), ('Low', 'Medium'),
        ('Medium', 'High'), ('Medium', 'Low'),
        ('High', 'Low'), ('High', 'Medium')
    ],
    'alcohol_consumption': [
        ('Never', 'Occasionally'), ('Never', 'Regularly'),
        ('Regularly', 'Occasionally'), ('Regularly', 'Never'),
        ('Occasionally', 'Never'), ('Occasionally', 'Regularly')
    ]
}


simulate_single_feature_improvement(best_model, sample_f.iloc[[0]], label_encodings)


# #### Case: Patient 2

# In[36]:


sample2 = sen_data.sample(1, random_state=65)
sample_f2 = sample2[features]
sample_f2


# In[37]:


sample2


# In[38]:


best_model.predict_proba(sample_f2) # (0,0)


# In[39]:


# Shap values for the second sample
sample_transformed2 = preprocessor_only.transform(sample_f2)
explainer2 = shap.Explainer(model_only, x_train_transformed, feature_names=feature_names)
shap_values2 = explainer(sample_transformed2)
shap.plots.waterfall(shap_values2[0], max_display=6) #, max_display=6


# In[40]:


explain_alzheimers_risk(shap_values2, feature_names)


# In[41]:


sample_f2


# In[42]:


print("The original probability of getting Alzheimer's is: ", best_model.predict_proba(sample_f2)[0][1])
sample_f2_sen_age = sample_f2.copy()
sample_f2_sen_age['age'] = 78
print("The probability of getting Alzheimer's after changing age to 79 is: ", best_model.predict_proba(sample_f2_sen_age)[0][1])
# If age is mistyped as 79 (nearly 30% overstatement), the model will predict the patient as likely to have Alzheimer's.
# A change from 61 to 79 is substantial, not a small perturbation. If it shifts the prediction from unlikely to likely, it doesn’t necessarily mean the model is too sensitive — it could simply mean the model is behaving appropriately by assigning higher risk to much older individuals.


# In[43]:


print("The original probability of getting Alzheimer's is: ", best_model.predict_proba(sample_f2)[0][1])
sample_f2_sen_gen = sample_f2.copy()
sample_f2_sen_gen['genetic_risk_factor'] = 'Yes'
print("The probability of getting Alzheimer's after changing genetic_risk_factor to Yes: ", best_model.predict_proba(sample_f2_sen_gen)[0][1])


# In[44]:


sample_f2_sen_gen


# In[45]:


simulate_single_feature_improvement(best_model, sample_f2.iloc[[0]], label_encodings)


# In[61]:


import psycopg2
db = pd.DataFrame()
# Connect to your PostgreSQL database
conn = psycopg2.connect(
    dbname="HIS_FinalProject",
    user="dadb",
    password="",
    host="localhost",    # or IP if remote
    port="5432"          # default port
)

# Create a cursor to execute queries
cur = conn.cursor()

# Example query
cur.execute("SELECT * FROM Patient JOIN VISIT USING (patient_id) JOIN PatientTest USING (visit_id) JOIN Diagnosis USING (visit_id) JOIN Lifestyle USING (visit_id);")
db = cur.fetchall()

# Always close connections!
cur.close()
conn.close()

type(db)


# In[62]:


conn = psycopg2.connect(
    dbname="HIS_FinalProject",
    user="dadb",
    password="",
    host="localhost",
    port="5432"
)

# --- Read tables one by one ---
patient = pd.read_sql("SELECT * FROM Patient", conn)
visit = pd.read_sql("SELECT * FROM Visit", conn)
patient_test = pd.read_sql("SELECT * FROM PatientTest", conn)
diagnosis = pd.read_sql("SELECT * FROM Diagnosis", conn)
lifestyle = pd.read_sql("SELECT * FROM Lifestyle", conn)

# --- Merge step-by-step using keys ---
df = patient.merge(visit, on='patient_id', suffixes=('', '_visit'))
df = df.merge(patient_test, on='visit_id', suffixes=('', '_test'))
df = df.merge(diagnosis, on='visit_id', suffixes=('', '_dx'))
df = df.merge(lifestyle, on='visit_id', suffixes=('', '_life'))

# --- Done ---
conn.close()


# In[81]:


df


# In[82]:


patient_df


# In[83]:


# Merge on patient_id
merged_df = df.merge(patient_df, on='patient_id', how='left')
merged_df


# 
