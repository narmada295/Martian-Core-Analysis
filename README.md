# Martian Core Analysis

## Overview

This project focuses on leveraging machine learning to model seismic wave propagation in Mars' interior. It involves generating synthetic seismic data, applying physics-based constraints, and detecting anomalies within seismic signals. The project includes the following modules:

**Module 6**: Preprocessing and analyzing seismic data for Mars.
**Module 7**: Generating synthetic seismic data with anomalies, applying anomaly detection techniques, and evaluating model performance.
**Module 8**: Using a PINN to model seismic wave propagation in Mars' crust and mantle, enforcing physical laws via wave equation residuals.

## Tech Stack

| Technology       | Purpose                     | Where & Why Used                                  |
| ---------------- | --------------------------- | ------------------------------------------------- |
| **Python**       | General-purpose programming | Entire project                                    |
| **Pytorch**      | Deep learning framework     | - Building and training the PINN                  |
| **Numpy**        | Numerical operations        | - Data manipulation and mathematical calculations |
| **ObsPy**        | Seismic data processing     | - Handling seismic waveform data                  |
| **Scikit-learn** | Machine learning            | - Anomaly detection and evaluation                |
| **Matplotlib**   | Data visualization          | - Plotting and evaluating predictions             |
| **Pandas**       | Data handling               | - Organizing seismic data and results             |

## Problem Statement and Approach

### Problem Statement:

The project aims to model seismic wave propagation in Mars' interior using synthetic seismic data and machine learning. The data is augmented with anomalies (such as spikes and frequency shifts) to test the effectiveness of anomaly detection models. Physics-informed constraints are applied to ensure the predictions are physically accurate.

### Approach:

1. **Seismic Data Preprocessing**: Clean and standardize seismic data, specifically focusing on Mars' seismic velocities (P-wave and S-wave).
2. **Synthetic Seismic Data Generation**: Introduce anomalies like spikes, dropout, noise bursts, and frequency shifts to normal seismic data for testing anomaly detection algorithms.
3. **Physics-Informed Neural Network (PINN)**: Build a neural network with physics-based constraints, trained on Mars seismic data to predict seismic velocity profiles.
4. **Anomaly Detection**: Train machine learning models like Random Forest and XGBoost to detect and classify anomalies in the synthetic data.

## Modules Overview

### Module 6: Seismic Data Preprocessing

**Objective**: Preprocess seismic data, calculate velocities, and structure it for further analysis.
**Techniques Used**: Data standardization, velocity calculations, and feature engineering.

### Module 7: Synthetic Data Generation and Anomaly Detection

**Objective**: Generate synthetic seismic data with various anomalies and apply machine learning techniques to detect these anomalies.
**Techniques Used**: Anomaly simulation, feature extraction, and model evaluation using Random Forest and XGBoost.

## Module 8: Physics-Informed Neural Network for Seismic Modeling

**Objective**: Train a PINN to model seismic wave propagation, incorporating physical constraints like wave equations for better predictions.
**Techniques Used**: Physics-informed loss function, automatic differentiation for residuals, and Tanh activation functions.

## Code Flow Summary

| **Step**                        | **Description**                                                                   | **Module** |
| ------------------------------- | --------------------------------------------------------------------------------- | ---------- |
| Data Preprocessing              | Load, clean, and standardize seismic data                                         | Module 6   |
| Synthetic Data Generation       | Generate seismic data with anomalies and shadow zonestransform                    | Module 7   |
| PINN Model Training             | Train a physics-informed neural network (PINN) for seismic modeling               | Module 8   |
| Shadow Zone Classification      | Classify seismic data into shadow and non-shadow zones                            | Module 7   |
| Anomaly Detection               | Detect anomalies (spikes, dropouts, noise bursts, etc.) in synthetic seismic data | Module 7   |
| Feature Extraction & Evaluation | Extract features from synthetic data and evaluate model performance               | Module 7   |

## Future Enhancements

- Advanced Anomaly Detection: Implement deep learning models for real-time anomaly detection in seismic data.
- Model Improvement: Integrate more complex physical constraints for more accurate predictions.
- Real-time Integration: Extend the system to process real-time seismic data from Mars.
