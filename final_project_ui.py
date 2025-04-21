
# To run the UI please open git bach and use this command line
# % streamlit run final_project_ui.py

import streamlit as st

# Page setup
st.set_page_config(
    page_title="Alzheimer's Risk Assessment and Diagnosis Decision Support Tool",
    layout="centered"
)

st.title("Alzheimer's Risk Assessment and Diagnosis Decision Support Tool")

st.markdown("This tool collects lifestyle and risk factors to assist in evaluating cognitive health and potential alzheimer's risk.")
st.markdown("---")

# --- Patient Demographics ---
st.header("Patient Profile (General)")

name = st.text_input("Patient Name")
age = st.number_input("Age (years)", min_value=18, max_value=120, step=1)
sex = st.radio("Sex", options=["Male", "Female", "Other"])
bmi = st.number_input("BMI (Body Mass Index)", min_value=10.0, max_value=60.0, step=0.1, format="%.1f")

st.header("Patient Profile (Demographic)")
education = st.slider("Education Level", min_value=0, max_value=20, step=1)
income_level = st.radio("Income Level", options=["Low", "Medium", "High"])
employment_status = st.radio("Employment Status", ["Employed", "Unemployed", "Retired"])
marital_status = st.radio("Marital Status", ["Single", "Married", "Widowed"])
urban_rural = st.radio("Living Environment", ["Urban", "Rural"])

st.header("Patient Profile (Medical and Genetic History)")
diabetes = st.radio("Diagnosed with Diabetes?", ["No", "Yes"])
hypertension = st.radio("Diagnosed with Hypertension?", ["No", "Yes"])
cholesterol = st.radio("Cholesterol Level", ["Normal", "High"])
genetic_risk = st.radio("Genetic Risk Factor (APOE-ε4 allele)", ["No", "Yes", "Unknown"])
family_history = st.radio("Family History of Alzheimer’s?", ["No", "Yes", "Unknown"])


# --- Lifestyle and Environmental Factors ---
st.header("Patient Profile (Lifestyle & Environmental Factors)")
smoking_status = st.radio("Smoking Status", ["Never", "Former", "Current"])
alcohol_consumption = st.radio("Alcohol Consumption", ["Never", "Occasionally", "Regularly"])
physical_activity = st.radio("Physical Activity Level", ["Low", "Medium", "High"])
dietary_habits = st.radio("Dietary Habits", ["Average", "Healthy", "Unhealthy"])
sleep_quality = st.radio("Sleep Quality", ["Average", "Good", "Poor"])
stress_levels = st.radio("Stress Level", ["Low", "Medium", "High"])
depression_level = st.radio("Depression Level", ["Low", "Medium", "High"])
air_pollution = st.radio("Air Pollution Exposure", ["Low", "Medium", "High", "Not Sure"])
social_engagement = st.radio("Social Engagement Level", ["Low", "Medium", "High"])


# model_inference.py

import joblib
import numpy as np

# Load model and scaler
model = joblib.load("rf_model.pkl")
scaler = joblib.load("scaler.pkl")

# Define prediction function
def predict_risk_from_inputs(raw_input):
    """
    Takes raw user input (list of features) and returns model prediction and probability.
    """
    # Convert to NumPy array
    input_array = np.array([raw_input])

    # Scale the appropriate columns (assumes same index order as during training)
    # E.g., Age (0), BMI (1), Cognitive Test Score (2)
    input_array[:, [0, 1, 2]] = scaler.transform(input_array[:, [0, 1, 2]])

    prediction = model.predict(input_array)[0]
    probability = model.predict_proba(input_array)[0][1]

    return prediction, probability


# --- Submit and Dummy Evaluation ---
if st.button("Assess Cognitive Health Risk"):
    st.subheader("📋 Preliminary Risk Insights")
    predict_risk_from_inputs([age, genetic_risk, family_history, depression_level, sleep_quality, air_pollution, dietary_habits, physical_activity, social_engagement, alcohol_consumption])

st.markdown("---")
st.markdown("*This tool provides preliminary insight on a patient's potential risk of Alzheimer's and is not a clinical diagnosis.*")

# Sidebar
st.sidebar.title("About")
st.sidebar.info("""This is an Alzheimer's Diagnosis Decision Support System prototype. 
                While this tool can be used to provide a preliminary insight on a patient's 
                potential risk of Alzheimer's, it is not a clinical diagnosis.""")
