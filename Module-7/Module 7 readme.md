# Module 7: Predicting Core Radius using Regression

## Overview

Module 7 focuses on processing seismic data to predict core radius values using machine learning models. The module reads and processes data from seismic datasets, computes relevant features, and trains machine learning models like Random Forest and XGBoost to predict the core radius of Mars based on seismic properties.

## Tech Stack

| Technology       | Purpose                     | Where & Why Used                                                |
| ---------------- | --------------------------- | --------------------------------------------------------------- |
| **Python**       | General-purpose programming | Entire module                                                   |
| **Pandas**       | Data handling               | - Managing and processing seismic data                          |
| **Numpy**        | Numerical computations      | - mathematical operations                                       |
| **ObsPy**        | Seismic data processing     | - Reading seismic waveform data                                 |
| **Scikit-learn** | Machine Learning            | - Model Training                                                |
| **Matplotlib**   | Data visualization          | - Plotting waveform data                                        |
| **XGBoost**      | Machine Learning            | - Regression model for core radius prediction                   |
| **Glob**         | File Management             | - Managing file inputs and processing multiple seismic datasets |

## Problem Statement and Approach

### Problem Statement:

Seismic data from various sources contain information about the physical properties of the Earth’s interior. The challenge is to process and analyze this data to predict the core radius based on seismic velocities and other related properties.

### Approach to Solve the Problem:

1. **Data Acquisition**: Collect seismic data from multiple files in different formats (such as .bm).
2. **Data Preprocessing**: Filter and process the data to retain essential features.
3. **Feature Extraction**: Compute derived features such as P-wave velocity (P_v) and S-wave velocity (S_v) based on seismic data.
4. **Model Training**: Use Random Forest and XGBoost for regression tasks to predict the core radius from seismic features.
5. **Model Evaluation**: Evaluate the models using cross-validation and performance metrics like mean absolute error (MAE) and percentage error.

## Functionality and Workflow

### Step 1: Preparing the Dataset

**Function**: preprocess_data(file_paths)
**Process**:

- Load seismic data files using glob and pandas.
- Ensure all necessary columns (radius, vpv, vsv, vph, vsh, rho) are present.
- Filter and compute derived columns like P-wave and S-wave velocities (P_v and S_v).
- Save the cleaned dataset for model training.

### Step 2: Model Training with Random Forest

**Function**: train_random_forest_model(data)
**Process**:
-Prepare the features and target variables (radius).
-Split the data into training and test sets.
-Train the Random Forest model.
-Perform Grid Search to find the optimal hyperparameters for better performance.
-Evaluate the model using mean absolute error (MAE) and percentage error.

### Step 3: Model Training with XGBoost

**Function**: train_xgboost_model(data)
**Process**:
-Similar to Random Forest, but with the XGBoost regressor for better performance in certain datasets.
-Perform Grid Search to tune hyperparameters for optimal results.
-Evaluate the model and print performance metrics.

**Step 4**: Evaluation and Comparison
**Function**: evaluate_models()
**Process**:
-Compare the results from both Random Forest and XGBoost using cross-validation and test dataset.
-Output the best-performing model based on MAE and percentage error.

## Code Flow Summary

| **Step**            | **Description**                                 | **Function Used**             |
| ------------------- | ----------------------------------------------- | ----------------------------- |
| Data Preprocessing  | Load, filter, and process seismic data          | `preprocess_data()`           |
| Random Forest Model | Train and evaluate using Random Forest          | `train_random_forest_model()` |
| XGBoost Model       | Train and evaluate using XGBoost                | `train_xgboost_model()`       |
| Model Evaluation    | Compare model performances and evaluate results | `evaluate_models()`           |

## Future Enhancements

- Hyperparameter Optimization: Integrate more advanced optimization techniques like Bayesian Optimization or Genetic Algorithms for model tuning.
- Deep Learning Models: Investigate the potential of deep learning models (e.g., neural networks) for seismic data prediction.
- Real-Time Seismic Prediction: Extend the functionality to process real-time seismic data for predicting core radius in dynamic scenarios.

By processing and analyzing seismic data using advanced machine learning techniques, this module helps in the prediction of core radius based on seismic properties, aiding further geophysical research.
