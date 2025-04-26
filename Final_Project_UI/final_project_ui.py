
# To run the UI please open git bash and use this command line
# % streamlit run final_project_ui.py
import streamlit as st
from streamlit_option_menu import option_menu
import pandas as pd
import datetime
import altair as alt
import matplotlib.pyplot as plt
import seaborn as sns
import psycopg2
from psycopg2 import sql

# Page setup
st.set_page_config(
    page_title="Alzheimer's Risk Assessment and Diagnosis Decision Support Tool",
    layout="centered")

# Sidebar information
st.sidebar.title("About")
st.sidebar.info("""This is an Alzheimer's Diagnosis Decision Support System prototype. 
                While this tool can be used to provide a preliminary insight on a patient's 
                potential risk of Alzheimer's, it is not a clinical diagnosis.""")

if "user_type" not in st.session_state:
    menu = st.radio("Select Mode", ["Clinician Dashboard", "Patient Portal"])
    st.session_state.menu_selection = menu
else:
    menu = st.session_state.user_type

def insert_into_database(df):
    try:
        conn = psycopg2.connect(
            dbname="HIS_FinalProject",
            user="dadb",
            password="",
            host="localhost",    # or IP if remote
            port="5432"          # default port
        )
        cursor = conn.cursor()

        record = df.iloc[0].to_dict()
        columns = record.keys()
        values = [record[col] for col in columns]

        insert_query = sql.SQL("""
            INSERT INTO newpatients ({fields}) 
            VALUES ({placeholders})
            ON CONFLICT (patient_id, assessment_date) DO NOTHING;
        """).format(
            fields=sql.SQL(', ').join(map(sql.Identifier, columns)),
            placeholders=sql.SQL(', ').join(sql.Placeholder() * len(columns))
        )

        cursor.execute(insert_query, values)
        conn.commit()
        cursor.close()
        conn.close()
        st.success("✅ Data saved to database.")
    except Exception as e:
        st.error(f"❌ Database insertion failed: {e}")

def get_patient():
    conn = psycopg2.connect(
        dbname="HIS_FinalProject",
        user="dadb",
        password="",
        host="localhost",    # or IP if remote
        port="5432"          # default port
    )

    query = "SELECT * FROM newpatients;"
    df = pd.read_sql(query, conn)
    conn.close()
    st.session_state.patient_df = df
    return df

def assessment_page():
    st.title("Alzheimer's Risk Assessment and Diagnosis Decision Support Tool")

    st.markdown("This tool collects lifestyle and risk factors to assist in evaluating cognitive health and potential alzheimer's risk.")
    st.markdown("---")
    # --- Patient Demographics ---
    st.header("Patient Profile (General)")
    
    name = st.text_input("Patient Name")
    birthdate = st.date_input("Date of Birth", min_value=datetime.date(1900, 1, 1), max_value=datetime.date.today())
    if birthdate:
        today = datetime.date.today()
        age = today.year - birthdate.year - ((today.month, today.day) < (birthdate.month, birthdate.day))
        st.number_input("Age (years)", value=age, disabled=True)
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
            matches = df[(df["name"].astype(str).str.lower() == name.strip().lower()) &
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
    
    recommendations_data = [
    {
        "feature": "_age",
        "condition": lambda x: x > 65,
        "recommendation": "Given the patient’s advanced age, schedule routine cognitive assessments annually. Reinforce preventive care and encourage cognitive enrichment activities."
    },
    {
        "feature": "_genetic_risk_factor_Yes",
        "condition": lambda x: x == "Yes",
        "recommendation": "Patient carries the APOE-ε4 allele. Recommend close monitoring, and emphasize aggressive management of modifiable risk factors."
    },
    {
        "feature": "_family_history_Yes",
        "condition": lambda x: x == "Yes",
        "recommendation": "Patient has family history. Recommend initiating baseline cognitive screening and documenting lifestyle risk factors for longitudinal tracking."
    },
    {
        "feature": "_social_engagement_level_Low",
        "condition": lambda x: x == "Low",
        "recommendation": "Patient has low social engagement. Counsel the patient on the importance of regular social interaction; consider referring to community programs or support groups."
    },
    {
        "feature": "_air_pollution_exposure_Medium",
        "condition": lambda x: x == "Medium",
        "recommendation": "Moderate exposure to air pollution noted. Educate on minimizing exposure during high AQI days and suggest in-home air purification if feasible."
    }
]

    recommendations_df = pd.DataFrame(recommendations_data)
    
# Running the prediction model    
    import joblib
    
    # Load model and scaler
    model = joblib.load("Final_Project_UI/model.pkl")
    #scaler = joblib.load("scaler.pkl")
    
    # Define prediction function
    def show_risk_level(model, userinput, name, birthdate, assessment_date):
        
        prediction = model.predict(userinput)[0]
        probability = model.predict_proba(userinput)[0][1]
        # st.success(f"✅ Predicted Diagnosis: *{prediction}*")
        # st.info(f"🧪 Probability of Alzheimer's: *{probability:.2f}*")
        
       # Add date, prediction, and probability to the input data
        userinput["assessment_date"] = assessment_date
        userinput["prediction"] = "High Risk" if prediction else "Low Risk"
        userinput["probability"] = round(probability, 2)
       
        # Determine risk level and style
        if probability <= 0.5:
            risk_level = "🟢  Low Risk"
            bg_color = "#d4edda"  # light green
            text_color = "#155724"
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
        
        # Assign Patient ID & Physician
        patient_id = get_patient_id(name, birthdate, df_existing)
        physician_id = st.session_state.physician_id
        
        # 🔢 Add tracking info to user input
        userinput["patient_id"] = patient_id
        userinput["name"] = name
        userinput["birthdate"] = birthdate.isoformat()
        userinput["assessment_date"] = assessment_date
        userinput["prediction"] = "High Risk" if prediction else "Low Risk"
        userinput["probability"] = round(probability, 2)
        userinput['physician_id'] = physician_id
        
        # new:
        insert_into_database(userinput)
        full_df = get_patient()

        # Save updated assessment
        # full_df = pd.concat([df_existing, userinput], ignore_index=True)
        # full_df.to_csv(save_path, index=False)
        st.success("Assessment saved. Patient ID: " + patient_id)
        
        patient_history = full_df[full_df["patient_id"] == patient_id]
    
        if not patient_history.empty:
            st.subheader(f"Assessment History for {name}")

            # Ensure datetime format
            patient_history["assessment_date"] = pd.to_datetime(patient_history["assessment_date"], errors="coerce").dt.date

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
            
            # Show recommendations if risk is > 20%
        if probability > 0.2:
            st.subheader("Lifestyle Recommendations")
            for rec in recommendations_data:
                feature_key = rec["feature"]
                condition = rec["condition"]

                if "_age" in feature_key and condition(age):
                    label = "Age-Related"
                elif "genetic_risk_factor" in feature_key and condition(genetic_risk):
                    label = "Genetic Risk"
                elif "family_history" in feature_key and condition(family_history):
                    label = "Family History"
                elif "social_engagement_level" in feature_key and condition(social_engagement):
                    label = "Social Engagement"
                elif "air_pollution_exposure" in feature_key and condition(air_pollution):
                    label = "Environmental Exposure"
                else:
                    continue

                st.markdown(f"""
                <div style='border: 1px solid #ddd; padding: 1rem; border-radius: 8px; margin-bottom: 10px;'>
                    <div style='font-weight: bold; font-size: 1.05rem; margin-bottom: 0.3rem;'>{label}</div>
                    <div style='font-size: 0.9rem;'>{rec['recommendation']}</div>
                </div>
                """, unsafe_allow_html=True)
    
    
    # --- Submit and Evaluate ---
    if st.button("Assess Cognitive Health Risk"):
        st.subheader("Preliminary Risk Insights")
        
        if name == "" or birthdate is None or age == 0:
            st.error("Please fill in all required fields: name, birthdate, and age.")
        else:
            # Proceed with assessment
            assessment_date = datetime.date.today()
            show_risk_level(model, userinput, name, birthdate, assessment_date)
    
        
    st.markdown("---")
    st.markdown("*This tool provides preliminary insight on a patient's potential risk of Alzheimer's and is not a clinical diagnosis.*")

def get_bmi_category(bmi):
    try:
        if bmi < 18.5:
            return "Underweight"
        elif bmi < 25:
            return "Normal"
        elif bmi < 30:
            return "Overweight"
        else:
            return "Obese"
    except:
        return "Unknown"

def patient_search_page():

    st.title("Patient Search")

    search_by = st.radio("Search by", ["Patient Name", "Patient ID"])
    search_term = st.text_input(f"Enter {search_by}")

    try:
        #df = pd.read_csv("Final_Project_UI/assessment_results.csv")
        df = st.session_state.patient_df
        # --- Show latest assessment per patient ---
       # st.markdown("#### Latest Visits")

        # Convert to datetime
      #  df["assessment_date"] = pd.to_datetime(df["assessment_date"], errors="coerce").dt.date

        # Sort by date and keep only latest record per patient_id
       # latest_visits_df = df.sort_values("assessment_date", ascending=False).drop_duplicates(subset=["patient_id"])

        # Select key columns to display
        #cols_to_display = [
          #  "patient_id", "name", "birthdate", "age", "gender", "assessment_date",
         #   "prediction", "probability"
       # ]

        # Ensure all columns are present
        #latest_visits_df = latest_visits_df[[col for col in cols_to_display if col in latest_visits_df.columns]]

        # Show in a clean table
      #  st.dataframe(
       #     latest_visits_df.sort_values(by="assessment_date", ascending=False).reset_index(drop=True),
        #    use_container_width=True
        #)
    except FileNotFoundError:
        st.warning("No assessment data found yet.")
        return

    if search_term:
        # Handle missing values in search
        if search_by == "Patient Name":
            filtered = df[df["name"].fillna('').str.lower().str.contains(search_term.strip().lower())]

        else:
            filtered = df[df["patient_id"].fillna('').str.contains(search_term.strip())]

        if not filtered.empty:
            st.success(f"Found {len(filtered)} record(s).")
            patient_ids = filtered["patient_id"].unique()

            for pid in patient_ids:
                st.markdown("<hr style='border: 2px solid #333;'>", unsafe_allow_html=True)
                st.subheader(f"Records for Patient ID: {pid}")
                patient_data = filtered[filtered["patient_id"] == pid].copy()
                patient_data["assessment_date"] = pd.to_datetime(patient_data["assessment_date"], errors="coerce")

                # Sort and select the most recent record
                latest = patient_data.sort_values("assessment_date", ascending=False).iloc[0]

                # --- Top panel layout ---
                st.markdown("#### Patient Summary")
                col1, col2, col3 = st.columns([2, 2, 1])
                ss_space =  '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'
                s_space =  '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'
                space6 = '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'
                space = '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'
                with col1:
                    st.markdown(f"**Name:**{space}&nbsp;{latest["name"]}")
                    st.markdown(f"**Gender:** {s_space}{latest["gender"]}")
                   
                with col2:
                    st.markdown(f"**Birthdate:** {space6}&nbsp;{latest["birthdate"]}")
                    st.markdown(f"**Age:**{space}{space6}{latest['age']}")

                with col3:
                    st.markdown("**Risk Assessment**")
                    if latest["prediction"] == "High Risk":
                        bg_color = "#dc3545"  # Strong red
                        text_color = "#ffffff"
                    elif latest["prediction"] == "Moderate Risk":
                        bg_color = "#ffc107"
                        text_color = "#000000"
                    else:
                        bg_color = "#28a745"
                        text_color = "#ffffff"
                    st.markdown(f"""
                    <div style='background-color:{bg_color}; color:{text_color}; 
                                padding: 1rem; border-radius: 8px; text-align: center; 
                                font-weight: bold; font-size: 1.1rem;'>
                        {latest["prediction"]}<br>
                        Probability: {latest["probability"]:.2f}
                    </div>
                    """, unsafe_allow_html=True)

                st.markdown("---")

                # --- Demographics Section ---
                st.markdown("#### Demographics")
                col1, col2, col3 = st.columns([2, 2, 1])
                with col1:
                    st.markdown(f"**Education:** {ss_space}{latest["education_level"]}")
                    st.markdown(f"**Income:** {s_space}&nbsp;&nbsp;&nbsp;{latest["income_level"]}")
                    st.markdown(f"**Employment:** &nbsp;&nbsp;&nbsp;{latest["employment_status"]}")
                with col2:
                    st.markdown(f"**Marital Status:** {ss_space}{ss_space}{latest["marital_status"]}")
                    st.markdown(f"**Living Environment:** {space6}{latest["urban_vs_rural_living"]}")

                
                # --- Medical History Section ---
                st.markdown("---")
                st.markdown("#### Medical & Genetic History")
                col1, col2, col3 = st.columns([2, 2, 1])
                with col1: 
                    # --- BMI + Category on same line ---
                    bmi_value = latest['bmi']
                    bmi_category = get_bmi_category(bmi_value)

                    # Define style colors per category
                    bmi_styles = {
                        "Underweight": {"bg": "#fff3cd", "text": "#856404"},
                        "Overweight": {"bg": "#fff3cd", "text": "#856404"},
                        "Obese": {"bg": "#f8d7da", "text": "#721c24"},
                    }

                    style = bmi_styles.get(bmi_category, {"bg": "#e2e3e5", "text": "#383d41"})  # fallback

                    st.markdown(f"""
                    <div style="display: flex; align-items: center; gap: 10px; margin-bottom: 12px;">
                        <div><strong>BMI:</strong>{space}{space6}</div>
                        <div>{bmi_value:.1f}</div>
                        <div style="background-color: {style['bg']}; color: {style['text']}; 
                                    padding: 3px 10px; border-radius: 6px; font-size: 0.85rem;">
                            {bmi_category}
                        </div>
                    </div>
                    """, unsafe_allow_html=True)
                    
                    # --- Diabetes
                    if str(latest['diabetes']).lower() == "yes":
                        st.markdown(f"**Diabetes:** {s_space}&nbsp;<span style='color: #dc3545; font-weight: bold;'>{latest['diabetes']} </span>", unsafe_allow_html=True)
                    else:
                        st.markdown(f"**Diabetes:** {s_space}&nbsp;{latest['diabetes']}")

                    # --- Hypertension
                    if str(latest['hypertension']).lower() == "yes":
                        st.markdown(f"**Hypertension:** &nbsp;&nbsp;&nbsp;<span style='color: #dc3545; font-weight: bold;'>{latest['hypertension']} </span>", unsafe_allow_html=True)
                    else:
                        st.markdown(f"**Hypertension:** &nbsp;&nbsp;&nbsp;{latest['hypertension']}")
                with col2: 
                    # --- Cholesterol ---
                    chol = latest["cholesterol_level"]
                    if str(chol).lower() == "high":
                        st.markdown(f"**Cholesterol:** {space}{ss_space}<span style='color: #dc3545; font-weight: bold;'>{chol}</span>", unsafe_allow_html=True)
                    else:
                        st.markdown(f"**Cholesterol:** {space}{ss_space}{chol}")

                    # --- Genetic Risk ---
                    genetic_risk = latest["genetic_risk_factor"]
                    if str(genetic_risk).lower() == "yes":
                        st.markdown(f"**Genetic Risk:** &nbsp;{s_space}{ss_space}<span style='color: #dc3545; font-weight: bold;'>Yes</span>", unsafe_allow_html=True)
                    else:
                        st.markdown(f"**Genetic Risk:** &nbsp;{s_space}{ss_space}{genetic_risk}")

                    # --- Family History ---
                    family_history = latest["family_history"]
                    if str(family_history).lower() == "yes":
                        st.markdown(f"**Family History:** {ss_space}{ss_space}<span style='color: #dc3545; font-weight: bold;'>Yes</span>", unsafe_allow_html=True)
                    else:
                        st.markdown(f"**Family History:** {ss_space}{ss_space}{family_history}")

                    # --- Cognitive Test Score with warning
                    cog_score = latest["cognitive_test_score"]
                    if pd.notnull(cog_score) and cog_score < 70:
                        st.markdown(f"""
                        **Cognitive Test Score:** {space6}{cog_score}&nbsp;
                        <span style='color: #721c24; background-color: #f8d7da; padding: 2px 8px; border-radius: 4px; font-size: 0.85rem;'>
                            Low
                        </span>
                        """, unsafe_allow_html=True)
                    else:
                        st.markdown(f"**Cognitive Test Score:** {ss_space}{cog_score}")

                # --- Lifestyle Section ---
                st.markdown("---")
                st.markdown("#### Lifestyle & Environmental Factors")
                col1, col2, col3 = st.columns([2, 2, 1])

                # Risk highlighting function
                def highlight(value, risks):
                    return f"<span style='color: #dc3545; font-weight: bold;'>{value}</span>" if str(value).lower() in risks else value

                with col1:
                    smoking = highlight(latest["smoking_status"], ["current"])
                    alcohol = highlight(latest["alcohol_consumption"], ["regularly"])
                    st.markdown(f"**Smoking:** {s_space}{space6}{smoking}", unsafe_allow_html=True)
                    st.markdown(f"**Alcohol:** {s_space}{space6}&nbsp;&nbsp;&nbsp;{alcohol}", unsafe_allow_html=True)
                    st.markdown(f"**Physical Activity:** &nbsp;&nbsp;{latest['physical_activity_level']}", unsafe_allow_html=True)
                    diet = highlight(latest["dietary_habits"], ["unhealthy"])
                    sleep = highlight(latest["sleep_quality"], ["poor"])
                    st.markdown(f"**Dietary Habits:** {space6}&nbsp;{diet}", unsafe_allow_html=True)
                    st.markdown(f"**Sleep Quality:** {ss_space}{sleep}", unsafe_allow_html=True)

                with col2:
                    stress = highlight(latest["stress_levels"], ["high"])
                    st.markdown(f"**Stress Levels:** {space}{space6}{stress}", unsafe_allow_html=True)
                    depression = highlight(latest["depression_level"], ["high"])
                    pollution = highlight(latest["air_pollution_exposure"], ["high"])
                    engagement = highlight(latest["social_engagement_level"], ["low"])
                    st.markdown(f"**Depression Level:** {s_space}{depression}", unsafe_allow_html=True)
                    st.markdown(f"**Air Pollution:** {space}{space6}&nbsp;{pollution}", unsafe_allow_html=True)
                    st.markdown(f"**Social Engagement:** {space6}&nbsp;&nbsp;{engagement}", unsafe_allow_html=True)
                    


                # --- Assessment Date ---
                st.markdown("<hr style='border: 2px solid #333;'>", unsafe_allow_html=True)
                st.markdown("#### Latest Assessment Date")
                st.info(f"{latest['assessment_date'].date() if pd.notnull(latest['assessment_date']) else 'N/A'}")

                # --- Chart Section ---
                st.markdown("#### Risk Probability Over Time")
                st.altair_chart(
                    alt.Chart(patient_data).mark_line(point=True).encode(
                        x="assessment_date:T",
                        y="probability:Q",
                        tooltip=["assessment_date:T", "probability:Q"]
                    ).properties(height=250),
                    use_container_width=True
                )
        else:
            st.warning("No matching records found.")

def population_overview_page():
    st.title("Population Overview")
    st.write("This section provides a snapshot of the patient population in the dataset.")

    # Load dataset
    data = pd.read_csv("Datasets/alzheimers_prediction_dataset_usa_lc.csv")
    data.rename(columns={"Alzheimer’s Diagnosis": "Alzheimer's Diagnosis"}, inplace=True)
    data.drop(columns=['country'], inplace=True)

    # Define continuous and categorical features
    con_features = ['age', 'education_level', 'bmi', 'cognitive_test_score']
    cat_features = data.select_dtypes(include='object').columns.drop("Alzheimer's Diagnosis")

    # --- Continuous Feature Plotting ---
    def plot_continuous_distributions(data, con_features):
        sns.set_palette(['#add8e6', '#ffcc99'])

        fig, ax = plt.subplots(len(con_features), 2, figsize=(15, 2.5 * len(con_features)), gridspec_kw={'width_ratios': [1, 2]})

        for i, col in enumerate(con_features):
            graph = sns.barplot(data=data, x="Alzheimer's Diagnosis", y=col, ax=ax[i, 0], palette=['#add8e6', '#ffcc99'])

            sns.kdeplot(data=data[data["Alzheimer's Diagnosis"] == 'No'], x=col, fill=True, ax=ax[i, 1], color='#add8e6', label='No')
            sns.kdeplot(data=data[data["Alzheimer's Diagnosis"] == 'Yes'], x=col, fill=True, ax=ax[i, 1], color='#ffcc99', label='Yes')

            ax[i, 1].set_yticks([])
            ax[i, 1].legend(loc='upper right')

            for cont in graph.containers:
                graph.bar_label(cont, fmt='%.1f')

        plt.tight_layout()
        st.pyplot(fig)

    # --- Categorical Feature Plotting ---
    def plot_categorical_distribution(data, cat_features):
        alz_yes = data[data["Alzheimer's Diagnosis"] == "Yes"]
        alz_no = data[data["Alzheimer's Diagnosis"] == "No"]

        n_features = len(cat_features)
        n_cols = 2  # Two plots per row
        n_rows = (n_features + n_cols - 1) // n_cols

        fig, ax = plt.subplots(n_rows, n_cols, figsize=(40, 10 * n_rows))  # Larger figure
        ax = ax.flatten()

        for i, col in enumerate(cat_features):
            yes_pct = alz_yes[col].value_counts(normalize=True).mul(100).sort_index()
            no_pct = alz_no[col].value_counts(normalize=True).mul(100).sort_index()
            all_categories = yes_pct.index.union(no_pct.index)

            yes_pct = yes_pct.reindex(all_categories, fill_value=0)
            no_pct = no_pct.reindex(all_categories, fill_value=0)

            plot_df = pd.DataFrame({'Yes': yes_pct, 'No': no_pct})

            plot_df.plot(kind='barh', ax=ax[i], color=['#ffcc99', '#add8e6'], width=0.6)

            for bar_group in ax[i].containers:
                for bar in bar_group:
                    width = bar.get_width()
                    if width > 0:
                        ax[i].text(width + 1.5, bar.get_y() + bar.get_height() / 2, f'{width:.1f}%',
                                va='center', ha='left', fontsize=12)

            ax[i].set_xlabel('Percentage', fontsize=34)
            ax[i].set_ylabel(col, fontsize=34)
            ax[i].set_title(col, fontsize=36)
            ax[i].tick_params(axis='both', labelsize=28)
            ax[i].grid(axis='x', linestyle='--', linewidth=0.7)
            ax[i].legend(title='', fontsize=32)

        for j in range(len(cat_features), len(ax)):
            ax[j].axis('off')

        plt.tight_layout()
        plt.subplots_adjust(top=1)
        st.pyplot(fig)
      # Plotting sections
    st.subheader("Distribution of Continuous Features")
    plot_continuous_distributions(data, con_features)

    st.subheader("Distribution of Categorical Features")
    plot_categorical_distribution(data, cat_features)

# Load patient data for physician
def load_patient_data(phy_id):
    conn = psycopg2.connect(
        dbname="HIS_FinalProject",
        user="dadb",
        password="",
        host="localhost",
        port="5432"
    )

    df = pd.read_sql("SELECT * FROM NewPatients", conn)
    conn.close()
    return pd.DataFrame(df)

def run_app():
    if selected == 'Patient Search':
        patient_search_page()  
    elif selected == 'Risk Assessment':
        assessment_page()
    elif selected == 'Population Overview':
        population_overview_page()


# --- AUTHENTICATION AND MAIN LOGIC ---
def logout():
    for key in ["logged_in", "patient_logged_in", "user_type", "patient_name", "patient_birthdate", "menu_selection"]:
        st.session_state.pop(key, None)
    
if menu == "Clinician Dashboard":
    if "logged_in" not in st.session_state:
        st.session_state.logged_in = False

    if not st.session_state.logged_in:
        st.title("Clinician Login")
        username_input = st.text_input("Username")  # physician_id
        password_input = st.text_input("Password", type="password")

        if st.button("Login"):
            try:
                # Connect to PostgreSQL
                conn = psycopg2.connect(
                    dbname="HIS_FinalProject",
                    user="dadb",
                    password="",
                    host="localhost",
                    port="5432"
                )
                cursor = conn.cursor()

                # Check credentials
                cursor.execute(
                    "SELECT physician_id FROM Physician WHERE physician_id = %s AND password = %s",
                    (username_input, password_input)
                )
                result = cursor.fetchone()

                if result:
                    # Save login state and load data
                    st.session_state.logged_in = True
                    st.session_state.user_type = "Clinician Dashboard"
                    st.session_state.physician_id = username_input

                    # ✅ Load and store only assigned patients
                    st.session_state.patient_df = load_patient_data(username_input)
                    print(st.session_state.patient_df)

                    st.rerun()
                else:
                    st.error("Incorrect username or password")
                conn.close()
            except Exception as e:
                st.error(f"Database error: {e}")

    if st.session_state.logged_in:
        with st.sidebar:
            selected = option_menu(
                menu_title="",
                options=["Risk Assessment", "Patient Search", "Population Overview"],
                icons=["clipboard", "search", "bar-chart"],
                default_index=0
            )
            st.button("Logout", on_click=logout)

        if selected == "Risk Assessment":
            assessment_page()
        elif selected == "Patient Search":
            patient_search_page()
        elif selected == "Population Overview":
            population_overview_page()


elif menu == "Patient Portal":
    if "patient_logged_in" not in st.session_state:
        st.session_state.patient_logged_in = False

    if not st.session_state.patient_logged_in:
        st.title("Patient Portal")
        patient_name_input = st.text_input("Enter your full name")
        birthdate_input = st.date_input("Enter your birthdate", min_value=datetime.date(1900, 1, 1))

        if st.button("Login to View My Results"):
            if patient_name_input.strip() == "" or birthdate_input is None:
                st.error("Please enter both your name and birthdate.")
            else:
                st.session_state.patient_logged_in = True
                st.session_state.user_type = "Patient Portal"
                st.session_state.patient_name = patient_name_input
                st.session_state.patient_birthdate = birthdate_input
                st.rerun()

    if st.session_state.get("patient_logged_in", False):
        patient_name_input = st.session_state.patient_name
        birthdate_input = st.session_state.patient_birthdate

        st.success(f"Welcome back, {patient_name_input}!")
        
        import hashlib
        def generate_patient_id(name, birthdate):
            unique_str = f"{name.strip().lower()}_{birthdate.isoformat()}"
            return hashlib.sha256(unique_str.encode()).hexdigest()[:8]

        patient_id = generate_patient_id(patient_name_input, birthdate_input)

        try:
            df = pd.read_csv("assessment_results.csv")
            history = df[df["patient_id"] == patient_id]

            if history.empty:
                st.info("No assessments found for this patient.")
            else:
                history["assessment_date"] = pd.to_datetime(history["assessment_date"], errors="coerce").dt.date

                st.markdown(f"### Assessment History")
                st.dataframe(history[["assessment_date", "prediction", "probability"]].sort_values("assessment_date", ascending=False))

                chart = alt.Chart(history).mark_line(point=True).encode(
                        x=alt.X('assessment_date:T', title='Assessment Date'),
                        y=alt.Y('probability:Q', title='Probability'),
                        tooltip=['assessment_date:T', 'probability:Q']
                    ).properties(title="Risk Probability Over Time")

                st.altair_chart(chart, use_container_width=True)
                
                latest_assessment = history.sort_values("assessment_date", ascending=False).iloc[0]

                st.subheader("📝 Personalized Lifestyle Recommendations")
                
                # Display general risk-based advice
                if latest_assessment["probability"] > 0.7:
                    st.warning("Your last assessment indicates a **high risk**. Please consider consulting your healthcare provider for additional treatment and implementing the following lifestyle changes.")
                elif latest_assessment["probability"] > 0.3:
                    st.info("Your last assessment indicates a **moderate risk**. Maintaining healthy habits is very important.")
                else:
                    st.success("Your last assessment indicates a **low risk**. Keep up the healthy lifestyle!")
                
                # --- Detailed Lifestyle Recommendations based on features ---
                recs = []
                
                # Check feature-specific advice
                if latest_assessment.get("social_engagement_level", "").lower() == "low":
                    recs.append("🔹 Increase social activities: join a club, volunteer, or schedule regular calls with friends and family.")
                
                if latest_assessment.get("air_pollution_exposure", "").lower() in ["medium", "high"]:
                    recs.append("🔹 Minimize outdoor exposure on high air quality index (AQI) days and consider using indoor air purifiers.")
                
                if latest_assessment.get("dietary_habits", "").lower() == "unhealthy":
                    recs.append("🔹 Improve dietary habits: incorporate more fruits, vegetables, and whole grains into your meals.")
                
                if latest_assessment.get("physical_activity_level", "").lower() == "low":
                    recs.append("🔹 Increase physical activity: aim for at least 150 minutes of moderate exercise per week.")
                
                if latest_assessment.get("sleep_quality", "").lower() == "poor":
                    recs.append("🔹 Prioritize good sleep hygiene: aim for 7-9 hours of quality sleep per night.")
                
                if latest_assessment.get("depression_level", "").lower() == "high":
                    recs.append("🔹 Consider seeking support for mood and mental health management.")
                
                if not recs:
                    st.write("✅ No additional lifestyle risk factors were detected in your last assessment.")
                else:
                    for rec in recs:
                        st.write(rec)

        except FileNotFoundError:
            st.error("No assessment data found.")

        st.sidebar.button("Logout", on_click=logout)