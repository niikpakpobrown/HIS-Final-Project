
# To run the UI please open git bash and use this command line
# % streamlit run final_project_ui.py
import streamlit as st
import pandas as pd
import datetime

# Page setup
st.set_page_config(
    page_title="Alzheimer's Risk Assessment and Diagnosis Decision Support Tool",
    layout="centered")

def run_app():
    st.title("Alzheimer's Risk Assessment and Diagnosis Decision Support Tool")

    st.markdown("This tool collects lifestyle and risk factors to assist in evaluating cognitive health and potential alzheimer's risk.")
    st.markdown("---")
    # --- Patient Demographics ---
    st.header("Patient Profile (General)")
    
    assessment_date = st.date_input("Date of Assessment")
    name = st.text_input("Patient Name")
    birthdate = st.date_input("Date of Birth", min_value=datetime.date(1900, 1, 1), max_value=datetime.date.today())
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
    genetic_risk = st.radio("Genetic Risk Factor (APOE-ε4 allele)", ["No", "Yes"])
    family_history = st.radio("Family History of Alzheimer’s?", ["No", "Yes"])
    cognitive_test = st.slider("Cognitive Test Score", min_value=0, max_value=100, step=1)
    
    
    # --- Lifestyle and Environmental Factors ---
    st.header("Patient Profile (Lifestyle & Environmental Factors)")
    smoking_status = st.radio("Smoking Status", ["Never", "Former", "Current"])
    alcohol_consumption = st.radio("Alcohol Consumption", ["Never", "Occasionally", "Regularly"])
    physical_activity = st.radio("Physical Activity Level", ["Low", "Medium", "High"])
    dietary_habits = st.radio("Dietary Habits", ["Average", "Healthy", "Unhealthy"])
    sleep_quality = st.radio("Sleep Quality", ["Average", "Good", "Poor"])
    stress_levels = st.radio("Stress Level", ["Low", "Medium", "High"])
    depression_level = st.radio("Depression Level", ["Low", "Medium", "High"])
    air_pollution = st.radio("Air Pollution Exposure", ["Low", "Medium", "High"])
    social_engagement = st.radio("Social Engagement Level", ["Low", "Medium", "High"])
    
    #For generating patient ID
    import hashlib
    
    def get_patient_id(name, birthdate, df):
        # Generate a hash from name + birthdate
        unique_str = f"{name.strip().lower()}_{birthdate.isoformat()}"
        generated_id = hashlib.sha256(unique_str.encode()).hexdigest()[:8]  # short ID
        
        # Check if patient already exists
        if "patient_id" in df.columns:
            matches = df[(df["name"].str.lower() == name.strip().lower()) & 
                         (df["birthdate"] == birthdate.isoformat())]
            if not matches.empty:
                return matches.iloc[0]["patient_id"]
        
        return generated_id
    
    input_dict = {
            "age": age,
            "gender": sex,
            "education_level": education,
            "bmi": bmi,
            "physical_activity_level": physical_activity,
            "smoking_status": smoking_status,
            "alcohol_consumption": alcohol_consumption,
            "diabetes": diabetes,
            "hypertension": hypertension,
            "cholesterol_level": cholesterol,
            "family_history": family_history,
            "cognitive_test_score": cognitive_test,
            "depression_level": depression_level,
            "sleep_quality": sleep_quality,
            "dietary_habits": dietary_habits,
            "air_pollution_exposure": air_pollution,
            "employment_status": employment_status,
            "marital_status": marital_status,
            "genetic_risk_factor": genetic_risk,
            "social_engagement_level": social_engagement,
            "income_level": income_level,
            "stress_levels": stress_levels,
            "urban_vs_rural_living": urban_rural
        }
    
    userinput = pd.DataFrame([input_dict])
    
    # model_inference.py - none of this works!!!!
    
    import joblib
    
    # Load model and scaler
    model = joblib.load("C:/Users/ashna/OneDrive/Desktop/Health Information Systems/model.pkl")
    #scaler = joblib.load("scaler.pkl")
    
    # Define prediction function
    def show_risk_level(model, userinput):
        
        prediction = model.predict(userinput)[0]
        probability = model.predict_proba(userinput)[0][1]
        # st.success(f"✅ Predicted Diagnosis: *{prediction}*")
        # st.info(f"🧪 Probability of Alzheimer's: *{probability:.2f}*")
        
       # Add date, prediction, and probability to the input data
        userinput["assessment_date"] = assessment_date
        userinput["prediction"] = "High Risk" if prediction else "Low Risk"
        userinput["probability"] = round(probability, 2)
       
        # Determine risk level and style
        if probability <= 0.3:
            risk_level = "🟢  Low Risk"
            bg_color = "#d4edda"  # light green
            text_color = "#155724"
        elif probability <= 0.7:
            risk_level = "🟡  Moderate Risk"
            bg_color = "#fff3cd"  # light yellow
            text_color = "#856404"
        else:
            risk_level = "🔴  High Risk"
            bg_color = "#f8d7da"  # light red
            text_color = "#721c24"
    
        # Styled colored card using markdown + HTML
        st.markdown(f"""
        <div style='background-color:{bg_color}; color:{text_color}; padding: 1.2rem 1.5rem; border-radius: 8px; border-left: 6px solid {text_color}; font-weight: bold; font-size: 1.1rem; margin-top: 1rem;'>
            {risk_level} of Alzheimer's Based on Predicted Probability {round(probability,2)}
        </div>
        """, unsafe_allow_html=True)
        
        # Save to CSV
        save_path = "assessment_results.csv"
        try:
            df_existing = pd.read_csv(save_path)
        except FileNotFoundError:
            df_existing = pd.DataFrame()
        
        # Assign Patient ID
        patient_id = get_patient_id(name, birthdate, df_existing)
        
        # 🔢 Add tracking info to user input
        userinput["patient_id"] = patient_id
        userinput["name"] = name
        userinput["birthdate"] = birthdate.isoformat()
        userinput["assessment_date"] = assessment_date
        userinput["prediction"] = "High Risk" if prediction else "Low Risk"
        userinput["probability"] = round(probability, 2)
        
        # Save updated assessment
        full_df = pd.concat([df_existing, userinput], ignore_index=True)
        full_df.to_csv(save_path, index=False)
        st.success("Assessment saved. Patient ID: " + patient_id)
        
        patient_history = full_df[full_df["patient_id"] == patient_id]
    
        if not patient_history.empty:
            st.subheader(f"Assessment History for {name}")

            # Ensure datetime format
            patient_history["assessment_date"] = pd.to_datetime(patient_history["assessment_date"], errors="coerce").dt.date
    
            # Plot risk score over time
            import altair as alt

            chart = alt.Chart(patient_history).mark_line(point=True).encode(
                x=alt.X('assessment_date:T', title='Assessment Date'),
                y=alt.Y('probability:Q', title='Probability'),
                tooltip=['assessment_date:T', 'probability:Q']).properties(title="Alzheimer's Risk Probability Over Time")
            st.altair_chart(chart, use_container_width=True)
       
            # Clean up display
            st.dataframe( patient_history[["assessment_date", "prediction", "probability"]]
                         .sort_values(by="assessment_date", ascending=False))
        else:
            st.info("No previous assessments found for this patient.")
    
    
    # --- Submit and Evaluate ---
    if st.button("Assess Cognitive Health Risk"):
        st.subheader("Preliminary Risk Insights")
        
        # Call the prediction function
        show_risk_level(model, userinput)
        
    st.markdown("---")
    st.markdown("*This tool provides preliminary insight on a patient's potential risk of Alzheimer's and is not a clinical diagnosis.*")
    
    # Sidebar information
    st.sidebar.title("About")
    st.sidebar.info("""This is an Alzheimer's Diagnosis Decision Support System prototype. 
                    While this tool can be used to provide a preliminary insight on a patient's 
                    potential risk of Alzheimer's, it is not a clinical diagnosis.""")
                
                    
# --- Authentication flow ---
USERNAME = "clinician"
PASSWORD = "secure123"

if "logged_in" not in st.session_state:
    st.session_state.logged_in = False

if not st.session_state.logged_in:
    st.title("Login Required")

    username_input = st.text_input("Username")
    password_input = st.text_input("Password", type="password")

    if st.button("Login"):
        if username_input == USERNAME and password_input == PASSWORD:
            st.session_state.logged_in = True
            st.rerun()
        else:
            st.error("Incorrect username or password")

else:
    run_app()